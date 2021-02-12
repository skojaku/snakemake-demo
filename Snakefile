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
# Rules
#
rule get_iris_data:
    output:
        output_file = INPUT_DATA
    script:
        "workflow/get-iris-data.py"
