import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: LogoAnim()));

class LogoAnim extends StatefulWidget {
  @override
  _LogoAnimState createState() => _LogoAnimState();
}

class _LogoAnimState extends State<LogoAnim> with SingleTickerProviderStateMixin {
  late final AnimationController c = AnimationController(vsync: this, duration: Duration(seconds: 8))..repeat(reverse: true);
  late final a = Tween(begin: Offset.zero, end: Offset(0, -2.5)).animate(CurvedAnimation(parent: c, curve: Curves.easeInOut));

  @override
  Widget build(BuildContext context) => Scaffold(
    body: Center(child: SlideTransition(position: a, child: FlutterLogo(size: 100))));
}
