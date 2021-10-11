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
    endgameTask: Str("None"),
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
        child: ListView(
          children: [
            FormText("Auto: 15 sec"),
            FormCheckbox("crossed line?", team.crossedLine),
            FormCounter("auto inner:", team.autoInner),
            FormCounter("auto outer:", team.autoOuter),
            FormCounter("auto bottom:", team.autoBottom),
            FormCounter("auto fouls:", team.autoFouls),
            FormCheckbox("Disconnect?", team.autoDisconnect),
            FormText("Teleop: 100 sec"),
            FormCounter("teleop inner:", team.teleopInner),
            FormCounter("teleop outer:", team.teleopOuter),
            FormCounter("teleop bottom:", team.teleopBottom),
            FormCounter("teleop fouls:", team.teleopFouls),
            FormCheckbox("Disconnect?", team.teleopDisconnect),
            FormText("Endgame: 30 sec"),
            FormMultChoice(
              "end game task:",
              ['Hang', 'Park', 'Level', 'None'],
              team.endgameTask,
            ),
            FormCounter("endgame fouls:", team.endgameFouls),
            FormCheckbox("Disconnect?", team.endgameDisconnect),
            const SizedBox(height: 100),
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
