import pygsheets
import pandas as pd
#authorization
gc = pygsheets.authorize(service_file='/Users/Prashan.Welipitiya/desktop/MTSS-36c7376b8db8.json')

# Create empty dataframe
df = pd.DataFrame()

# Create a column
df['name'] = ['John', 'Steve', 'Sarah']

#open the google spreadsheet (where 'PY to Gsheet Test' is the name of my sheet)
sh = gc.open('MTSS Data Warehouse')

#select the first sheet
wks = sh[0]

#update the first sheet with df, starting at cell B2.
wks.set_dataframe(df,(1,1))
