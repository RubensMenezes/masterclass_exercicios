import 'package:flutter/material.dart';
import 'package:modulo_01/models/employee_model.dart';

class EmployeeForm extends StatefulWidget {
  final Function(EmployeeModel) onSubmit;

  const EmployeeForm({super.key, required this.onSubmit});

  @override
  State<EmployeeForm> createState() => _EmployeeFormState();
}

class _EmployeeFormState extends State<EmployeeForm> {
  String? genero;
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _sobrenomeController = TextEditingController();
  final TextEditingController _designacaoController = TextEditingController();
  final TextEditingController _telefoneController = TextEditingController();

  void _handleSubmit() {
    if (_nomeController.text.isNotEmpty &&
        _sobrenomeController.text.isNotEmpty &&
        genero != null &&
        _idController.text.isNotEmpty &&
        _designacaoController.text.isNotEmpty &&
        _telefoneController.text.isNotEmpty) {
      widget.onSubmit(
        EmployeeModel(
          id: _idController.text,
          nome: _nomeController.text,
          sobreNome: _sobrenomeController.text,
          genero: genero!,
          designacao: _designacaoController.text,
          telefone: _telefoneController.text,
        ),
      );

      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: 400,
            ),
            child: Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: const BorderSide(color: Colors.grey),
              ),
              child: Padding(
                padding: EdgeInsets.all(12),
                child: Column(
                  spacing: 10,
                  children: [
                    Row(
                      spacing: 10,
                      children: [
                        Text("Nome:"),
                        Expanded(
                          child: TextField(
                            controller: _nomeController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              filled: true,
                              fillColor: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      spacing: 10,
                      children: [
                        Text("Sobrenome:"),
                        Expanded(
                          child: TextField(
                            controller: _sobrenomeController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              filled: true,
                              fillColor: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: RadioListTile<String>(
                            title: const Text("Masculino"),
                            value: "Masculino",
                            groupValue: genero,
                            onChanged: (value) => setState(() => genero = value),
                          ),
                        ),
                        Expanded(
                          child: RadioListTile<String>(
                            title: const Text("Feminino"),
                            value: "Feminino",
                            groupValue: genero,
                            onChanged: (value) => setState(() => genero = value),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      spacing: 10,
                      children: [
                        Text("ID do Funcionário"),
                        Expanded(
                          child: TextField(
                            controller: _idController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              filled: true,
                              fillColor: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      spacing: 10,
                      children: [
                        Text("Designação"),
                        Expanded(
                          child: TextField(
                            controller: _designacaoController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              filled: true,
                              fillColor: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      spacing: 10,
                      children: [
                        Text("Telefone"),
                        Expanded(
                          child: TextField(
                            controller: _telefoneController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              filled: true,
                              fillColor: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      spacing: 10,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: const Text("Cancelar"),
                        ),
                        ElevatedButton(
                          onPressed: _handleSubmit,
                          child: const Text("Salvar"),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
