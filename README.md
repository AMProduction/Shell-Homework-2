# Shell Homework 2
### **Preface**
You have 1 file GlobalLandTemperaturesByCountry.csv attached in your variant folder with data about average temperature by country and year. In general, your task is to create a script to validate and transform data for further processing by Hive and Spark engines.  
Artifacts of the home task are 2 files - script with a name like “shell_hometask_<variant_number>.sh” and transformed file with name – “temperature.csv” 
### **Requirements:**
1. Script should process 2 input params – path to the original file and list of the years to process (5 points). You should also implement input parameters check: 
   1. Check if the file exists in the given path - if not script should exit with error code ‘3’ 
   1. Check if we have only 2 input parameters – if it has more or less input params script should fail with error code ‘4’ 
1. For GlobalLandTemperaturesByCountry.csv you need to transform and clear file and move clear data to new file – “temperature.csv”: 
   1. Remove 1st line with column names (5 points). 
   1. Keep data only for the period from 2010-2014 (5 points). 
   1. Only data from “Temperature - (Celsius)”, “Year” and “Country” fields should stay in the transformed file (5 points). 
   1. If you have incomplete data in “Temperature - (Celsius)”, “Year” fields – those rows should be removed from dataset (5 points) 
   1. If you have incomplete data in “Country” field – those values should be replaced to “unknown” value (5 points) 
