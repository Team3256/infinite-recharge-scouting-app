from flask import Flask, request, jsonify
from flask_sqlalchemy import SQLAlchemy
import random

#setup
app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///scouting-report.db'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
db = SQLAlchemy(app)

class Team(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    number = db.Column(db.Integer, unique=True, nullable=False)
    points = db.Column(db.Integer, nullable=False)

    def to_dict(self):
        dictionary = {}
        for column in self.__table__.columns:
            dictionary[column.name] = getattr(self, column.name)
        return dictionary

# only run once to init database:
# db.create_all()

@app.route('/', methods=["GET"])
def home():
    return 'This is just an API not gonna give you any nice HTML :)'

@app.route('/all', methods=["GET"])
def get_all():
    teams = db.session.query(Team).all()
    return jsonify(teams=[team.to_dict() for team in teams])

@app.route('/get', methods=["GET"])
def get():
    id = request.args.get('id')
    team = db.session.query(Team).get(id).to_dict()
    return jsonify(team=team)

@app.route('/add', methods=["POST"])
def add():
    team = Team(number=request.json["number"], points=request.json["points"])
    db.session.add(team)
    db.session.commit()
    return 'Success'


if __name__ == "__main__":
    app.run(host="0.0.0.0", debug=True)