import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:brasil_fields/brasil_fields.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _cpfController = TextEditingController();
  final String _valorRecuperado = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mascaras e validações"),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _cpfController,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: const InputDecoration(hintText: "Digite CPF"),
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {});
                },
                child: const Text("Recuperar Valor")),
            Text(
              "Valor: $_valorRecuperado",
              style: const TextStyle(fontSize: 25),
            )
          ],
        ),
      ),
    );
  }
}
