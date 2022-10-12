import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';

class Resultado extends StatelessWidget {
  String data;

  Resultado(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        data,
        style: TextStyle(
          fontSize: 28,
        ),
      ),
    );
  }
}
