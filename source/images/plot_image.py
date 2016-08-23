#!/usr/bin/env python
# encoding: utf-8

"""Nice plot of the three DPC images"""

import os
import h5py
import numpy as np
from scipy import stats
import matplotlib as mpl
import matplotlib.pyplot as plt
import click


pgf_with_rc_fonts = {
    "image.origin": "lower",
    "font.family": "serif",
    "pgf.rcfonts": False,
    "ytick.major.pad": 5,
    "xtick.major.pad": 5,
    "font.size": 11,
    "legend.fontsize": "medium",
    "axes.labelsize": "medium",
    "axes.titlesize": "medium",
    "ytick.labelsize": "medium",
    "xtick.labelsize": "medium",
    "axes.linewidth": 1,
}

mpl.rcParams.update(pgf_with_rc_fonts)


@click.command()
@click.argument("filename", type=click.Path(exists=True))
@click.option("--height", type=float, default=6)
@click.option("--big_crop", nargs=4, type=int, default=[0, -1, 0, -1])
@click.option("--format", default="png")
def main(filename, height, big_crop, format):
    input_file = h5py.File(filename, "r")
    dataset_name = "postprocessing/dpc_reconstruction"
    min_x, max_x, min_y, max_y = big_crop
    dataset = input_file[dataset_name]
    print("original shape", dataset.shape)
    dataset = dataset[min_y:max_y, min_x:max_x, ...]
    print("cropped", dataset.shape)
    absorption_image = dataset[..., 0]

    draw(filename, height, absorption_image,
         format)


def draw(input_file_name, height,
         absorption_image,
         format):
    """Display the calculated images with matplotlib."""
    abs1_plot = plt.figure()
    abs1 = plt.imshow(
        absorption_image,
        cmap=plt.cm.Greys,
        origin='upper',
        aspect='auto')
    limits = stats.mstats.mquantiles(
        absorption_image,
        prob=[0.02, 0.98])
    limits = [0.9, 1]
    abs1.set_clim(*limits)
    print(limits)
    plt.savefig('{0}.{1}'.format(
        os.path.splitext(os.path.basename(input_file_name))[0],
        format),
        bbox_inches="tight", dpi=300)
    plt.ion()
    plt.show()
    input("Press ENTER to quit...")


if __name__ == '__main__':
    main()
