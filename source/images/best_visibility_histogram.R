#!/usr/bin/env Rscript

library(ggplot2)
library(data.table)
library(argparse)

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

commandline_parser = ArgumentParser(
        description="merge the datasets into one data.table")
commandline_parser$add_argument('-f', '--file',
            type='character', nargs='?', default='../../../dried_lung_samples/data/pixels.rds',
            help='file with the data.table')
args = commandline_parser$parse_args()

table = readRDS(args$f)[v > 0.05][smoke == "smoke"][region == "LL"]

print(table)

visibility_histogram = ggplot(table, aes(x=v)) +
    geom_density() +
    ylab("") +
    xlab("visibility")


width = 7
factor = 0.618
height = width * factor
print(visibility_histogram)

ggsave("best_visibility.png", visibility_histogram, width=width, height=height, dpi=300)

invisible(readLines(con="stdin", 1))
