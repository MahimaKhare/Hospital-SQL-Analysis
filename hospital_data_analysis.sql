-- 1. Total Number of Patients 
SELECT COUNT(PATIENTS_COUNT)  
AS TOTAL_Patients  
FROM HOSPITAL_DATA; 
 
 
-- 2. Average Doctors per Hospital 
SELECT Hospital_Name, AVG(Doctors_Count)  
AS Average_Doctors 
FROM hospital_data 
GROUP BY HOSPITAL_NAME 
ORDER BY HOSPITAL_NAME 
 
    
-- 3. Top 3 Departments with the Highest Number of Patients 
SELECT Department, SUM(Patients_Count) AS Total_Patients 
FROM hospital_data 
GROUP BY Department 
ORDER BY Total_Patients DESC 
LIMIT 3; 
 
 
-- 4. Hospital with the Maximum Medical Expenses 
SELECT Hospital_Name, SUM(Medical_Expenses) AS Total_Expenses 
FROM hospital_data 
GROUP BY Hospital_Name 
ORDER BY Total_Expenses DESC 
LIMIT 1; 
 
-- 5. Daily Average Medical Expenses 
SELECT Hospital_Name, 
AVG(Medical_Expenses / DATEDIFF(Discharge_Date, Admission_Date))  
AS  Daily_Avg_Expenses FROM hospital_data 
WHERE DATEDIFF(Discharge_Date, Admission_Date) > 0 
GROUP BY Hospital_Name; 
 
-- 6. Longest Hospital Stay 
SELECT * From Hospital_data,  
DATEDIFF(Discharge_Date, Admission_Date) AS Stay_Duration 
FROM hospital_data 
ORDER BY Stay_Duration DESC 
LIMIT 1; 
 
 
-- 7. Total Patients Treated Per City 
SELECT Location, SUM(Patients_Count) AS Total_Patients 
FROM hospital_data 
GROUP BY Location; 
 
--8. Average Length of Stay Per Department 
SELECT Department,  
AVG(DATEDIFF(Discharge_Date, Admission_Date)) AS Avg_Stay 
FROM hospital_data 
GROUP BY Department; 
 
--9. Identify the Department with the Lowest Number of Patients 
SELECT Department, SUM(Patients_Count) AS Total_Patients 
FROM hospital_data 
GROUP BY Department 
ORDER BY Total_Patients ASC 
LIMIT 1; 
 
--10. Monthly Medical Expenses Report 
SELECT DATE_FORMAT(Admission_Date, '%Y-%m') AS Month, 
SUM(Medical_Expenses) AS Monthly_Expenses 
FROM hospital_data 
GROUP BY Month 
ORDER BY Month;