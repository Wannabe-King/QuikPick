import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      title: 'QuikPick',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage()));
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int? currentChoice;

  int count = 0;

  final myController = TextEditingController();

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  List<String> choices = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 5.0),
            child: Center(
              child: Text(
                'QuikPick',
                style: TextStyle(
                  fontSize: 60,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),
            ),
          ),
          const Text(
            'How it Works?',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w300,
              color: Colors.black26,
            ),
          ),
          const Text(
            '1) Enter the option.',
            style: TextStyle(
              fontWeight: FontWeight.w300,
            ),
          ),
          const Text(
            '2) Add it using Add Option button.',
            style: TextStyle(
              fontWeight: FontWeight.w300,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 30.0),
            child: Text(
              '3) Click on Pick One button and you are done.',
              style: TextStyle(
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
          if (currentChoice == null)
            const Text(
              'What are the options??',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          if (currentChoice != null)
            Text(
              choices[currentChoice!],
              style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            )
          else
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 70.0),
              child: TextField(
                controller: myController,
                decoration: const InputDecoration(
                  hintText: 'Enter Option...',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.text,
                autocorrect: false,
              ),
            ),
          if (currentChoice == null) Text('Option count: $count'),
          const Padding(padding: EdgeInsets.only(bottom: 40.0)),
          if (currentChoice == null)
            TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  foregroundColor: Colors.white,
                  textStyle: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  addChoice(myController.text);
                },
                child: const Text('Add Option')),
          const Padding(padding: EdgeInsets.only(bottom: 20.0)),
          TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Colors.deepPurple,
              foregroundColor: Colors.white,
              textStyle:
                  const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            onPressed: () {
              updateChoice();
            },
            child: const Text('Pick One'),
          ),
          const Padding(padding: EdgeInsets.only(bottom: 20.0)),
          if (currentChoice != null)
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                foregroundColor: Colors.white,
                textStyle:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                reset();
              },
              child: const Text('Reset'),
            )
        ],
      )),
    );
  }

  void updateChoice() {
    final random = Random();
    int index = random.nextInt(choices.length);
    setState(() {
      currentChoice = index;
    });
  }

  void addChoice(String choice) {
    setState(() {
      choices.add(choice);
      count++;
    });
  }

  void reset() {
    setState(() {
      currentChoice = null;
      count = 0;
      choices.clear();
    });
  }
}
