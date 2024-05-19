import os
from dotenv import load_dotenv

load_dotenv()  # load .env file

API_URL = os.getenv('API_URL')
