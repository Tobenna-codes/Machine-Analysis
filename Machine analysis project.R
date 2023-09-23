library(ggplot2)

getwd()

setwd('../Downloads')

util <- read.csv('P3-Machine-Utilization.csv')

setwd('../Documents')

str(util)

summary(util)

head(util, 12)

# Converting the machine column to a factor

util$Machine <- as.factor(util$Machine)

summary(util)

# Deriving Utilization column

util['Utilization'] <- 1 - util$Percent.Idle

# Creating timestamp column in the right format/datatype

tail(util)

?POSIXct

util['PosixTime'] <- as.POSIXct(util$Timestamp, format = '%d/%m/%Y %H:%M')

head(util)

# Removing the timestamp column

util$Timestamp <- NULL

# Rearranging our columns

util <- util[,c(4,1,2,3)]

str(util)

summary(util)

# Creating data frame for machine RL1

RL1 <- util[util$Machine == 'RL1',]

summary(RL1)

RL1$Machine <- as.factor(RL1$Machine)

RL1_util_stats <- c(min(RL1$Utilization, na.rm = TRUE),
                    mean(RL1$Utilization, na.rm = TRUE),
                    max(RL1$Utilization, na.rm = TRUE)
                    )
# Below is an improvement to "length(which(RL1$Utilization < 0.9)) > 0"

util_under_90_flag <- any(RL1$Utilization < 0.9, na.rm = TRUE)

RL1_list <- list('RL1', RL1_util_stats, util_under_90_flag)

RL1_list

# Well, we could have assigned names to our list components right away like
# RL1_list <- list(Machine = 'RL1', Stats = RL1_util_stats, LowTreshold = util_under_90_flag)

# Or we can give names after creating the list like

names(RL1_list) <- c('Machine', 'Stats', 'LowTreshold')

RL1_list

names(RL1_list$Stats) <- c('min','mean','max')

RL1_list$Stats['mean']
RL1_list$Stats['max']

RL1_list$LowTreshold

# Adding a 4th component to our stats, the median

RL1_list$Stats[4] <- c(median(RL1$Utilization, na.rm = TRUE))

names(RL1_list$Stats) <- c('min','mean','max','median')

RL1_list

# Hours where utilization is unknown

RL1[is.na(RL1$Utilization), 'PosixTime']

#Adding it to our list

RL1_list$UnknownHours <- RL1[is.na(RL1$Utilization), 'PosixTime']

#Adding RL1 dataframe to our list

RL1_list$Data <- RL1

summary(RL1_list)
str(RL1_list)

summary(RL1_list$Data)
str(RL1_list$Data)

# Creating time series plot for utilization of all machines

machine_plot <- ggplot(data = util,
                       aes(x = PosixTime, y = Utilization, color = Machine)) + 
                       geom_line(size = 0.73) + facet_grid(Machine~.) + 
                       geom_hline(yintercept = 0.90, linetype = 2,size = 0.6, color = 'Red') +
                       labs(title = 'Machine Utilization Time Series')

# Adding machine plot to our list

RL1_list$Plot <- machine_plot

RL1_list

summary(RL1_list)

str(RL1_list)
