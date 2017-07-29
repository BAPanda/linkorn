from bottle import template, response, run, Bottle
from json import dumps

app = Bottle()

@app.route('/')
def hello():
    return template('main')

@app.route('/managers', method='POST')
def getManagers():
    response.content_type = 'application/json'
    rv = [{'text' : "Managers!!!"}]
    return dumps(rv[0])

run(app, host='localhost', port=8080)