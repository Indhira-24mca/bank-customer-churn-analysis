import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns

# Load dataset
df = pd.read_csv('bank_churn.csv')

# Explore
print(df.shape)
print(df.head())
print(df.isnull().sum())
print(df['Exited'].value_counts())
