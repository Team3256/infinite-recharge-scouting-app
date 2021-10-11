import 'package:flutter/material.dart';
import 'package:my_wb/wrapper_classes/form_wrapper_classes.dart';

class FormText extends StatelessWidget {
  final String text;
  const FormText(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.lightBlueAccent,
      height: 60,
      width: 100,
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 30,
          ),
        ),
      ),
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 90),
      child: SelectButton(
        color: widget.isChecked.data ? Colors.greenAccent : Colors.redAccent,
        onPressed: () {
          setState(() {
            widget.isChecked.data = !widget.isChecked.data;
          });
        },
        label: widget.label,
      ),
    );
  }
}

class FormField extends StatelessWidget {
  final String label;
  final Str input;
  FormField(this.label, this.input);

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
        color: Colors.white,
      ),
      padding: const EdgeInsets.all(15.0),
      shape: const CircleBorder(),
    );
  }
}

class FormMultChoice extends StatefulWidget {
  final List<String> choices;
  final Str selection;
  final String label;
  FormMultChoice(this.label, this.choices, this.selection);

  @override
  _FormMultChoiceState createState() => _FormMultChoiceState();
}

class _FormMultChoiceState extends State<FormMultChoice> {
  void changeState(String data) {
    setState(() {
      widget.selection.data = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [
      Text(
        widget.label,
        textScaleFactor: 2,
      )
    ];
    for (String choice in widget.choices) {
      widgets.add(const SizedBox(
        height: 8,
      ));
      widgets.add(SizedBox(
        width: 200,
        child: SelectButton(
          label: choice,
          color:
              widget.selection.data == choice ? Colors.blue : Colors.blueGrey,
          onPressed: () {
            changeState(choice);
          },
        ),
      ));
    }
    return Column(
      children: widgets,
    );
  }
}

class SelectButton extends StatelessWidget {
  final Color color;
  final Function onPressed;
  final String label;
  const SelectButton({
    Key? key,
    required this.color,
    required this.onPressed,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: RawMaterialButton(
        onPressed: () {
          onPressed();
        },
        fillColor: color,
        child: Text(
          label,
          style: const TextStyle(color: Colors.white, fontSize: 26),
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(40.0),
          ),
        ),
        elevation: 2,
      ),
    );
  }
}
