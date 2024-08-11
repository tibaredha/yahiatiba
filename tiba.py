print("tibaredha")
# tibaredha
import  numpy as np
import  pandas as pd
import matplotlib.pyplot as plt

df1 = pd.read_csv("C:/Users/SSD STORE/OneDrive/Bureau/yahiatiba/inst/extdata/deces.csv")
df2 = pd.read_csv("./inst/extdata/deces.csv")
print(df1)
df1.shape
df1.isnull().sum()
df1.head(15)
df1.tail(15)
df1.info()
df1.describe()

df1.Years.hist(bins = 50, figsize=(12,8))
plt.show()

import matplotlib.pyplot as plt
df1.Years.hist(bins = 50, figsize=(12,8))
plt.show()

def myfunc():
  x = "fantastic"
  print("Python is " + x)

myfunc()

del plt

