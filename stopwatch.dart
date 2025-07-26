import 'dart:async';
import 'package:flutter/material.dart';
void main() => runApp(MaterialApp(home: StopwatchApp()));
class StopwatchApp extends StatefulWidget {
  State<StopwatchApp> createState() => _StopwatchAppState();
}
class _StopwatchAppState extends State<StopwatchApp> {
  final sw = Stopwatch();
  Timer? t;
  String get time {
    final ms = sw.elapsedMilliseconds;
    return '${(ms ~/ 60000).toString().padLeft(2, '0')}:'
           '${((ms ~/ 1000) % 60).toString().padLeft(2, '0')}:'
           '${((ms ~/ 10) % 100).toString().padLeft(2, '0')}';
  }
  void dispose() { t?.cancel(); super.dispose(); }
  Widget build(BuildContext c) => Scaffold(
    body: Center(child: Column(mainAxisSize: MainAxisSize.min, children: [
      Text(time, style: TextStyle(fontSize: 30)),
      Row(mainAxisSize: MainAxisSize.min, children: [
        TextButton(onPressed: () {
          if (!sw.isRunning) {
            sw.start();
            t ??= Timer.periodic(Duration(milliseconds: 100), (_) => setState(() {}));
          }
        }, child: Text(sw.elapsedMilliseconds > 0 && !sw.isRunning ? 'Resume' : 'Start')),
        TextButton(onPressed: sw.isRunning ? () => setState(sw.stop) : null, child: Text('Stop')),
        TextButton(onPressed: () => setState(() { sw.reset(); sw.stop(); }), child: Text('Reset')),
      ])
  ])),
  );
}
