import os
import mysql.connector

config = {
    'host': '127.0.0.1',
    'user': 'root',
    'password': '',
    'database': 'CHETCOM'
}

def run_file(file_name: str) -> bool:
    try:
        print(f"Trying to run {file_name}")
        sqlCommands = open(file_name, 'r', encoding='utf8').read().split(';')
        for command in sqlCommands:
            try:
                if command.strip() != '':
                    cursor.execute(command)
            except IOError as msg:
                print("Command skipped: ", msg)
        return True
    except Exception as error:
        print(error)
        return False

if __name__=="__main__":
    try:
        mydb = mysql.connector.connect(**config)
        cursor = mydb.cursor()
        print("Connected!")
        assert run_file('/Users/nhantran/code/database-assignment/database/1-drop_table.sql')
        assert run_file('/Users/nhantran/code/database-assignment/database/create_table.sql')
        assert run_file('/Users/nhantran/code/database-assignment/database/insert_table.sql')

        # Commit changes
        mydb.commit()

        mydb.close()
    except Exception as error:
        print("Connect Failed!: ", error)