# Intro
using nyc flights data
```
library(nycflights13)
library(dplyr)
flights #view header
view(flights) #view full in RStudio
```
## Filter rows - filter()
```
filter(flights, month == 1, day == 1) #flight on Jan 1st
(dec25_flights <- filter(flights, month == 12, day == 25)) #print and save to a variable
```
### Logical Operator
```
filter(flights, month == 11 | month == 12) #depart in Nov or Dec
nov_dec <- filter(flights, month %in% c(11, 12)) #depart in Nov or Dec
```
De Morgan’s law: !(x & y) is the same as !x | !y, and !(x | y) is the same as !x & !y.
flights that weren’t delayed (on arrival or departure) by more than two hours:
```
filter(flights, !(arr_delay > 120 | dep_delay > 120))
filter(flights, arr_delay <= 120, dep_delay <= 120)
```
### Missing Values
```
df <- tibble(x = c(1, NA, 3)) #c is concatenate val to a tibble
filter(df, x > 1) #3
filter(df, is.na(x) | x > 1) #NA,3
```

## Arrange rows - arrange()
```
arrange(flights, year, month, day) #sort rows based on yymmdd
arrange(flights, desc(dep_delay)) #sort based dep_delay in desc order
```
missing values ALWAYS in the end
```
df <- tibble(x = c(5, 2, NA))
arrange(df, x) #2,5,NA
arrange(df, desc(x)) #5,2,NA
```

## Select columns - select()
```
select(flights, year, month, day) #select columns by name
select(flights, year:day) #select all cols between year and day
select(flights, -(year:day)) #select all cols except between year and day
```
other helpful function: starts_with(), ends_with(), contains(),
matches(), num_range(), and rename()
```
rename(flights, tail_num = tailnum) #rename col name tailnum
select(flights, time_hour, air_time, everything()) #move column to the front, then state all the rest of cols with everything()
```
