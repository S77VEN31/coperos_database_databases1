import random
from faker import Faker
import mysql.connector
fake = Faker()

db = mysql.connector.connect(
  host="localhost",
  user="root",
  password="Hailtotheking31*",
  database="caso2"
)
# generate 100,000 rows of data
data = []
for i in range(8000):
    first_name = fake.name()
    birth_date = fake.date_of_birth(minimum_age=18, maximum_age=65)
    last_name = fake.last_name()
    domain = fake.random_element(elements=("gmail.com", "outlook.com", "hotmail.com"))
    email = f"{first_name.lower()}.{last_name.lower()}@{domain}".replace(" ", "")
    phone = fake.random_number(digits=8)
    data.append((i+1, birth_date, first_name, last_name, phone, email))

# prepare the insert statement
stmt = "INSERT INTO clients (client_id, birth_date, first_name, last_name, phone, email) VALUES (%s, %s, %s, %s, %s, %s)"
cursor = db.cursor()
  
# insert the data in batches of 1000
batch_size = 1000
for i in range(0, len(data), batch_size):
    batch = data[i:i+batch_size]
    cursor.executemany(stmt, batch)
    db.commit()

db.close()



