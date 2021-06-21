import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.amber,
        accentColor: Colors.amber,
      ),
      home: Game(),
    );
  }
}

class Game extends StatefulWidget {
  final valor = Random().nextInt(10).toString();
  final valor2 = Random().nextInt(10).toString();
  final operands = ['+', '-', '/', '*'];
  final int indexOperand = Random().nextInt(3);

  String operation() {
    switch (this.indexOperand) {
      case 0:
        return (double.tryParse(this.valor) + double.tryParse(this.valor2))
            .toString();
      case 1:
        return (double.tryParse(this.valor) - double.tryParse(this.valor2))
            .toString();
      case 2:
        return (double.tryParse(this.valor) / double.tryParse(this.valor2))
            .toString();
      case 3:
        return (double.tryParse(this.valor) * double.tryParse(this.valor2))
            .toString();
      default:
        return '0';
    }
  }

  @override
  State<StatefulWidget> createState() => _Game();
}

class _Game extends State<Game> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "It's math time!",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                widget.valor +
                    widget.operands[widget.indexOperand] +
                    widget.valor2,
                style: TextStyle(fontSize: 40.0)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Button(widget.operation()),
                Button(widget.operation()),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class Button extends StatelessWidget {
  final String resultado;
  Button(this.resultado);

  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.amber,
        padding: EdgeInsets.fromLTRB(80.0, 20.0, 80.0, 20.0),
        elevation: 0,
      ),
      onPressed: () {},
      child: Text(
        resultado,
        style: TextStyle(fontSize: 48.0),
      ),
    );
  }
}
