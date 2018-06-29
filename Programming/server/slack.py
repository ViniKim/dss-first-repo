import requests, json
WEBHOOK_URL = "https://hooks.slack.com/services/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"
def send_slack(msg):
    data = {
        "channel": "#vvvv2",
        "emoji": ":dog2:",
        "msg": msg,
        "username": "뀨하",
    }
    payload = {
        "channel": data["channel"],
        "username": data["username"],
        "icon_emoji": data["emoji"],
        "text": data["msg"],
    }
    response = requests.post( WEBHOOK_URL, data = json.dumps(payload), )
