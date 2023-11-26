# Machine-Analysis

[Download CSV file](https://github.com/Tobenna-codes/Machine-Analysis/blob/main/P3-Machine-Utilization.csv)

I've been engaged as a Data Science consultant by a coal terminal. 

They would like to investigate one of their heavy machines - RL1

I've have been supplied one month worth of data for all of their machines. 

The dataset shows what percentage of capacity for each machine was idle (unused) in any 
given hour. 

We are required to deliver an R list with the following components:

- Character: Machine name

- Vector: (min, mean, max) utilisation for the month (excluding unknown hours)

- Logical: Has utilisation ever fallen below 90%? TRUE / FALSE

- Vector: All hours where utilisation is unknown (NA’s)

- Dataframe: For this machine

- Plot: For all machines

## Machine Utilization Time Series
Showing where and when machines' utilization has gone below 90%

![Machine Utilization time series](https://github.com/Tobenna-codes/Machine-Analysis/assets/135149511/8056efb9-a754-469a-8479-6e26f350630b)

