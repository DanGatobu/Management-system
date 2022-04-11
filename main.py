from flask import Flask,render_template,url_for,request,redirect,flash
import psycopg2
import psycopg2.extras
import configparser
#from configs.base_config import *
conn=psycopg2.connect(user="postgres", password="dannewton", host="localhost", port="5432", database="online_retail")
cur=conn.cursor()

cur.execute("CREATE TABLE IF NOT EXISTS inventory(id serial PRIMARY KEY,name varchar(100),bp int,sp int,quantity int,category varchar(100),sale int);")
cur.execute("CREATE TABLE IF NOT EXISTS orders(id serial PRIMARY KEY,customer_id int,total int,discount int,order_date text);")
cur.execute("CREATE TABLE IF NOT EXISTS customers(id serial PRIMARY KEY,firstname varchar(100),secondname varchar,mobilenumber numeric,address text,password varchar(100),bankdetailsid varchar(50));")
cur.execute("CREATE TABLE IF NOT EXISTS orderdetails(id serial PRIMARY KEY,inventoryid int,ordersid int,quantity int);")
cur.execute("CREATE TABLE IF NOT EXISTS bankdetails(id serial PRIMARY KEY,bankname text,accountnumber varchar);")
app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI']='postgresql://postgres:dannewton@localhost/online_retail'
@app.route('/')
def home():
    return render_template('home.html')

@app.route('/home')
def register():
    return render_template('registration.html')

@app.route('/bankregister')
def bankregister():
    return render_template('bankregistration.html')



@app.route('/registration', methods=['GET','POST'])
def registration():
    if request.method=='POST':
        fname=request.form['fname']
        lname=request.form['lname']
        email=request.form['email']
        enteraddress=request.form['enteraddress']
        mobilenumber=request.form['mobilenumber']
        password=request.form['password']
       
        cur.execute("INSERT INTO customers(firstname,secondname,mobilenumber,address,password,email)VALUES(%s,%s,%s,%s,%s,%s)",(fname,lname,mobilenumber,enteraddress,password,email))
        conn.commit()
    return redirect(url_for('bankregister'))


@app.route('/bankregistration',methods=['GET','POST'])
def bankregistration():
    if request.method=='POST':
         bankname=request.form['bankname']
         accountnumber=request.form['accountnumber']
         cur.execute("INSERT INTO bankdetails(accountnumber,bankname)VALUES(%s,%s)",(accountnumber,bankname))
         conn.commit()
    return redirect(url_for('home'))
@app.route('/login')
def login():
    return render_template('login.html')
@app.route('/adminlogin')
def adminlogin():
    if request.method=='POST' and 'email' in request.form and 'password' in request.form:
     email=request.form['email']
     password=request.form['password']
     cur.execute("SELECT * FROM customers WHERE email = %s",(email,))
     loginemail=cur.fetchone()
     
     if loginemail:
         password_rs=['password']
     else:
         flash('incorect password/email')

    return url_for('home')    



@app.route('/inventory',methods=['GET','POST'])
def inventory(): 
    cur.execute("SELECT * FROM inventory;")
    data=cur.fetchall()
    conn.commit()
        
    return render_template('inventory.html', invent=data)

@app.route('/addinventory',methods=['POST'])
def addinventory():
    cur=conn.cursor(cursor_factory=psycopg2.extras.DictCursor)
    if request.method=='POST':
        
        name=request.form['Item']
        quantity=request.form['Quantity']
        category=request.form['category']
        bp=request.form['bp']
        sp=request.form['sp']
        
        cur.execute("INSERT INTO inventory(name,bp,sp,quantity,category)VALUES(%s,%s,%s,%s,%s)",(name,bp,sp,quantity,category))       
        conn.commit()
    
    return redirect(url_for('inventory'))

@app.route('/orders',methods=['GET','POST'])
def orders(): 
    cur.execute("SELECT * FROM orders;")
    data=cur.fetchall()
    conn.commit()
    return render_template('orders.html', order=data)

@app.route('/customers',methods=['GET','POST'])
def customers(): 
    cur.execute("SELECT * FROM customers;")
    data=cur.fetchall()
    conn.commit()
    return render_template('customers.html', customer=data)

@app.route('/orderdetails',methods=['GET','POST'])
def orderdetails(): 
    cur.execute("SELECT * FROM orderdetails;")
    data=cur.fetchall()
    conn.commit()
    return render_template('orderdetails.html', od=data)

@app.route('/bank',methods=['GET','POST'])
def bank(): 
    cur.execute("SELECT * FROM bankdetails;")
    data=cur.fetchall()
    conn.commit()
    return render_template('bank.html', banks=data)
@app.route('/edit/<id>',methods=['GET','POST'])
def get_inventory(id):
   
      cur=conn.cursor(cursor_factory=psycopg2.extras.DictCursor)
      cur.execute('SELECT * FROM inventory WHERE id = %s',(id))
      data=cur.fetchall()
      cur.close
      return render_template('edit.html',inv=data[0])
     
@app.route('/update/<id>',methods=['GET','POST'])
def update_inv(id):
    cur=conn.cursor(cursor_factory=psycopg2.extras.DictCursor)
    if request.method == 'POST':
        name=request.form['name']
        quantity=request.form['quantity']
        category=request.form['category']
        bp=request.form['bp']
        sp=request.form['sp']

        cur.execute("""
            UPDATE inventory
            SET name = %s,
                quantity = %s,
                category = %s,
                bp = %s,
                sp = %s
            WHERE id = %s
        """ ,(name,quantity,category,bp,sp,id))       
        conn.commit()
        return redirect(url_for('inventory'))
    
@app.route('/delete/<string:id>',methods=['POST','GET'])
def delete_inv(id):
    cur=conn.cursor(cursor_factory=psycopg2.extras.DictCursor)
    
    cur.execute('DELETE FROM inventory WHERE id = {0}'.format(id))       
    conn.commit()
    return redirect(url_for('inventory'))

@app.route('/editcustomers/<id>',methods=['GET','POST'])
def get_customers(id):
   
     cur.execute('SELECT * FROM customers WHERE id = %s',(id,))
     data=cur.fetchall()
     cur.close
     return render_template('editcustomers.html',cust=data[0])
     
@app.route('/updatecustomers/<id>',methods=['GET','POST'])
def update_customers(id):
    cur=conn.cursor(cursor_factory=psycopg2.extras.DictCursor)
    if request.method == 'POST':
       fname=request.form['fname']
       sname=request.form['sname']
       sname=request.form['sname']
       mobilenumber=request.form['mobilenumber']
       address=request.form['address']
       password=request.form['password']

       cur.execute("""
           UPDATE customers
           SET firstname = %s,
               secondname = %s,
               mobilenumber = %s,
               address = %s,
               password = %s
           WHERE id = %s
        """ ,(fname,sname,mobilenumber,address,password,id))       
       conn.commit()
       return redirect(url_for('customers'))
    
@app.route('/deletecustomers/<string:id>',methods=['POST','GET'])
def delete_customers(id):
    cur=conn.cursor(cursor_factory=psycopg2.extras.DictCursor)
    
    cur.execute('DELETE FROM customers WHERE id = {0}'.format(id))       
    conn.commit()
    return redirect(url_for('customers'))

@app.route('/deleteorders/<string:id>',methods=['POST','GET'])
def delete_orders(id):
    cur=conn.cursor(cursor_factory=psycopg2.extras.DictCursor)
    
    cur.execute('DELETE FROM orders WHERE id = {0}'.format(id))       
    conn.commit()
    return redirect(url_for('orders'))

