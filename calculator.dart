import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
void main() => runApp(MaterialApp(home: Calc()));
class Calc extends StatefulWidget {
  _CalcState createState() => _CalcState();
}
class _CalcState extends State<Calc> {
  String i = '', r = '0';
  void p(String v) {
    setState(() {
      if (v == 'AC') { i = ''; r = '0'; }
      else if (v == '=') {
        try { r = Parser().parse(i).evaluate(EvaluationType.REAL, ContextModel()).toString(); }
        catch (e) { r = 'Err'; }
      } else i += v;
    });
  }
  Widget b(String v) => Expanded(child: TextButton(onPressed: () => p(v), child: Text(v)));
  Widget build(BuildContext c) => Scaffold(
    body: Column(children: [
      Text(i), Text(r),
      Row(children: [b('7'), b('8'), b('9'), b('/')]),
      Row(children: [b('4'), b('5'), b('6'), b('*')]),
      Row(children: [b('1'), b('2'), b('3'), b('-')]),
      Row(children: [b('AC'), b('0'), b('='), b('+')]),
    ]),
  );
}
