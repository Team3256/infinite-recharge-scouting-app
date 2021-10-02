from flask import Flask, request, jsonify
from flask_sqlalchemy import SQLAlchemy
import random

#setup
app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///scouting-report.db'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
db = SQLAlchemy(app)

class Team(db.Model):
    #basic
    id = db.Column(db.Integer, primary_key=True)
    number = db.Column(db.Integer, unique=True, nullable=False)
    
    #auto
    crossedLine = db.Column(db.Boolean, nullable=False)
    autoInner = db.Column(db.Integer, nullable=False)
    autoOuter = db.Column(db.Integer, nullable=False)
    autoBottom = db.Column(db.Integer, nullable=False)
    autoFouls = db.Column(db.Integer, nullable=False)
    autoDisconnect = db.Column(db.Boolean, nullable=False)

    #teleop
    teleopInner = db.Column(db.Integer, nullable=False)
    teleopOuter = db.Column(db.Integer, nullable=False)
    teleopBottom = db.Column(db.Integer, nullable=False)
    teleopFouls = db.Column(db.Integer, nullable=False)
    teleopDisconnect = db.Column(db.Boolean, nullable=False)

    #endgame
    endgameTask = db.Column(db.String(5), nullable=True)
    endgameFouls = db.Column(db.Integer, nullable=False)
    endgameDisconnect = db.Column(db.Boolean, nullable=False)

    #misc
    comments = db.Column(db.String(100), nullable=True)
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
    team = Team(
        #basic
        number = request.json["number"],
        
        #auto
        crossedLine = request.json["crossedLine"],
        autoInner = request.json["autoInner"],
        autoOuter = request.json["autoOuter"],
        autoBottom = request.json["autoBottom"],
        autoFouls = request.json["autoFouls"],
        autoDisconnect = request.json["autoDisconnect"],

        #teleop
        teleopInner = request.json["teleopInner"],
        teleopOuter = request.json["teleopOuter"],
        teleopBottom = request.json["teleopBottom"],
        teleopFouls = request.json["teleopFouls"],
        teleopDisconnect = request.json["teleopDisconnect"],

        #endgame
        endgameTask = request.json["endgameTask"],
        endgameFouls = request.json["endgameFouls"],
        endgameDisconnect = request.json["endgameDisconnect"],

        #misc
        comments = request.json["comments"],
        points = request.json["points"]
    )

    db.session.add(team)
    db.session.commit()
    return 'Success'

@app.route('/delete-all', methods=["GET"])
def delete_all():
    teams = db.session.query(Team).all()
    for team in teams:
        db.session.delete(team)
        db.session.commit()
    return 'Success'


if __name__ == "__main__":
    app.run(host="0.0.0.0", debug=True)