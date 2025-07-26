import 'package:flutter/material.dart';
void main() => runApp(MaterialApp(home: Home()));
class Home extends StatelessWidget {
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: Text('Home Screen')),
    body: Center(
      child: ElevatedButton(
        child: Text('Go to Details'),
        onPressed: () => Navigator.push(
          context, MaterialPageRoute(builder: (_) => Details())),
      ),
    ),
  );
}
class Details extends StatelessWidget {
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: Text('Details Screen')),
    body: Center(
      child: ElevatedButton(
        child: Text('Back to Home'),
        onPressed: () => Navigator.pop(context),
      ),
  ),
  );
}
