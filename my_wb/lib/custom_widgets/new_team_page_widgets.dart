import 'package:flutter/material.dart';
import 'package:my_wb/wrapper_classes/form_wrapper_classes.dart';

class FormText extends StatelessWidget {
  final String text;
  const FormText({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      child: Row(
        children: <Widget>[
          Container(
            alignment: Alignment.topLeft,
            child: Text(text,
                style: const TextStyle(fontSize: 16.0, color: Colors.black)),
          ),
        ],
      ),
      color: Colors.white,
      margin: const EdgeInsets.fromLTRB(60, 0, 10, 10),
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
    );
  }
}

class FormCheckbox extends StatefulWidget {
  late Bool isChecked;
  FormCheckbox(this.isChecked);

  @override
  _FormCheckboxState createState() => _FormCheckboxState();
}

class _FormCheckboxState extends State<FormCheckbox> {
  //bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      child: Row(
        children: <Widget>[
          Container(
            alignment: Alignment.topLeft,
            child: const Text(
              "1. Crossed Initiation Line?",
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.black,
              ),
            ),
          ),
          Container(
            alignment: Alignment.topRight,
            child: Checkbox(
              value: widget.isChecked.data,
              onChanged: (bool? value) {
                setState(() {
                  widget.isChecked.data = value!;
                });
              },
            ),
            margin: const EdgeInsets.fromLTRB(50, 0, 10, 0),
          ),
        ],
      ),
      color: Colors.white,
      margin: const EdgeInsets.fromLTRB(30, 0, 10, 10),
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
    );
  }
}
