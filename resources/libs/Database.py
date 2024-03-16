import psycopg2

def delete_account_by_email(email):

    query = f"DELETE FROM accounts WHERE email = '{email}';"

    conn = psycopg2.connect(
        host='kesavan.db.elephantsql.com',
        database='oesjjtik',
        user='oesjjtik',
        password='y36aoG9PAdC7zngIzNCWtztI_o1iscI9'
    )

    cur = conn.cursor()
    cur.execute(query)
    conn.commit()
    conn.close()
    
def insert_account(account):
    query = f"INSERT INTO accounts (email, name, cpf) VALUES ('{account.email}','{account.name}','{account.cpf}');"

    conn = psycopg2.connect(
        host='kesavan.db.elephantsql.com',
        database='oesjjtik',
        user='oesjjtik',
        password='y36aoG9PAdC7zngIzNCWtztI_o1iscI9'
    )

    cur = conn.cursor()
    cur.execute(query)
    conn.commit()
    conn.close()