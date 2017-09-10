#!/usr/bin/env Rscript

library(ggplot2)
library(data.table)

dt = fread("efficiency_table.csv")
print(dt)

molten = melt(dt, id.vars="energy")
print(molten)

plot = ggplot(molten, aes(x=energy, y=value, color=variable)) +
    geom_line() +
    xlab("energy (keV)") +
    ylab("quantum efficiency") +
    labs(color="material")

X11()
print(plot)
width = 6
factor = 0.618
height = width * factor
ggsave("efficiency.png", plot, width=width, height=height, dpi=300)
invisible(readLines(con="stdin", 1))
