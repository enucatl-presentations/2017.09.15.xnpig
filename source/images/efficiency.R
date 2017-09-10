#!/usr/bin/env Rscript

library(ggplot2)
library(data.table)
library(scales)

dt = fread("visibility.csv")
setnames(dt, "V1", "time")
setnames(dt, "V2", "visibility")
print(dt)

time_origin = dt[1, time]
dt[, time := as.POSIXct(time - time_origin, origin="1970-01-01")]

plot = ggplot(dt, aes(x=time, y=visibility)) +
    geom_line() +
    scale_x_datetime(labels=date_format("%H")) +
    scale_y_continuous(limits=c(0.05, 0.1)) +
    xlab("time (hours)") +
    ylab("median visibility")

X11()
print(plot)
width = 6
factor = 0.75
height = width * factor
ggsave("visibility_stable.png", plot, width=width, height=height, dpi=300)
invisible(readLines(con="stdin", 1))
