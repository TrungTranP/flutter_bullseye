import "package:flutter/material.dart";

void main() {
  runApp(const MaterialApp(
    title: 'bullseye',
    home: GamePage(),
  ));
}

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  bool _alertIsVisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        width: double.infinity,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Bulleyes',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              TextButton(
                child: const Text(
                  'Hit me!',
                  style: TextStyle(color: Color.fromARGB(253, 22, 55, 82)),
                ),
                onPressed: () {
                  _alertIsVisible = true;
                  _showAlert(context);
                },
              )
            ]),
      ),
    ));
  }

  void _showAlert(BuildContext context) {
    var okButton = TextButton(
      onPressed: () {
        Navigator.of(context).pop();
        _alertIsVisible = true;
        print('Awesome pressed! $_alertIsVisible');
      },
      child: const Text('Awesome!'),
    );
    showDialog(
        context: context,
        barrierDismissible: true,
        barrierColor: Colors.yellow,
        builder: (context) {
          return AlertDialog(
            title: const Text('Hello there!'),
            content: const Text('This is my first popup'),
            actions: [
              okButton,
            ],
            elevation: 5,
          );
        });
  }
}
