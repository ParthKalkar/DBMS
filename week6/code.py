DB_HOST = "localhost"
DB_NAME = "customers"
DB_USER = "postgres"
DB_PASS = "qwerty123"

import psycopg2
from faker import Faker

conn = psycopg2.connect(dbname = DB_NAME, user = DB_USER, password = DB_PASS, host = DB_HOST)

print("Database opened successfully")
cur = conn.cursor()
cur.execute('''CREATE TABLE customer1
       (ID INT PRIMARY KEY     NOT NULL,
       Name           TEXT    NOT NULL,
       Address            TEXT     NOT NULL,
       review        TEXT);''')
print("Table created successfully")
fake = Faker()
for i in range(100000):
    print(i)
    cur.execute("INSERT INTO customer1 (ID,Name,Address,review) VALUES ('"+ str(i)+"','"+fake.name()+"','"+fake.address()+"','"+fake.text()+"')")
    conn.commit()

conn.close()