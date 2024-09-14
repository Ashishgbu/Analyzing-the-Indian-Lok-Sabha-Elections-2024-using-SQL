# Analyzing-the-Indian-Lok-Sabha-Elections-2024-using-SQL
Data Analysis Project - Analyzing the Indian Lok Sabha Elections 2024 using SQL

-- sql command line
LOAD DATA INFILE "D:/Gautam buddha university/first semester/1.Anudeep Foundation/SQL/Project/Indian Election SQL Project/states.csv"
INTO TABLE states
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;



