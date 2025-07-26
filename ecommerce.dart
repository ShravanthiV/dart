import 'package:flutter/material.dart';
void main() => runApp(MaterialApp(home: Home()));
class Home extends StatelessWidget {
  final p = [{'name': 'Shirt', 'price': '29.99'},{'name': 'Shoes', 'price': '49.99'},{'name': 'Hat', 'price': '15.99'}];
  Widget build(c) => Scaffold(
    appBar: AppBar(title: Text('Shop')),
    body: ListView.builder(
      itemCount: p.length,
      itemBuilder: (_, i) => ListTile(
        title: Text(p[i]['name']!),
        subtitle: Text('\$${p[i]['price']}'),
        trailing: ElevatedButton(
          child: Text('Add'),
          onPressed: () => ScaffoldMessenger.of(c).showSnackBar(SnackBar(content: Text('${p[i]['name']} added'))),
        ),
        onTap: () => Navigator.push(c, MaterialPageRoute(builder: (_) => Detail(p[i]))),
      ),
    ),
  );
}
class Detail extends StatelessWidget {
  final Map<String, String> d;
  Detail(this.d);
  Widget build(c) => Scaffold(
    appBar: AppBar(title: Text(d['name']!)),
    body: Center(child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Text(d['name']!, style: TextStyle(fontSize: 24)), Text('\$${d['price']}', style: TextStyle(fontSize: 20))],
  )),
  );
}
