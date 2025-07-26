import 'package:flutter/material.dart';
void main() => runApp(MaterialApp(home: Counter()));
class Counter extends StatefulWidget {
  @override State<Counter> createState() => _CounterState();
}
class _CounterState extends State<Counter> {
  int c = 0;
  @override Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(title: Text("Counter")),
      body: Column(children: [Text('$c'), Row(children: [
        ElevatedButton(onPressed: () => setState(() => c--), child: Text("-")),
        ElevatedButton(onPressed: () => setState(() => c++), child: Text("+"))
      ])])
  );
}
