-- Databricks notebook source
select * from healthdata

-- COMMAND ----------

--What is the total number of documents in the collection?
select count(*) from healthdata


-- COMMAND ----------

--What is the distribution of documents in the collection based on the 'Topic’? 

SELECT Topic, COUNT(*) AS count
FROM healthdata
GROUP BY Topic;

-- COMMAND ----------

--What is the average percentage of arthritis cases among older adults annually, and how does it vary over the years? 

WITH matched_data AS (
    SELECT *
    FROM healthdata
    WHERE Topic = 'Arthritis among older adults'
)
SELECT
    YearStart,
    AVG(Data_Value) AS average_percentage
FROM
    matched_data
GROUP BY
    YearStart
ORDER BY
    YearStart;


-- COMMAND ----------

--How does the distribution of data vary across different?
categories like age, race and gender?

SELECT
    StratificationCategoryID2,
    COUNT(*) AS count
FROM
    healthdata
GROUP BY
    StratificationCategoryID2;


-- COMMAND ----------

--How does the average data value vary across different combinations of starting year and topic, and how does this variation change over time?

WITH grouped_data AS (
    SELECT
        YearStart,
        Topic,
        AVG(Data_Value) AS average_data_value
    FROM
        healthdata
    GROUP BY
        YearStart,
        Topic
)
SELECT
    YearStart,
    Topic,
    average_data_value
FROM
    grouped_data
ORDER BY
    YearStart;

