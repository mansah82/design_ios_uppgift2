import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _questions = [
    "Vilka vinner allsvenskan?",
    "Vilken är din favorit maträtt?",
    "Vilket programmeringsspråk föredrar du?"
  ];

  final _answers1 = ["Hammarby", "Injera", "Dart"];
  final _answers2 = ["Aik", "Lasagne", "Swift"];
  final _answers3 = ["IFK Göteborg", "Pannkaka", "Python"];
  final _answers4 = ["Häcken", "Pasta", "Java"];

  int _questionIndex = 0;

  void _answerQuestion() {
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
  }

  void _reset() {
    setState(() {
      _questionIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    // ignore: dead_code
    return Platform.isAndroid
        ? Scaffold(
            appBar: AppBar(
              title: const Text("Quiz App"),
            ),
            body: _questionIndex < 3
                ? Center(
                    child: Column(
                      children: <Widget>[
                        Text(
                          _questions[_questionIndex],
                          style: const TextStyle(fontSize: 30),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 20),
                        ),
                        Container(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: _answerQuestion,
                            child: Text(
                              _answers1[_questionIndex],
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 20),
                        ),
                        Container(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: _answerQuestion,
                            child: Text(
                              _answers2[_questionIndex],
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 20),
                        ),
                        Container(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: _answerQuestion,
                            child: Text(
                              _answers3[_questionIndex],
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 20),
                        ),
                        Container(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: _answerQuestion,
                            child: Text(
                              _answers4[_questionIndex],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                : Center(
                    child: Column(
                      children: <Widget>[
                        const Text(
                          "Grattis",
                          style: TextStyle(fontSize: 50),
                        ),
                        FloatingActionButton(
                          onPressed: _reset,
                          child: const Icon(Icons.arrow_back),
                        )
                      ],
                    ),
                  ),
          )
        : CupertinoPageScaffold(
            navigationBar: CupertinoNavigationBar(
              backgroundColor: CupertinoColors.systemGrey.withOpacity(0.5),
              middle: const Text('Quiz App'),
            ),
            child: _questionIndex < 3
                ? Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        const SizedBox(height: 50),
                        Container(
                            height: 50,
                            child: Text(_questions[_questionIndex],
                                style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                    decoration: TextDecoration.none,
                                    fontStyle: FontStyle.italic,
                                    color: CupertinoColors.black))),
                        const SizedBox(height: 30),
                        CupertinoButton.filled(
                          onPressed: _answerQuestion,
                          child: Text(
                            _answers1[_questionIndex],
                          ),
                        ),
                        const SizedBox(height: 30),
                        CupertinoButton.filled(
                          onPressed: _answerQuestion,
                          child: Text(_answers2[_questionIndex]),
                        ),
                        const SizedBox(height: 30),
                        CupertinoButton.filled(
                          onPressed: _answerQuestion,
                          child: Text(_answers3[_questionIndex]),
                        ),
                        const SizedBox(height: 30),
                        CupertinoButton.filled(
                          onPressed: _answerQuestion,
                          child: Text(_answers4[_questionIndex]),
                        ),
                      ],
                    ),
                  )
                : Center(
                    child: Column(
                      children: <Widget>[
                        const SizedBox(height: 50),
                        const Text("Grattis",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.none,
                                fontStyle: FontStyle.italic,
                                color: CupertinoColors.black)),
                        const SizedBox(
                          height: 20,
                        ),
                        CupertinoButton.filled(
                          onPressed: _reset,
                          child: const Text("Play Again"),
                        )
                      ],
                    ),
                  ));
  }
}
