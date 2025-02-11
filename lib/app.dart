import 'package:flutter/material.dart';
import 'package:string_calculator/utils/helpers.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'String Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(title: 'String Calculator'),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String sumValue = '';
  final TextEditingController textEditingController =
      TextEditingController(text: '1\n2,3');

  void sum() {
    try {
      sumValue = Helpers().add(textEditingController.text).toString();
    } catch (e) {
      sumValue = e.toString();
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: textEditingController,
                decoration: const InputDecoration(border: OutlineInputBorder()),
              ),
              const SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  sum();
                },
                child: const Text(
                  'Submit',
                  style: TextStyle(fontSize: 30),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Output is : $sumValue',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
