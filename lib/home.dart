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
  final TextEditingController _cnpjController = TextEditingController();
  String _valorRecuperado = "";

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
            //CPF
            TextField(
              controller: _cpfController,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                CpfInputFormatter()
              ],
              decoration: const InputDecoration(hintText: "Digite CPF"),
            ),
            //CNPJ
            TextField(
              controller: _cnpjController,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                CnpjInputFormatter()
              ],
              decoration: const InputDecoration(hintText: "Digite CNPJ"),
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    //_valorRecuperado = _cpfController.text.toString();
                    _valorRecuperado = _cnpjController.text.toString();
                  });
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
