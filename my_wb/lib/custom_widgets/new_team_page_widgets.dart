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
  final String label;
  FormCheckbox(this.label, this.isChecked);

  @override
  _FormCheckboxState createState() => _FormCheckboxState();
}

class _FormCheckboxState extends State<FormCheckbox> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        setState() {
          widget.isChecked.data = !widget.isChecked.data;
        }
      },
      child: Text(widget.label),
    );
  }
}

class FormField extends StatelessWidget {
  final String label;
  final Str input;
  const FormField(this.label, this.input);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(label),
        TextFormField(
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Enter here',
          ),
        ),
      ],
    );
  }
}

class FormCounter extends StatefulWidget {
  final String label;
  final Int input;
  const FormCounter(this.label, this.input);
  @override
  _FormCounterState createState() => _FormCounterState();
}

class _FormCounterState extends State<FormCounter> {
  void add() {
    setState(() {
      widget.input.data += 1;
    });
  }

  void subtract() {
    setState(() {
      widget.input.data -= 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Text(
        widget.label,
        textScaleFactor: 2,
      ),
      Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
        CounterButton(add, true),
        SizedBox(
          width: 50,
          height: 50,
          child: Center(
            child: Text(
              widget.input.data.toString(),
              textScaleFactor: 2,
            ),
          ),
        ),
        CounterButton(subtract, false),
      ]),
    ]);
  }
}

class CounterButton extends StatelessWidget {
  final Function activate;
  final bool isAdd;
  const CounterButton(this.activate, this.isAdd);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () {
        activate();
      },
      elevation: 2.0,
      fillColor: isAdd ? Colors.greenAccent : Colors.redAccent,
      child: Icon(
        isAdd ? Icons.add : Icons.remove,
        size: 35.0,
      ),
      padding: const EdgeInsets.all(15.0),
      shape: const CircleBorder(),
    );
  }
}
