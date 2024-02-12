from datetime import datetime

from flask import Flask

app = Flask(__name__)


@app.route("/clock")
def read_clock():
    return str(datetime.now().timestamp())
