import sqlite3
import pandas as pd

cxn = sqlite3.connect('webapp/db.sqlite3')
wb = pd.read_csv('source_code/FirstApp_airfoil_exp.csv')
wb.to_sql(name='FirstApp_airfoil_exp',con=cxn,if_exists='replace',index=True)
cxn.commit()
cxn.close()