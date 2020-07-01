# K-Nearest Neighbors (K-NN)

# Importing the libraries
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd
from sklearn.preprocessing import LabelEncoder

# Importing the dataset
dataset = pd.read_csv('Dataset.csv')

# Query
new_row = {' itching':1,
           ' skin_rash':1,
           ' stomach_pain':1,}

dataset = dataset.append(new_row, ignore_index = True)

dataset.fillna('0', inplace = True)
X = dataset.iloc[:, 1:].values
y = dataset.iloc[:, 0].values

X_train = X[:-2,:]
X_test = X[-2:,:]
y_train = y[:-2]
y_test = y[-2:]

## Splitting the dataset into the Training set and Test set
#from sklearn.model_selection import train_test_split
#X_train, X_test, y_train, y_test = train_test_split(X, y, test_size = 0.25)

# Fitting K-NN to the Training set
from sklearn.neighbors import KNeighborsClassifier
classifier = KNeighborsClassifier(n_neighbors = 5, metric = 'minkowski', p = 2)
classifier.fit(X_train, y_train)

# Predicting the Test set results
y_pred = classifier.predict(X_test)

# Making the Confusion Matrix
#from sklearn.metrics import confusion_matrix
#cm = confusion_matrix(y_test, y_pred)
print(y_pred[-1])
