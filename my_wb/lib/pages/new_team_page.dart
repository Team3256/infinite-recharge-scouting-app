import 'package:flutter/material.dart';
import 'package:my_wb/custom_widgets/new_team_page_widgets.dart';
import 'package:my_wb/wrapper_classes/form_wrapper_classes.dart';
import '../constants.dart';
import '../team.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';

class NewTeamPage extends StatelessWidget {
  Team team = Team(
    //basic
    number: Int(1000),

//auto
    crossedLine: Bool(false),
    autoInner: Int(0),
    autoOuter: Int(0),
    autoBottom: Int(0),
    autoFouls: Int(0),
    autoDisconnect: Bool(false),

//teleop
    teleopInner: Int(0),
    teleopOuter: Int(0),
    teleopBottom: Int(0),
    teleopFouls: Int(0),
    teleopDisconnect: Bool(false),

//endgame
    endgameTask: Str("none"),
    endgameFouls: Int(0),
    endgameDisconnect: Bool(false),

//misc
    comments: Str(""),
    points: Int(0),
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
                  team.number.data = int.parse(text);
                }
              },
            ),
            const Text(
              'Total Points:',
              textScaleFactor: 2,
            ),
            const FormText(text: 'Hello William'),
            FormCheckbox(team.crossedLine),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print(team.toJson());
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
