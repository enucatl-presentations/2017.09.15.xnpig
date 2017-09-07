#!/usr/bin/env Rscript

library(ggplot2)
library(data.table)

theme_set(theme_bw(base_size=12) + theme(
    legend.key.size=unit(1, 'lines'),
    text=element_text(face='plain', family='CM Roman'),
    legend.title=element_text(face='plain'),
    axis.line=element_line(color='black'),
    axis.title.y=element_text(vjust=0.1),
    axis.title.x=element_text(vjust=0.1),
    panel.grid.major = element_blank(),
    panel.grid.minor = element_blank(),
    legend.key = element_blank(),
    panel.border = element_blank()
))


dt = fread("stability.csv")
dt[, timestamp := as.POSIXct(timestamp, format="%d-%m-%Y %H:%M:%S")]
print(dt)
dt = head(dt, 100)

plot = ggplot(dt) +
    geom_point(aes(x=timestamp, y=counts)) +
    scale_x_datetime() +
    xlab("time")


X11()
print(plot)
width = 6
factor = 0.75
height = width * factor
ggsave("stability.png", plot, width=width, height=height, dpi=300)
invisible(readLines(con="stdin", 1))
