import 'dart:convert';

class Team {
  int number;
  int points;
  Team({
    required this.number,
    required this.points,
  });
  factory Team.fromJson(dynamic json) {
    return Team(
      number: json['number'],
      points: json['points'],
    );
  }
  Map<String, dynamic> toMap() {
    Map<String, dynamic> data = {
      'number': number,
      'points': points,
    };
    return data;
  }

  String toJson() {
    return jsonEncode(toMap());
  }
}
