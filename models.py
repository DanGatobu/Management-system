import email
#from flask_sqlalchemy import SQLAlchemy
#app=Flask(__name__)
#app.config['SQLALCHEMY_DATABASE_URI']='sqlite:////tmp/test.db'
#db=SQLAlchemy(app)
#class User(db.Model):
 #   id=db.Column(db.Integer,Primary_key=True)
  #  username= db.Column(db.String(80)), unique=True ,nullable=False)
   # email= db.Column(db.String(120)), unique=True ,nullable=False)
import re
from sqlite3 import Cursor
from flask import flash
from werkzeug.security import generate_password_hash,check_password_hash  
_hashed_password=generate_password_hash(password)

 if request.method=='POST':
        fname=request.form['fname']
        lname=request.form['lname']
        enteraddress=request.form['enteraddress']
        mobilenumber=request.form['mobilenumber']
        password=request.form['password']
        
       _hashed_password=generate_password_hash(password)

cursor.execute('SELECT * FROM customers WHERE email= %s',(emai,))
ema=cursor.fetchone()
print(ema)

if ema:
    flash('EMAIL already exists!')
else:
       cur.execute("INSERT INTO customers(firstname,secondname,mobilenumber,address,password)VALUES(%s,%s,%s,%s,%s)",(fname,lname,enteraddress,mobilenumber,password))
        conn.commit()
    return redirect(url_for('bankregister'))



if request.method=='POST' and 'email' in request.form and 'password' in request.form:
     email=request.form['email']
        password=request.form['password']
        