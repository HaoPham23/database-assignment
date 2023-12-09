import os
import mysql.connector

config = {
    'host': '127.0.0.1',
    'user': 'root',
    'password': '',
    'database': 'CHETCOM'
}

sql_files = ['1-drop_table.sql',
             'create_table.sql',
             'insert_table.sql',
             'create_users.sql',
            #  'procedure_function/1.2.1.sql',
            #  'procedure_function/1.2.2.sql',
            #  'procedure_function/1.2.3.sql',
            #  'procedure_function/1.2.4.sql',
             ]


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
        for file in sql_files:
            if (run_file('database/' + file) == True):
                print('Run successful!')
        # Commit changes
        mydb.commit()

        mydb.close()
    except Exception as error:
        print("Connect Failed!: ", error)