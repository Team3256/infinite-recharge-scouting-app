import 'package:flutter/material.dart';
import '../constants.dart';
import '../team.dart';
import 'package:http/http.dart' as http;

class NewTeamPage extends StatelessWidget {
  Team team = Team(
    number: 100000,
    points: 0,
  );

  NewTeamPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Log New Team Page'),
      ),
      body: Center(
        child: Column(
          children: const [
            Text(
              'Team Name:',
              textScaleFactor: 3,
            ),
            Text(
              'Total Points:',
              textScaleFactor: 2,
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        width: double.infinity,
        height: 75,
        color: Colors.blue,
        child: FlatButton(
          onPressed: () async {
            await http.po(
              Uri.parse(server + '/add'),
              body: team.toJson(),
            );
          },
          child: const Text(
            "Submit",
            textScaleFactor: 2,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
