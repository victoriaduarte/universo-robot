import psycopg2

# connection as string: dbname / as object: database
db_conn = """
    host='kesavan.db.elephantsql.com'
    dbname='oesjjtik'
    user='oesjjtik'
    password='y36aoG9PAdC7zngIzNCWtztI_o1iscI9'
"""

def execute(query):
    conn = psycopg2.connect(db_conn)

    cur = conn.cursor()
    cur.execute(query)
    conn.commit()
    conn.close()

def delete_account_by_email(email):
    print(f"Deleting account: {email}")

    query = f"DELETE FROM accounts WHERE email = '{email}';"

    execute(query)

def insert_account(account):
    print(f"Inserting account: {account}")

    query = f"INSERT INTO accounts (email, name, cpf) VALUES ('{account.email}','{account.name}','{account.cpf}');"

    execute(query)