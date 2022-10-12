import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import './questao.dart';
import './resposta.dart';
import './resultado.dart';

main() => runApp(PerguntaApp());

class PerguntaApp extends StatefulWidget {
  @override
  State<PerguntaApp> createState() => _PerguntaAppState();
}

class _PerguntaAppState extends State<PerguntaApp> {
  int _perguntaSelecionada = 0;
  final String _title = "Perguntas";
  final String data = 'Parabéns!';
  final List<Map<String, dynamic>> _perguntas = const [
    {
      'texto': 'Qual é a sua cor favorita?',
      'respostas': ['Preto', 'Vermelho', 'Verde', 'Branco', 'Outro'],
    },
    {
      'texto': 'Qual é o seu animal favorito?',
      'respostas': ['Coelho', 'Cobra', 'Elefante', 'Leão', 'Outro'],
    },
    {
      'texto': 'Qual é o seu instrutor favorito?',
      'respostas': ['Paulo', 'Bebeto', 'Daniel', 'Ronaldo', 'Outro'],
    }
  ];

  void _responder() {
    if (isQuestionSelected) {
      setState(() {
        _perguntaSelecionada++;
      });
    }
  }

  bool get isQuestionSelected {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<String> respostas =
        isQuestionSelected ? _perguntas[_perguntaSelecionada]['respostas'] : [];
    List<Widget> widget =
        respostas.map((t) => Resposta(t, _responder)).toList();

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Container(
            width: double.infinity,
            child: Text(
              _title,
              style: TextStyle(fontSize: 28),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        body: isQuestionSelected
            ? Column(
                children: <Widget>[
                  Questao(_perguntas[_perguntaSelecionada]['texto'].toString()),
                  ...widget,
                ],
              )
            : Resultado(data),
      ),
    );
  }
}
