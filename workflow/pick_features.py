import pandas as pd


#
# Parameters
#
data_file = snakemake.input["data_file"]
output_file = snakemake.output["output_file"]
F1 = snakemake.params["F1"]
F2 = snakemake.params["F2"]


#
# Load 
#
df = pd.read_csv(data_file)

#
# Process 
#
df = df[[F1, F2]]


#
# Save 
#
df.to_csv(output_file, index=False)
