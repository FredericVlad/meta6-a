import 'package:flutter/material.dart';

void main() {
  runApp(const SumaApp());
}

class SumaApp extends StatelessWidget {
  const SumaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora de Suma',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SumaScreen(),
    );
  }
}

class SumaScreen extends StatefulWidget {
  const SumaScreen({super.key});

  @override
  State<SumaScreen> createState() => _SumaScreenState();
}

class _SumaScreenState extends State<SumaScreen> {
  // Controladores para capturar el texto de los campos de entrada
  final TextEditingController _num1Controller = TextEditingController();
  final TextEditingController _num2Controller = TextEditingController();

  String _resultado = '0';

  void _calcularSuma() {
    // Obtener los valores de los controladores
    final String val1 = _num1Controller.text;
    final String val2 = _num2Controller.text;

    // Convertir a double. Usamos tryParse para manejar posibles errores de formato.
    final double? num1 = double.tryParse(val1);
    final double? num2 = double.tryParse(val2);

    if (num1 != null && num2 != null) {
      // Realizar la suma
      final double suma = num1 + num2;
      
      setState(() {
        _resultado = suma.toStringAsFixed(2); // Muestra el resultado con 2 decimales
      });
    } else {
      // Mostrar un mensaje de error si los campos no son números
      setState(() {
        _resultado = 'Error: Ingresa números válidos';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Suma de Dos Números'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // Campo para el primer número
            TextField(
              controller: _num1Controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Número 1',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            // Campo para el segundo número
            TextField(
              controller: _num2Controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Número 2',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            // Botón para calcular
            ElevatedButton(
              onPressed: _calcularSuma,
              child: const Text('Calcular Suma'),
            ),
            const SizedBox(height: 30),
            // Mostrar resultado
            Text(
              'Resultado: $_resultado',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _num1Controller.dispose();
    _num2Controller.dispose();
    super.dispose();
  }
}