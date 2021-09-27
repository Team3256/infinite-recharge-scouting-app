import 'package:flutter/material.dart';
import '../constants.dart';
import '../team.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';

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
          children: [
            const Text(
              'Team Number:',
              textScaleFactor: 3,
            ),
            TextField(
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly,
              ],
              onChanged: (text) {
                String textFiltered = '';
                for (int i = 0; i < text.length; i++) {
                  textFiltered += text[i];
                }
                if (textFiltered.isNotEmpty) {
                  team.number = int.parse(text);
                }
              },
            ),
            const Text(
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
            print(team.toJson());
            await http.post(
              Uri.parse(server + '/add'),
              headers: <String, String>{
                'Content-Type': 'application/json; charset=UTF-8',
              },
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
