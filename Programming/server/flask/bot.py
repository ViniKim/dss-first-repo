from flask import *
from lib.slack import send_slack
from lib.forecast import forecast

app = Flask(__name__)

@app.route("/slack", methods=["POST"]) #함수 이름과 경로명은 일치하지 않아도 됨
def slack():
    username = request.form.get("user_name")
    token = request.form.get("token")
    text = request.form.get("text")

    if "날씨" in text:
        msg = forecast()
        send_slack(msg)

    return Response(), 200


app.run()
