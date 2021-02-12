from sklearn import datasets
import pandas as pd

data = datasets.load_iris(as_frame = True)
data_table = data["data"]
data_table["target"] = data["target"]

cols = {c:c.replace("(cm)", "").strip().replace(" ", "_") for c in data_table.columns}

data_table = data_table.rename(columns = cols)

data_table.to_csv("data/iris.csv", index = False)
