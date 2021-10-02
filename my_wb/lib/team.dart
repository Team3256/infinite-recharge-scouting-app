import 'dart:convert';

import 'package:my_wb/wrapper_classes/form_wrapper_classes.dart';

class Team {
  //basic
  Int number;

  //auto
  Bool crossedLine;
  Int autoInner;
  Int autoOuter;
  Int autoBottom;
  Int autoFouls;
  Bool autoDisconnect;

  //teleop
  Int teleopInner;
  Int teleopOuter;
  Int teleopBottom;
  Int teleopFouls;
  Bool teleopDisconnect;

  //endgame
  Str endgameTask;
  Int endgameFouls;
  Bool endgameDisconnect;

  //misc
  Str comments;
  Int points;
  Team({
    //
    required this.number,
    required this.crossedLine,
    required this.autoInner,
    required this.autoOuter,
    required this.autoBottom,
    required this.autoFouls,
    required this.autoDisconnect,
    required this.teleopInner,
    required this.teleopOuter,
    required this.teleopBottom,
    required this.teleopFouls,
    required this.teleopDisconnect,
    required this.endgameTask,
    required this.endgameFouls,
    required this.endgameDisconnect,
    required this.comments,
    required this.points,
  });
  factory Team.fromJson(dynamic json) {
    return Team(
      //basic
      number: Int(json["number"]),

//auto
      crossedLine: Bool(json["crossedLine"]),
      autoInner: Int(json["autoInner"]),
      autoOuter: Int(json["autoOuter"]),
      autoBottom: Int(json["autoBottom"]),
      autoFouls: Int(json["autoFouls"]),
      autoDisconnect: Bool(json["autoDisconnect"]),

//teleop
      teleopInner: Int(json["teleopInner"]),
      teleopOuter: Int(json["teleopOuter"]),
      teleopBottom: Int(json["teleopBottom"]),
      teleopFouls: Int(json["teleopFouls"]),
      teleopDisconnect: Bool(json["teleopDisconnect"]),

//endgame
      endgameTask: Str(json["endgameTask"]),
      endgameFouls: Int(json["endgameFouls"]),
      endgameDisconnect: Bool(json["endgameDisconnect"]),

//misc
      comments: Str(json["comments"]),
      points: Int(json["points"]),
    );
  }
  Map<String, dynamic> toMap() {
    Map<String, dynamic> data = {
      //basic
      "number": number.data,

//auto
      "crossedLine": crossedLine.data,
      "autoInner": autoInner.data,
      "autoOuter": autoOuter.data,
      "autoBottom": autoBottom.data,
      "autoFouls": autoFouls.data,
      "autoDisconnect": autoDisconnect.data,

//teleop
      "teleopInner": teleopInner.data,
      "teleopOuter": teleopOuter.data,
      "teleopBottom": teleopBottom.data,
      "teleopFouls": teleopFouls.data,
      "teleopDisconnect": teleopDisconnect.data,

//endgame
      "endgameTask": endgameTask.data,
      "endgameFouls": endgameFouls.data,
      "endgameDisconnect": endgameDisconnect.data,

//misc
      "comments": comments.data,
      "points": points.data,
    };
    return data;
  }

  String toJson() {
    return json.encode(toMap());
  }
}
/*
//basic
number

//auto
crossedLine
autoInner
autoOuter
autoBottom
autoFouls
autoDisconnect

//teleop
teleopInner
teleopOuter
teleopBottom
teleopFouls
teleopDisconnect

//endgame
endgameTask
endgameFouls
endgameDisconnect

//misc
comments
points
*/
