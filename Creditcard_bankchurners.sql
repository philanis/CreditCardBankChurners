/*shows table as is from original source*/
SELECT * FROM creditcard.bankchurners;

/*Distribution of Attrited(Lost/Defected) customers based on Age range*/
SELECT CASE WHEN Customer_Age<20 THEN "0-20" WHEN Customer_Age BETWEEN 20 AND 30 THEN "20-30"
WHEN Customer_Age BETWEEN 30 AND 40 THEN "30-40" WHEN Customer_Age BETWEEN 40 AND 50 THEN "40-50"
WHEN Customer_Age BETWEEN 50 AND 60 THEN "50-60" WHEN Customer_Age BETWEEN 60 AND 70 THEN "60-70"
WHEN Customer_Age BETWEEN 70 AND 80 THEN "70-80" WHEN Customer_Age>80 THEN "Above 80" END AS Age_Range, COUNT(*)
FROM creditcard.bankchurners
WHERE Attrition_Flag ="Attrited Customer"
GROUP BY Age_Range
ORDER BY Age_Range;

/*Number of Males vs Females in Existing and Attrited customers*/
SELECT SUM(IF(Gender = "M",1,"NULL")) AS MaleExistingCustomers, SUM(IF(Gender = "F",1,"NULL")) AS FemaleExistingCustomers
FROM creditcard.bankchurners
WHERE Attrition_Flag = "Existing Customer";

SELECT SUM(IF(Gender = "M",1,"NULL")) AS MaleExistingCustomers, SUM(IF(Gender = "F",1,"NULL")) AS FemaleExistingCustomers
FROM creditcard.bankchurners
WHERE Attrition_Flag = "Attrited Customer";

/*Dependent Count distribution of existing and attrited customers*/
SELECT Dependent_count, COUNT(*)
FROM creditcard.bankchurners
WHERE Attrition_Flag ="Attrited Customer"
GROUP BY Dependent_count
ORDER BY Dependent_count;

SELECT Dependent_count, COUNT(*)
FROM creditcard.bankchurners
WHERE Attrition_Flag ="Existing Customer"
GROUP BY Dependent_count
ORDER BY Dependent_count;

/*Education level distribution of existing and attrited customers*/
SELECT Education_level, COUNT(*)
FROM creditcard.bankchurners
WHERE Attrition_Flag ="Existing Customer"
GROUP BY Education_level
ORDER BY Count(*);

SELECT Education_level, COUNT(*)
FROM creditcard.bankchurners
WHERE Attrition_Flag ="Attrited Customer"
GROUP BY Education_level
ORDER BY Count(*);

/*Marital Status distribution of existing and attrited customers*/
SELECT Marital_Status, COUNT(*)
FROM creditcard.bankchurners 
WHERE Attrition_Flag ="Attrited Customer"
GROUP BY Marital_Status
ORDER BY Count(*);

SELECT Marital_Status, COUNT(*)
FROM creditcard.bankchurners 
WHERE Attrition_Flag ="Existing Customer"
GROUP BY Marital_Status
ORDER BY Count(*);

/*Card Category wise distribution of existing and attrited customers*/
SELECT Card_Category, COUNT(*)
FROM creditcard.bankchurners 
WHERE Attrition_Flag ="Attrited Customer"
GROUP BY Card_Category
ORDER BY Count(*);

SELECT Card_Category, COUNT(*)
FROM creditcard.bankchurners 
WHERE Attrition_Flag ="Existing Customer"
GROUP BY Card_Category
ORDER BY Count(*);

/*Distribution of attrited customers based on months on book*/
SELECT CASE WHEN Months_on_book < 20 THEN "0-20" WHEN Months_on_book BETWEEN 20 AND 30 THEN "20-30"
WHEN Months_on_book BETWEEN 30 AND 40 THEN "30-40" WHEN Months_on_book BETWEEN 40 AND 50 THEN "40-50"
WHEN Months_on_book BETWEEN 50 AND 60 THEN "50-60" WHEN Months_on_book > 60 THEN "Above 60" END AS MonthonBook_Range, COUNT(*)
FROM creditcard.bankchurners
WHERE Attrition_Flag ="Attrited Customer"
GROUP BY MonthonBook_Range
ORDER BY MonthonBook_Range;


/*Existing and attrited customers based on Inactive months*/
SELECT Months_Inactive_12_mon, COUNT(*)
FROM creditcard.bankchurners 
WHERE Attrition_Flag ="Existing Customer"
GROUP BY Months_Inactive_12_mon
ORDER BY Count(*);

SELECT Months_Inactive_12_mon, COUNT(*)
FROM creditcard.bankchurners 
WHERE Attrition_Flag ="Attrited Customer"
GROUP BY Months_Inactive_12_mon
ORDER BY Count(*);


/*Existing and attrited customers based on Average Utilization*/
SELECT Attrition_Flag, ROUND(AVG(Avg_Utilization_Ratio)*100,2) AS Avg_Utilization 
FROM creditcard.bankchurners
WHERE Attrition_Flag = "Attrited Customer";

SELECT Attrition_Flag, ROUND(AVG(Avg_Utilization_Ratio)*100,2) AS Avg_Utilization 
FROM creditcard.bankchurners
WHERE Attrition_Flag = "Existing Customer";