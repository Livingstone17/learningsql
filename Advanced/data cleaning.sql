-- Data Cleaning
-- This involves the process of refining your data to make analysis easier


SELECT *
FROM layoffs;


-- 1. Remove Duplicates
-- 2. Standardize the Data
-- 3. Handle Null vaues or blank values
-- 4. Remove any columns...


-- copy all data in the layoffs table into the staging table
CREATE TABLE layoffs_staging
LIKE layoffs;

SELECT *
FROM layoffs_staging;

INSERT layoffs_staging
SELECT *
FROM layoffs;

-- REMOVING DUPLICATES
SELECT *,
ROW_NUMBER() OVER(
PARTITION BY company, industry, total_laid_off,percentage_laid_off, `date`) AS row_num
FROM layoffs_staging;

WITH duplicate_cte AS 
(
SELECT *,
ROW_NUMBER() OVER(
PARTITION BY company,location,stage,funds_raised_millions,country, industry, total_laid_off,percentage_laid_off, `date`) AS row_num
FROM layoffs_staging
)
SELECT * 
FROM duplicate_cte
WHERE row_num > 1;

CREATE TABLE `layoffs_staging3` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
   `row_num` INT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

SELECT * FROM layoffs_staging3;

INSERT INTO layoffs_staging3
SELECT *,
ROW_NUMBER() OVER(
PARTITION BY company,location,industry,total_laid_off,`date`,stage,country,funds_raised_millions) AS row_num
FROM layoffs_staging;

SELECT * 
FROM layoffs_staging3
WHERE row_num > 1;

DELETE 
FROM layoffs_staging3
WHERE row_num > 1;


-- STANDARDIZING DATA
-- This means finding issues in your data and fixing it

-- get rid of whitespaces in company column
SELECT company, TRIM(company)
FROM layoffs_staging3;

-- append the value of trimmed company to the company column
UPDATE layoffs_staging3
SET company = TRIM(company);

SELECT *
FROM layoffs_staging3
WHERE industry LIKE 'Crypto%';

-- replace occurences that has crypto in them with crypto
UPDATE layoffs_staging3
SET industry = 'Crypto'
WHERE industry LIKE 'Crypto%';

SELECT *
FROM layoffs_staging3
WHERE country LIKE 'United States%'
ORDER BY 1;

UPDATE layoffs_staging3
SET country = 'United States'
WHERE country LIKE 'United States%';

-- convert the date data type from text to datetime
SELECT `date`,
STR_TO_DATE(`date`, '%m/%d/%Y')
FROM layoffs_staging3;

UPDATE layoffs_staging3
SET `date` = STR_TO_DATE(`date`, '%m/%d/%Y')
WHERE `date`;

-- to change the data type of the date in the table, we use the modify clause

ALTER TABLE layoffs_staging3
MODIFY COLUMN `date` DATE;


-- WORKING WITH NULL AND BLANK VALUES
SELECT *
FROM layoffs_staging3
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL;

SELECT *
FROM layoffs_staging3
WHERE industry IS NULL 
OR industry = '';
