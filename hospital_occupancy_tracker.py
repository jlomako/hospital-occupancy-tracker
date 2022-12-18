import pandas as pd
import numpy as np

# read data
url = "https://www.msss.gouv.qc.ca/professionnels/statistiques/documents/urgences/Releve_horaire_urgences_7jours.csv"
df = pd.read_csv(url, encoding="latin1")

# get current date and time
update = df.iloc[0, 8].split("T")[0]
update_time = df.iloc[0, 8].split("T")[1]

# filter (in R: select) columns
# obs! column-names contain whitespaces
df = df.filter(items=['Nom_etablissement ', ' Nom_installation ', ' Nombre_de_civieres_fonctionnelles ', ' Nombre_de_civieres_occupees '])

# get montreal hospitals (in R filter)
df = df.loc[df['Nom_etablissement '].str.contains(r"Montr|CHUM|CUSM|CHU Sainte-Justine")]

# replace missings with NaNs
df[' Nombre_de_civieres_fonctionnelles '] = pd.to_numeric(df[' Nombre_de_civieres_fonctionnelles '], errors='coerce')
df[' Nombre_de_civieres_occupees '] = pd.to_numeric(df[' Nombre_de_civieres_occupees '], errors='coerce')

# get stretchers/civieres data
beds_total = df[' Nombre_de_civieres_fonctionnelles '].sum()
beds_occ = df[' Nombre_de_civieres_occupees '].sum()

# add new row to end of dataframe, containing beds_total and beds_occ
df.loc[df.index[-1]+1, ['Nom_etablissement ', ' Nom_installation ', ' Nombre_de_civieres_fonctionnelles ', ' Nombre_de_civieres_occupees ']] = ['Total', 'Total', beds_total, beds_occ]

# calculate occupancy rate if not NaN
f = lambda x: round(100*(x[' Nombre_de_civieres_occupees ']/x[' Nombre_de_civieres_fonctionnelles '])) if x.notnull().all() else np.NaN

# add new column with occupancy_rate
df['occupancy_rate'] = df.apply(f, axis=1)

# calculate occupancy_rate
# df = df.assign(occupancy_rate = lambda x: round(100*(x[' Nombre_de_civieres_occupees ']/x[' Nombre_de_civieres_fonctionnelles '])))

# transform occupancy_rate to integer
# df["occupancy_rate"] = df["occupancy_rate"].astype(int)
# OBS! in python NaN is a float > convert to Int64
df['occupancy_rate'] = pd.to_numeric(df['occupancy_rate'], downcast='integer', errors='coerce').astype('Int64')

# insert new column containing the current date
df = df.assign(Date=update)

# select three columns
df = df.filter(items=['Date', ' Nom_installation ', 'occupancy_rate'])

# rename column to "hospital_name"
df.rename(columns={' Nom_installation ': 'hospital_name'}, inplace=True)

# transform from long to wide format (pivot)
df = pd.pivot(df, index='Date', columns='hospital_name', values='occupancy_rate')

# after transforming, python reorders columns in alphabetically order whereas R leaves them in the same order as the rows were
# reorder columns, so they will be in the same order as in R
df = df.reindex(columns=["Centre hospitalier de St. Mary", "Institut universitaire en santé mentale Douglas", "Hôpital de LaSalle", "Hôpital général du Lakeshore", "L'Hôpital général Juif Sir Mortimer B. Davis", "Hôpital de Verdun", "Hôpital Notre-Dame", "Hôpital Fleury", "Hôpital du Sacré-Coeur de Montréal", "Hôpital Jean-Talon", "Pavillon Albert-Prévost", "Institut universitaire en santé mentale de Montréal", "Hôpital Maisonneuve-Rosemont", "Hôpital Santa Cabrini", "Centre hospitalier de l'Université de Montréal", "Hôpital Royal Victoria", "Hôpital général de Montréal", "Hôpital de Montréal pour enfants", "Campus Lachine", "Institut de Cardiologie de Montréal", "CHU Sainte-Justine", "Total"])

# write row to csv (a = append), replace missings with "NA"
df.to_csv("data/hospitals.csv", header=False, mode="a",  na_rep='NA')

# Voilà! exaclty the same output as in R
