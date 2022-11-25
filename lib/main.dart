import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Prime Numbers Generator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Prime Numbers Generator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List _list = <int>[];
  void findPrimeNumber() {
    setState(() {
      int n;
      int lenOld = _list.length;
      if (lenOld == 0) {
        n = 1;
      } else {
        n = _list.last;
      }

      while (_list.length == lenOld) {
        n++;
        for (var i = 2; i <= n; i++) {
          if (n % i == 0) {
            if (i != n) {
              break;
            } else {
              _list.add(n);
            }
          }
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(widget.title),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'List of prime numbers:',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 25),
            ),
            Text(
              '$_list',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: findPrimeNumber,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
