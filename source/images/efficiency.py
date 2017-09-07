import csv
import numpy as np
from nist_lookup import xraydb_plugin as xdb

with open("efficiency_table.csv", "w") as outfile:
    writer = csv.writer(outfile)
    writer.writerow(["energy", "Si", "CdTe"])
    for energy in range(10, 120):
        _, _, si_atlen = xdb.xray_delta_beta("Si", 2.33, energy * 1e3)
        _, _, cdte_atlen = xdb.xray_delta_beta("CdTe", 5.85, energy * 1e3)
        si_e = 1 - np.exp(-0.075/si_atlen)
        cdte_e = 1 - np.exp(-0.075/cdte_atlen)
        writer.writerow([energy, si_e, cdte_e])
