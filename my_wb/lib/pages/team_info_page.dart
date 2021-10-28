import 'package:flutter/material.dart';

import '../team.dart';

class TeamPage extends StatelessWidget {
  final Team team;
  const TeamPage({required this.team, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> infoContainers = [];
    team.toMap().keys.forEach(
          (k) => infoContainers.add(
            Text(
              k + ": " + team.toMap()[k].toString(),
              textScaleFactor: 2,
            ),
          ),
        );
    return Scaffold(
      appBar: AppBar(
        title: const Text('Team Info Page'),
      ),
      body: Center(
        child: ListView(
          children: infoContainers,
        ),
      ),
    );
  }
}
