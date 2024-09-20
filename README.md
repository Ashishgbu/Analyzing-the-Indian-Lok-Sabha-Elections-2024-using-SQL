# Analyzing the Indian Lok Sabha Elections 2024 using SQL

This project focuses on analyzing the results of the Indian Lok Sabha Elections 2024 using SQL queries to derive insights from the election data. The database includes information on constituencies, parties, candidates, and election results.

## Database Structure

### Tables

- **elections**: Main database containing election-related data.
- **constituencywise_results**: Results of each constituency.
- **statewise_results**: Results aggregated by state.
- **partywise_results**: Details about parties and their performance.
- **states**: List of states in India.

### Loading Data

To load the state data into the database, use the following SQL command:

```sql
LOAD DATA INFILE "D:/Gautam buddha university/first semester/1.Anudeep Foundation/SQL/Project/Indian Election SQL Project/states.csv"
INTO TABLE states
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
