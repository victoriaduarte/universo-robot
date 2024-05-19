import os
from dotenv import load_dotenv

load_dotenv()  # load .env file

BASE_URL = os.getenv('BASE_URL')

BROWSER = os.getenv('BROWSER')
HEADLESS = os.getenv('HEADLESS')