from os.path import join as j

configfile: "workflow/config.yaml"

DATA_DIR = config["data_dir"]

#
# DIRS
#
SUBSET_DATA_DIR = j(DATA_DIR, "subset_data")
FIG_DIR = j(DATA_DIR, "figs")


#
# Source data
#
INPUT_DATA = j(DATA_DIR, "iris.csv")
FEATURES = ["sepal_length","sepal_width","petal_length","petal_width"]


#
# Subeset of data 
#
SUBSET_DATA = j(SUBSET_DATA_DIR, "F1={F1}_F2={F2}.csv")


#
# Rescaled data subset
#
RESCALED_SUBSET_DATA = j(SUBSET_DATA_DIR, "rescaled_F1={F1}_F2={F2}.csv")


#
# Plot 
#
FIG_SUBSET_DATA = j(FIG_DIR, "scatter_F1={F1}_F2={F2}.pdf")


rule all:
    input:
        expand(FIG_SUBSET_DATA, F1 = FEATURES, F2= FEATURES)


rule get_iris_data:
    output:
        output_file = INPUT_DATA
    script:
        "workflow/get-iris-data.py"


rule pick_features:
    input:
        data_file = INPUT_DATA
    params:
        F1 = lambda wildcards: wildcards.F1,
        F2 = lambda wildcards: wildcards.F2,
    output:
        output_file = SUBSET_DATA
    script:
        "workflow/pick_features.py"


rule rescale:
    input:
        data_file = SUBSET_DATA
    output:
        output_file = RESCALED_SUBSET_DATA
    script:
        "workflow/rescale.py"


rule scatter_plot:
    input:
        data_file = RESCALED_SUBSET_DATA
    output:
        output_file = FIG_SUBSET_DATA
    script:
        "workflow/scatter_plot.py"
