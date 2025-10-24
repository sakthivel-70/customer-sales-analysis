import pandas as pd
from urllib.parse import quote_plus

from sqlalchemy import create_engine
df=pd.read_csv('customer_shopping_behavior.csv')
df.columns=df.columns.str.lower()
df.columns = df.columns.str.replace(" ","_")
df=df.rename(columns={"purchase_amount_(usd)":"purchase_amount"})

df["review_rating"]=df.groupby("category")["review_rating"].transform(lambda x: x.fillna(x.median()))
age_grp=["young_adult","adult","middle_aged","senoir"]
df["age_group"]=pd.qcut(df["age"],q=4,labels=age_grp)
frequency_maping={"Fortnightly":14,
                  "Weekly":7,
                  "Monthly":30,
                  "Annually":365,
                  "Every 3 Months":90,
                  "Bi-Weekly":14,
                  "Quarterly":90}

df["purchase_frequency_days"]=df["frequency_of_purchases"].map(frequency_maping)
df=df.drop("promo_code_used",axis=1)#axis 1=columns,0 or index=rows

print(df.columns)

#mysql connection

from sqlalchemy import create_engine
import pandas as pd

username = "root"
password = quote_plus("sakthi@IT2264")
host = "127.0.0.1"   # safer than localhost
port = 3306
database = "sales_analysis"

# ✅ Correct format
engine = create_engine(f"mysql+pymysql://{username}:{password}@{host}:{port}/{database}")

# Write DataFrame to MySQL
table_name = "sales_table"
df.to_sql(table_name, engine, if_exists="replace", index=False)

# Read sample
sample = pd.read_sql("SELECT * FROM sales_table LIMIT 10;", engine)
print(sample)

