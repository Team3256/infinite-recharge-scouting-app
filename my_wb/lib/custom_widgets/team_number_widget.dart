import 'package:flutter/material.dart';
import 'package:my_wb/wrapper_classes/form_wrapper_classes.dart';
import 'package:pinput/pin_put/pin_put.dart';

class TeamInput extends StatefulWidget {
  final Int number;
  const TeamInput(this.number, {Key? key}) : super(key: key);
  @override
  TeamInputState createState() => TeamInputState();
}

class TeamInputState extends State<TeamInput> {
  final TextEditingController _pinPutController = TextEditingController();
  final FocusNode _pinPutFocusNode = FocusNode();

  BoxDecoration get _pinPutDecoration {
    return BoxDecoration(
      border: Border.all(color: Colors.blueAccent),
      borderRadius: BorderRadius.circular(15.0),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return Container(
          alignment: Alignment.topCenter,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                child:
                    Text("Enter Team Number", style: TextStyle(fontSize: 30)),
              ),
              Container(
                margin: const EdgeInsets.all(10.0),
                padding: const EdgeInsets.all(10.0),
                child: PinPut(
                  eachFieldHeight: 100,
                  eachFieldWidth: 70,
                  fieldsCount: 4,
                  textStyle: TextStyle(fontSize: 30),
                  onSubmit: (String pin) => {
                    widget.number.data = int.parse(pin, onError: (e) => 0000),
                    print(widget.number.data)
                  },
                  focusNode: _pinPutFocusNode,
                  controller: _pinPutController,
                  submittedFieldDecoration: _pinPutDecoration.copyWith(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  selectedFieldDecoration: _pinPutDecoration.copyWith(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  followingFieldDecoration: _pinPutDecoration.copyWith(
                    borderRadius: BorderRadius.circular(5.0),
                    border: Border.all(
                      color: Colors.lightBlueAccent.withOpacity(.5),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30.0),
            ],
          ),
        );
      },
    );
  }
}
