from bottle import template, response, run, Bottle, request, static_file
from bson.json_util import dumps
from bson.objectid import ObjectId
from pymongo import MongoClient
import os

client = MongoClient('localhost', 27017)
db = client['linTest']
managers = db['managers']
companies = db['companies']

app = Bottle()

@app.route('/')
def hello():    
    return template('main')

@app.route('/managers')
@app.route('/managers/<page_id:int>')
def getManagers():
    response.content_type = 'application/json'    
    rv = managers.find()
    l = list(rv)
    
    return dumps(l)

@app.route('/companies')
def getCompanies():
    response.content_type = 'application/json'    
    rv = companies.find()
    l = list(rv)
    
    return dumps(l)

@app.route('/add_man', method='POST')
def addManager():
    data = request.json
    #print(data)
    managers.insert_one(data)
    return dumps("all OK")

@app.route('/static/<path:path>')
def callback(path):
    return static_file(path, os.getcwd())

run(app, host='localhost', port=8080)