from flask import *

app = Flask(__name__) #app 객체화

@app.route("/") # 경로설정
def hello(): #함수가 데코레이터 안으로 들어감
    return "hello flask"


# web page
@app.route("/user/<username>")
def user(username):
    return render_template("profile.html", name=username)
    #name이 key값, username이 value값

# json format api
@app.route("/people/<age>/<name>")
def people(age, name):
    users = {
        "name":name,
        "age":age,
        "jin":[
            {"age":35},
            {"email":"ashaelf@naver.com"}
            ]
        }

    return jsonify(users)


app.run()
