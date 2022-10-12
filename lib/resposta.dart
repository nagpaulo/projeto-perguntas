import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Resposta extends StatelessWidget {
  final String text;
  final VoidCallback handleAction;

  Resposta(this.text, this.handleAction, {super.key});

  final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    foregroundColor: Colors.white,
    backgroundColor: Colors.blue,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(5)),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 25),
        width: double.infinity,
        child: ElevatedButton(
          onPressed: handleAction,
          child: Text(text),
          style: raisedButtonStyle,
        ));
  }
}
