from sklearn.preprocessing import StandardScaler
import pandas as pd

#
# Parameters
#
data_file = snakemake.input["data_file"]
output_file = snakemake.output["output_file"]


#
# Load 
#
df = pd.read_csv(data_file)


#
# Process
#
for c in df.columns:
    scaler = StandardScaler()
    df[c] = scaler.fit_transform(df[c].values.reshape((-1,1)))

#
# Output
#
df.to_csv(output_file, index = False)
