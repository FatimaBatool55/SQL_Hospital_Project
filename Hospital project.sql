DROP TABLE Hospital;
CREATE TABLE Hospital (
    "Hospital Name" VARCHAR(300),
    "Location" VARCHAR(150),
    "Department" VARCHAR(100),
    "Doctors Count" INTEGER,
    "Patients Count" INTEGER,
    "Admission Date" DATE,
    "Discharge Date" DATE,
    "Medical Expenses" FLOAT
);
SELECT * FROM Hospital;
--1. Total Number of Patients
SELECT SUM("Patients Count") AS total_patients
FROM hospital;

--2. Average Number of Doctors per Hospital
SELECT "Hospital Name", AVG("Doctors Count") AS average_doctors
FROM hospital
GROUP BY "Hospital Name";

--3. Top 3 Departments with the Highest Number of Patients
SELECT "Department", SUM("Patients Count") AS total_patients
FROM hospital
GROUP BY "Department"
ORDER BY total_patients DESC
LIMIT 3;

--4. Hospital with the Maximum Medical Expenses
SELECT "Hospital Name", MAX("Medical Expenses") AS max_expenses
FROM hospital
GROUP BY "Hospital Name"
ORDER BY max_expenses DESC
LIMIT 1;

--5. Daily Average Medical Expenses
SELECT "Hospital Name", 
       SUM("Medical Expenses") / COUNT(DISTINCT "Admission Date") AS daily_average_expenses
FROM hospital
GROUP BY "Hospital Name";

--6. Longest Hospital Stay
SELECT "Hospital Name", 
       "Patients Count", 
       "Admission Date", 
       "Discharge Date", 
       (("Discharge Date" - "Admission Date")::int) AS length_of_stay
FROM hospital
ORDER BY length_of_stay DESC
LIMIT 1;

--7. Total Patients Treated Per City
SELECT "Location", SUM("Patients Count") AS total_patients
FROM hospital
GROUP BY "Location";

--8. Average Length of Stay Per Department
SELECT "Department", 
       AVG(("Discharge Date" - "Admission Date")::int) AS average_length_of_stay
FROM hospital
GROUP BY "Department";

--9. Identify the Department with the Lowest Number of Patients
SELECT "Department", SUM("Patients Count") AS total_patients
FROM hospital
GROUP BY "Department"
ORDER BY total_patients ASC
LIMIT 1;

--10. Monthly Medical Expenses Report
SELECT DATE_TRUNC('month', "Admission Date") AS month, 
       SUM("Medical Expenses") AS total_expenses
FROM hospital
GROUP BY month
ORDER BY month;
