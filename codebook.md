This codebook describes the variables, the data, and any transformations or work performed to clean up the data

1. Dataset structure
'data.frame':	2075259 obs. of  9 variables:
 $ Date                 : chr  "16/12/2006" "16/12/2006" "16/12/2006" "16/12/2006" ...
 $ Time                 : chr  "17:24:00" "17:25:00" "17:26:00" "17:27:00" ...
 $ Global_active_power  : num  4.22 5.36 5.37 5.39 3.67 ...
 $ Global_reactive_power: num  0.418 0.436 0.498 0.502 0.528 0.522 0.52 0.52 0.51 0.51 ...
 $ Voltage              : num  235 234 233 234 236 ...
 $ Global_intensity     : num  18.4 23 23 23 15.8 15 15.8 15.8 15.8 15.8 ...
 $ Sub_metering_1       : num  0 0 0 0 0 0 0 0 0 0 ...
 $ Sub_metering_2       : num  1 1 2 1 1 2 1 1 1 2 ...
 $ Sub_metering_3       : num  17 16 17 17 17 17 17 17 17 16 ...

2. Key to Variables
> names(d)
[1] "Date"                  "Time"                  "Global_active_power"   "Global_reactive_power"
[5] "Voltage"               "Global_intensity"      "Sub_metering_1"        "Sub_metering_2"       
[9] "Sub_metering_3"  

3. Example Data
      Date     Time Global_active_power Global_reactive_power Voltage Global_intensity
1 16/12/2006 17:24:00               4.216                 0.418  234.84             18.4
2 16/12/2006 17:25:00               5.360                 0.436  233.63             23.0
3 16/12/2006 17:26:00               5.374                 0.498  233.29             23.0
4 16/12/2006 17:27:00               5.388                 0.502  233.74             23.0
5 16/12/2006 17:28:00               3.666                 0.528  235.68             15.8
6 16/12/2006 17:29:00               3.520                 0.522  235.02             15.0
  Sub_metering_1 Sub_metering_2 Sub_metering_3
1              0              1             17
2              0              1             16
3              0              2             17
4              0              1             17
5              0              1             17
6              0              2             17

4. Steps taken in transforming data
Read data files
Remove missing values
filter dates 
convert the Date and Time variables to Date/Time classes
merge date and time columns 
