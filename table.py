import os
import mysql.connector

# Replace these values with your MySQL connection details
db_config = {
    'host': '127.0.0.1',
    'user': 'root',
    'password': '',
    'database': 'CHETCOM',
}

# Folder containing SQL files
sql_folder = '/Users/nhantran/code/database-assignment/database'

# Establish a connection to the MySQL server
conn = mysql.connector.connect(**db_config)

# Create a cursor object to execute SQL queries
cursor = conn.cursor()

# Get a list of all files in the specified folder
sql_files = sorted([f for f in os.listdir(sql_folder) if f.endswith('.sql')])

# Execute each SQL file
for sql_file in sql_files:
    file_path = os.path.join(sql_folder, sql_file)
    
    with open(file_path, 'r') as file:
        # Read the content of the SQL file
        sql_query = file.read()

        # Execute the SQL query
        cursor.execute(sql_query, multi=True)

# Commit the changes to the database
conn.commit()

# Close the cursor and connection
cursor.close()
conn.close()