from flask import Flask, jsonify
import os

app = Flask(__name__)

APP_NAME = os.getenv("APP_NAME", "AWS Production Platform")
APP_VERSION = os.getenv("APP_VERSION", "1.0.0")


@app.route("/")
def home():
    return jsonify(
        {
            "application": APP_NAME,
            "version": APP_VERSION,
            "message": "AWS Production Platform is running",
            "status": "healthy",
        }
    )


@app.route("/health")
def health():
    return jsonify(
        {
            "status": "healthy",
            "application": APP_NAME,
            "version": APP_VERSION,
        }
    ), 200


@app.route("/version")
def version():
    return jsonify(
        {
            "application": APP_NAME,
            "version": APP_VERSION,
        }
    )


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8000)