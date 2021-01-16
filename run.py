#run.py
from app.app import app
from app import views

if __name__ == "__main__":
    app.run(debug=True, host='0.0.0.0')