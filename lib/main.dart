import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:projeto_perguntas/questionario.dart';
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
  int _pontuacaoTotal = 0;
  final String _title = "Perguntas";
  final List<Map<String, dynamic>> _perguntas = const [
    {
      'texto': 'Qual é a sua cor favorita?',
      'respostas': [
        {'texto': 'Preto', 'pontuacao': 10},
        {'texto': 'Vermelho', 'pontuacao': 8},
        {'texto': 'Verde', 'pontuacao': 5},
        {'texto': 'Branco', 'pontuacao': 3},
        {'texto': 'Outro', 'pontuacao': 1},
      ],
    },
    {
      'texto': 'Qual é o seu animal favorito?',
      'respostas': [
        {'texto': 'Coelho', 'pontuacao': 10},
        {'texto': 'Cobra', 'pontuacao': 8},
        {'texto': 'Elefante', 'pontuacao': 5},
        {'texto': 'Leão', 'pontuacao': 3},
        {'texto': 'Outro', 'pontuacao': 1},
      ],
    },
    {
      'texto': 'Qual é o seu instrutor favorito?',
      'respostas': [
        {'texto': 'Paulo', 'pontuacao': 8},
        {'texto': 'Bebeto', 'pontuacao': 10},
        {'texto': 'Daniel', 'pontuacao': 5},
        {'texto': 'Ronaldo', 'pontuacao': 3},
        {'texto': 'Outro', 'pontuacao': 1},
      ],
    }
  ];

  _responder(int pontuacao) {
    if (isQuestionSelected) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }

    print(_pontuacaoTotal);
  }

  bool get isQuestionSelected {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> respostas =
        isQuestionSelected ? _perguntas[_perguntaSelecionada]['respostas'] : [];
    List<Widget> widget = respostas.map((resp) {
      return Resposta(
        resp['texto'],
        () => _responder(resp['pontuacao']),
      );
    }).toList();

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
            ? Questionario(
                perguntaSelecionada: _perguntaSelecionada,
                perguntas: _perguntas,
                widget: widget,
              )
            : Resultado(_pontuacaoTotal),
      ),
    );
  }
}
