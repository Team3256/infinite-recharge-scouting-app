import 'package:flutter/material.dart';

import '../team.dart';

class TeamPage extends StatelessWidget {
  final Team team;
  const TeamPage({required this.team, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Team Info Page'),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              team.number.toString(),
              textScaleFactor: 3,
            ),
            Text(
              team.points.toString(),
              textScaleFactor: 2,
            ),
          ],
        ),
      ),
    );
  }
}
