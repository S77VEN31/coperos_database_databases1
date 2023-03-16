import random
from faker import Faker
import mysql.connector
fake = Faker()

db = mysql.connector.connect(
  host="localhost",
  user="root",
  password="Hailtotheking31*",
  database="mydb"
)
# generate 100,000 rows of data
data = []
for i in range(15):
    first_name = fake.name()
    age = random.randint(18, 65)
    last_name = fake.last_name()
    domain = fake.random_element(elements=("gmail.com", "outlook.com", "hotmail.com"))
    email = f"{first_name.lower()}.{last_name.lower()}@{domain}".replace(" ", "")
    phone = fake.random_number(digits=8)
    iban_account = fake.iban()
    data.append((i+1, first_name, last_name, phone, email, iban_account))

# prepare the insert statement
stmt = "INSERT INTO employees (employee_id, first_name, last_name, phone, email, iban_account) VALUES (%s, %s, %s, %s, %s, %s)"
cursor = db.cursor()

# insert the data in batches of 1000
batch_size = 1000
for i in range(0, len(data), batch_size):
    batch = data[i:i+batch_size]
    cursor.executemany(stmt, batch)
    db.commit()

db.close()



