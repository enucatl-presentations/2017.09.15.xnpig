import scipy.io
import csv

a = scipy.io.loadmat("stability_scan.mat")
counts = a["ROIs_cnts"]
stds = a["ROIs_stds"]
timestamps = a["timestamp"]
print(counts.shape)
print(stds.shape)
print(timestamps.shape)

with open("stability.csv", "w") as outfile:
    writer = csv.writer(outfile)
    writer.writerow(["timestamp", "counts", "std"])
    for a, b, c in zip(timestamps, counts, stds):
        a = a.replace("April", "04")
        writer.writerow([a, b[0], c[0]])
