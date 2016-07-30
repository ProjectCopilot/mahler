#!/usr/bin/env python

from flask import Flask

app = Flask(__name__)

@app.route('/')
def index():
    # Uptime check
    if request.headers.get('X-Uptime-Check') == 'True':
        return 'OK'
    return 'wip'

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0')

