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

    query = f"""
    INSERT INTO accounts (email, name, cpf) 
    VALUES ('{account["email"]}','{account["name"]}','{account["cpf"]}');"""

    execute(query)

def insert_membership(data):
    print(f"Inserting membership: {data}")

    account = data["account"]
    plan = data["plan"]
    credit_card = data["credit_card"]["number"][-4]


    query = f"""
    BEGIN; -- Inicia uma transação

    -- Remove o registro pelo email
    DELETE FROM accounts
    WHERE email = '{account["email"]}';

    -- Insere uma nova conta e obtém o ID da conta recém-inserida
    WITH new_account AS (
        INSERT INTO accounts (name, email, cpf)
        VALUES ('{account["name"]}','{account["email"]}', '{account["cpf"]}')
        RETURNING id
    )

    -- Insere um registro na tabela memberships com o ID da conta
    INSERT INTO memberships (account_id, plan_id, credit_card, price, status)
    SELECT id, {plan["id"]}, '{credit_card}', {plan["price"]}, true
    FROM new_account;

    COMMIT;  --Confirma a transação
    """

    execute(query)  