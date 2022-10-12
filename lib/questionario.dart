import 'package:flutter/widgets.dart';
import 'package:projeto_perguntas/questao.dart';
import 'package:flutter/material.dart';

class Questionario extends StatelessWidget {
  final List<Map<String, dynamic>> perguntas;
  final int perguntaSelecionada;
  final List<Widget> widget;

  Questionario(
      {super.key,
      required this.perguntas,
      required this.perguntaSelecionada,
      required this.widget});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Questao(perguntas[perguntaSelecionada]['texto'].toString()),
        ...widget,
      ],
    );
  }
}
