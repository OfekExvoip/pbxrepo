from flask import Flask, request, redirect, render_template
import subprocess
from index import index


app = Flask(__name__)

@app.route('/')

def home():
    return index()


@app.route('/trunks', methods=['POST'])
def trunks():
    # Execute the specified Python script
    subprocess.run(['python', 'location.pylocation.py'])
    return redirect('/')

@app.route('/run-script1', methods=['POST'])
def create_trunks():
    
    ip_add = request.form['ip_add']
    from_range = request.form['from_range']
    to_range = request.form['to_range'] 
    # concatenate the two values with a comma
    trunks_range = '{},{},{}'.format(ip_add,from_range, to_range)
    print(trunks_range)
    subprocess.run(['python', 'location.pylocation.py', trunks_range])
    subprocess.run(['python','location.py'])
    return redirect(f'/saved?ip_add={ip_add}')

@app.route('/saved')
def savedpg():
    ip_add = request.args.get('ip_add')
    return render_template('try.html', ip_add=ip_add)


    
if __name__ == '__main__':
    app.run(debug=True)
