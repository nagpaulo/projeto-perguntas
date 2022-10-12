import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;

  const Resultado(this.pontuacao, {super.key});

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

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        fraseResultado,
        style: TextStyle(
          fontSize: 28,
        ),
      ),
    );
  }
}
