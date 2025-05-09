
-- Select transcation from database in each month from a specific Year
SELECT Month,sum(Gross_Amount) AS Gross_Amount,sum(Settlement_Net_Amount) AS Settlement_Net_Amount
		,sum(COGS) AS COGS,sum(Net_Profit) AS Net_Profit
from transactions 
WHERE Year =2024
group by Month;

-- Select transcation from database in each month 
SELECT Year, Month, Gross_Amount, Settlement_Net_Amount, COGS, Net_Profit,
       (Gross_Amount - Settlement_Net_Amount - COGS - Net_Profit) AS Taxes
FROM transactions
ORDER BY Year, Month;

-- Select transcation from database in each month from a specific Year with taxes
SELECT  Month,sum(Gross_Amount) AS Gross_Amount,sum(Settlement_Net_Amount) AS Settlement_Net_Amount
		,sum(COGS) AS COGS,sum(Net_Profit) AS Net_Profit,
	sum( Gross_Amount -Settlement_Net_Amount - COGS - Net_Profit ) AS Taxes
FROM transactions 
WHERE Year = 2024 
GROUP BY Month ;

-- selct Total of Gross Amount and Amount that sattlement and Net Profit in a specific Year
SELECT Year , sum(Gross_Amount) AS Gross_Amount, sum(Settlement_Net_Amount) AS Settlement_Net_Amount,
			sum(COGS) AS COGS, sum(Net_Profit) AS Net_Profit 
FROM transactions
GROUP BY Year;

-- Know Number of transaction in database
SELECT count(*) AS Num_Of_transaction 
FROM transactions;

-- Get Net Amount in every month in every year
SELECT Month , sum(Net_Profit) AS Net_profit
FROM transactions
WHERE Year = 2024
GROUP BY Month;

-- Get Net Profit in quarter in specific Year
SELECT Quarter , sum(Net_Profit) AS Net_Profit 
FROM transactions
WHERE year=2022
GROUP BY Quarter;

-- Top 10 Merchant that have maximum net profit 
SELECT Merchants_Name , count(Merchant_Reference_ID) AS Num_Of_Trans ,sum(Net_Profit) AS Net_Profit
FROM transactions 
GROUP BY Merchants_Name
ORDER BY Net_Profit DESC
LIMIT 10;

-- Top 10 Merchant that have maximum net profit in specific year and month
SELECT Merchants_Name , count(Merchant_Reference_ID) AS Num_Of_Trans ,sum(Net_Profit) AS Net_Profit
FROM transactions 
WHERE (Year = 2024 and Month='January')
GROUP BY Merchants_Name
ORDER BY Net_Profit DESC;


-- Get Lowest 10 Merchant in database
SELECT Merchants_Name , count(Merchant_Reference_ID) AS Num_Of_Trans , sum(Net_Profit) AS Net_Profit
FROM transactions
GROUP BY Merchants_name
ORDER BY Net_Profit 
LIMIT 10;

-- get Merchant Category and number of transacitons
SELECT Mcc_Type, count(Merchant_Reference_ID) AS Num_Of_Trans ,sum(Net_Profit) AS Net_Profit
FROM transactions 
GROUP BY Mcc_Type
ORDER BY Net_Profit DESC;

-- get percent for each Merchant Category 
SELECT Mcc_Type, count(Merchant_Reference_ID) AS Num_Of_Trans ,sum(Net_Profit) AS Net_Profit ,sum(Net_Profit)/(SELECT sum(Net_Profit)FROM transactions)*100 AS Percent_Net_Profit
FROM transactions 
GROUP BY Mcc_Type
ORDER BY Net_Profit DESC;

-- get Merchant Category and number of transacitons in specific time
SELECT Mcc_Type, count(Merchant_Reference_ID) AS Num_Of_Trans ,sum(Net_Profit) AS Net_Profit
FROM transactions 
WHERE (Year = 2024 and Month='January')
GROUP BY Mcc_Type
ORDER BY Net_Profit DESC;

-- select merchants name in earch Marchant Type 
-- Here Have three Mcc Type
		-- Transportaion
        -- Home Applicances
        -- Low Ticket Size
SELECT Merchants_Name,count(Merchant_Reference_ID) AS Num_Of_Trans,sum(Net_Profit) AS Net_Profit
FROM transactions 
WHERE Mcc_Type = "Transportation"
GROUP BY Merchants_name
ORDER BY Net_Profit;

-- check for all status in our transactions
		-- Authorized
        -- Reconciliation initiated
        -- Paid to payment in advance
        -- Reversed
        -- Settled to merchant
        -- Paid to merchant
SELECT Date , count(Merchant_Reference_ID) AS Num_Of_Trans,sum(Gross_Amount) as Gross_Amount
			, sum(Settlement_Net_Amount) AS Settlement_Net_Amount
FROM transactions
WHERE Status = 'Reconciliation initiated' and Year =2024
GROUP BY Date;

-- All Reversed by Merchant Category
SELECT Mcc_Type,count(Merchant_Reference_ID) as Merchant_Reference_ID, sum(Gross_Amount) AS Gross_Amount
FROM transactions 
WHERE Status = 'Reversed'
GROUP BY Mcc_type;

-- Sattled to merchant table
SELECT Settled_to_Merchant ,count(Merchant_Reference_ID) as Merchant_Reference_ID, sum(Gross_Amount) AS Gross_Amount,
		sum(Net_Profit) AS Net_Profit
FROM transactions 
GROUP BY Settled_to_Merchant;

-- Card Type table
SELECT Card_Type ,count(Merchant_Reference_ID) AS num_of_trans ,sum(Net_Profit) AS Net_Profit
		, sum(Net_Profit)/(SELECT sum(Net_Profit) from transactions)*100 as percent
FROM transactions 
GROUP BY Card_Type;

-- Payment Method
SELECT Payment_Method ,count(Merchant_Reference_ID) AS num_of_trans 
		, count(Merchant_Reference_ID)/(SELECT count(Merchant_Reference_ID) from transactions)*100 as percent_of_trans
FROM transactions 
GROUP BY Payment_Method;
SELECT count(*) FROM transactions;




