import os
import psycopg2
from dotenv import load_dotenv 
load_dotenv()

def get_connection():
    try:
        connection = psycopg2.connect(
            host=os.getenv("DB_HOST"),
            database=os.getenv("DB_NAME"),
            user=os.getenv("DB_USER"),
            password=os.getenv("DB_PASSWORD"),
            port=os.getenv("DB_PORT")
        )
        return connection
    except Exception as e:
        print(f"Error al conectarse a la base de datos: {e}")
        return None 
    
conn = get_connection()

if conn:
    print('Conexion exitoso con Postgresql')
    cursor = conn.cursor()

    cursor.execute("SELECT version();")
    db_version = cursor.fetchone()
    print(f"Versión del servidor: {db_version[0]}")

    cursor.close()
    conn.close()
    print(" Conexión cerrada correctamente.")
else:
     print("Revisa tu archivo .env y asegúrate de que PostgreSQL esté corriendo.")