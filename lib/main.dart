import 'package:flutter/material.dart';
import './questionario.dart';
import './resultado.dart';

void main() => runApp(const PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;
  final _perguntas = const [
    {
      'texto': 'Qual é a sua cor favorita?',
      'respostas': [
        {"texto": 'Preto', "pontuacao": 10},
        {"texto": 'Vermelho', "pontuacao": 5},
        {"texto": 'Verde', "pontuacao": 3},
        {"texto": 'Branco', "pontuacao": 1},
      ],
    },
    {
      'texto': 'Qual é o seu animal favorito?',
      'respostas': [
        {"texto": 'Coelho', "pontuacao": 10},
        {"texto": 'Cobra', "pontuacao": 5},
        {"texto": 'Cachorro', "pontuacao": 3},
        {"texto": 'Gato', "pontuacao": 1},
      ],
    },
    {
      'texto': 'Qual é a sua marca de carro favorita?',
      'respostas': [
        {"texto": 'Dodge', "pontuacao": 10},
        {"texto": 'Porshe', "pontuacao": 5},
        {"texto": 'Chevrolet', "pontuacao": 3},
        {"texto": 'Alfa Romeo', "pontuacao": 1},
      ],
    },
  ];

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada()) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
    print(_pontuacaoTotal);
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
              : Resultado(_pontuacaoTotal)),
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
