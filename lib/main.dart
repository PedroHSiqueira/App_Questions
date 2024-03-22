import 'package:flutter/material.dart';
import './questionario.dart';
import './resultado.dart';

void main() => runApp(const PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;

  final _perguntas = const [
    {
      'texto': 'Qual é a sua cor favorita?',
      'respostas': [
        {"texto": 'Preto', "nota": 10},
        {"texto": 'Vermelho', "nota": 5},
        {"texto": 'Verde', "nota": 3},
        {"texto": 'Branco', "nota": 1},
      ],
    },
    {
      'texto': 'Qual é o seu animal favorito?',
      'respostas': [
        {"texto": 'Coelho', "nota": 10},
        {"texto": 'Cobra', "nota": 5},
        {"texto": 'Cachorro', "nota": 3},
        {"texto": 'Gato', "nota": 1},
      ],
    },
    {
      'texto': 'Qual é a sua marca de carro favorita?',
      'respostas': [
        {"texto": 'Dodge', "nota": 10},
        {"texto": 'Porshe', "nota": 5},
        {"texto": 'Chevrolet', "nota": 3},
        {"texto": 'Alfa Romeo', "nota": 1},
      ],
    },
  ];

  void _responder() {
    if (temPerguntaSelecionada()) {
      setState(() {
        _perguntaSelecionada++;
      });
    }
  }

  bool temPerguntaSelecionada() {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Perguntas'),
          ),
          body: temPerguntaSelecionada()
              ? Questionario(
                  perguntas: _perguntas,
                  perguntaSelecionada: _perguntaSelecionada,
                  responder: _responder)
              : const Resultado()),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({super.key});

  @override
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
