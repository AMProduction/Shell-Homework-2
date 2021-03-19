#!/bin/bash
#Version 3.0
#Released 2021-03-12

#Inputs parameters: a path to the original file and years to process (yyyy-yyyy)
#Inputs parameters check
#Check if we have only 2 input parameters
if [ $# -ne 2 ]; then
    exit 4
fi
#Check if the file exists in the given path
if [ ! -e $1 ]; then
    exit 3
fi

#Variables initialization
path=$1
inp_years=$2
temp_output_file_1="temp_1.csv"
temp_output_file_2="temp_2.csv"
final_output_file="temperature.csv"

start_year=$(echo $inp_years | cut -f1 -d'-')
end_year=$(echo $inp_years | cut -f2 -d'-')

#Check if the year to process is presented in the input file (1991-2016 years available)
if [[ $start_year =~ 199[1-9]|200[0-9]|201[0-6] ]] && [[ $end_year =~ 199[1-9]|200[0-9]|201[0-6] ]] && [[ $start_year -le $end_year ]]; then
    echo "Input parameters ok"
else
    #If not - Error and exit
    echo "Input parameters error!"
    exit
fi

#Initial filtration and clearing the source file. Output to temporary files
echo "Transformation is started..."
#Remove 1st line with column names
sed '1d' $path >$temp_output_file_1
#Only data from “Temperature - (Celsius)”, “Year” and “Country” fields should stay in the transformed file
for ((i = $start_year; i <= $end_year; i++)); do
    grep $i $temp_output_file_1 | cut -d',' -f1,2,4 >>$temp_output_file_2
done

# Delete empty values 
awk -F"," '$1!="" && $2!="" ' $temp_output_file_2 > temperature.csv
# Replacing empty country to "unknown" 
awk ' BEGIN { FS = OFS = "," } { if($3=="") $3 = "unknown" }; 1 ' temperature.csv  > $temp_output_file_1
cat $temp_output_file_1 > temperature.csv

#Delete temporary files
rm -f temp_1.csv
rm -f temp_2.csv
echo "The file temperature.csv is created successfully"