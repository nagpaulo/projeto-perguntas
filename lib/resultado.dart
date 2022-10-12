import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;
  final VoidCallback reloadAnwser;

  Resultado(this.pontuacao, this.reloadAnwser, {super.key});

  String get fraseResultado {
    String result = "Algo de errado, ocorreu!";

    if (pontuacao < 8)
      result = "Parabéns!";
    else if (pontuacao < 12)
      result = "Você é bom!";
    else if (pontuacao < 16)
      result = "Impressionante!";
    else
      result = "Nível Jedi!";
    return result;
  }

  final ButtonStyle flatButtonStyle = TextButton.styleFrom(
    foregroundColor: Colors.blue,
    minimumSize: Size(88, 36),
    padding: EdgeInsets.symmetric(horizontal: 16.0),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(2.0)),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            fraseResultado,
            style: TextStyle(
              fontSize: 28,
            ),
          ),
        ),
        TextButton(
          style: flatButtonStyle,
          onPressed: this.reloadAnwser,
          child: Text(
            'Reiniciar?',
            style: TextStyle(fontSize: 18),
          ),
        )
      ],
    );
  }
}
