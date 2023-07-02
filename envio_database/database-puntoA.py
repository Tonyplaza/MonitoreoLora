import requests
import mysql.connector
import json

# retrieve the data from ThingSpeak API
url = "https://api.thingspeak.com/channels/2017662/feeds.json?results=719"
response = requests.get(url)

# parse the JSON data
data = response.json()

# connect to the database
conn = mysql.connector.connect(
    host="localhost",
    user="root",
    password="",
    database="sensores_arduino"
)
cursor = conn.cursor()

# insert the data into the table
for feed in data['feeds']:
    cursor.execute("""
    INSERT INTO monitoreo (id_nodo, id_variable, valor, fecha_hora)
    VALUES (1, 1, %s, %s)
    """, (float(feed['field2']), feed['created_at']))
    
    cursor.execute("""
    INSERT INTO monitoreo (id_nodo, id_variable, valor, fecha_hora)
    VALUES (1, 2, %s, %s)
    """, (float(feed['field1']), feed['created_at']))
    
    cursor.execute("""
    INSERT INTO monitoreo (id_nodo, id_variable, valor, fecha_hora)
    VALUES (1, 3, %s, %s)
    """, (float(feed['field3']), feed['created_at']))

    cursor.execute("""
    INSERT INTO monitoreo (id_nodo, id_variable, valor, fecha_hora)
    VALUES (1, 4, %s, %s)
    """, (float(feed['field4']), feed['created_at']))
    
# commit the changes
conn.commit()

# close the connection
conn.close()