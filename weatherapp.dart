import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
void main() => runApp(MaterialApp(home: Scaffold(body: WeatherApp())));
class WeatherApp extends StatefulWidget {
  State createState() => _WeatherAppState();
}
class _WeatherAppState extends State<WeatherApp> {
  final c = TextEditingController();
  String r = '';
  void getW() async {
    final res = await http.get(Uri.parse(
      'https://api.openweathermap.org/data/2.5/weather?q=${c.text}&appid=0830225e3b25a0708dd3a3720b39f071'));
    if (res.statusCode == 200) {
      final d = jsonDecode(res.body);
      setState(() => r = '${(d['main']['temp'] - 273.15).toStringAsFixed(1)}°C, ${d['weather'][0]['description']}');
    } else setState(() => r = 'Error');
  }

  Widget build(context) => Column(children: [
    TextField(controller: c),
    ElevatedButton(onPressed: getW, child: Text('Go')),
    Text(r)
  ]);
}
