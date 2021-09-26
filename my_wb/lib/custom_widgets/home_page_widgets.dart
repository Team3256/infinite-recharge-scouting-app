import 'package:flutter/material.dart';
import 'package:my_wb/pages/team_info_page.dart';

import '../team.dart';

class TeamButton extends StatelessWidget {
  final Team team;
  const TeamButton({required this.team});

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () {
        print('Going to: ' + team.number.toString());
        Navigator.push(
          context,
          MaterialPageRoute(builder: (ctx) => TeamPage(team: team)),
        );
      },
      child: Container(
        margin: const EdgeInsets.all(25),
        width: 200,
        height: 100,
        decoration: const BoxDecoration(
          color: Colors.lightBlueAccent,
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              team.number.toString(),
              style: const TextStyle(
                color: Colors.blueAccent,
                fontSize: 40,
              ),
            ),
            Text(
              "points: " + team.points.toString(),
              style: const TextStyle(
                color: Colors.blueAccent,
                fontSize: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TeamsDisplay extends StatelessWidget {
  final List<Team> teams;
  const TeamsDisplay({required this.teams, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<TeamButton> teamButtons = [];
    for (Team team in teams) {
      teamButtons.add(
        TeamButton(team: team),
      );
    }
    return ListView(
      children: teamButtons,
    );
  }
}
