#views.py  file
from .app import app

@app.route('/')
def hello_world():
    return 'Hello, World!'


@app.route('/greet')
def greet():
    return 'greetings'