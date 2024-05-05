from flask import Flask, render_template
app = Flask(__name__)

@app.route('/')
def drizzy():
    return 'Working on the weekend like usual... xD'

@app.route('/jimmy')
def jimmy():
    return render_template('base.html')