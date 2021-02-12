import pandas as pd
import matplotlib.pyplot as plt


#
# Parameters
#
data_file = snakemake.input["data_file"]
output_file = snakemake.output["output_file"]

#
# Load 
#
df = pd.read_csv(data_file)

fig, ax = plt.subplots(figsize=(5,5))

ax.scatter(df.iloc[:, 0], df.iloc[:, 1])
ax.set_xlabel(df.columns[0])
ax.set_ylabel(df.columns[1])
fig.savefig(output_file, bbox_to_inches = "tight")
