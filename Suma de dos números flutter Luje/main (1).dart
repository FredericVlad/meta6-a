import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SumaScreen(),
    );
  }
}

class SumaScreen extends StatefulWidget {
  @override
  _SumaScreenState createState() => _SumaScreenState();
}

class _SumaScreenState extends State<SumaScreen> {
  final num1Controller = TextEditingController();
  final num2Controller = TextEditingController();
  String resultado = "";

  void sumar() {
    final n1 = int.tryParse(num1Controller.text) ?? 0;
    final n2 = int.tryParse(num2Controller.text) ?? 0;
    setState(() {
      resultado = "Resultado: ${n1 + n2}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Suma de 2 números")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: num1Controller,
              decoration: InputDecoration(labelText: "Número 1"),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: num2Controller,
              decoration: InputDecoration(labelText: "Número 2"),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(onPressed: sumar, child: Text("Sumar")),
            SizedBox(height: 20),
            Text(resultado, style: TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}

