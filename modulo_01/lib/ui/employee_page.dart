import 'package:flutter/material.dart';
import 'package:modulo_01/models/employee_model.dart';
import 'package:modulo_01/ui/employee_form.dart';

class EmployeePage extends StatefulWidget {
  const EmployeePage({super.key});

  @override
  State<EmployeePage> createState() => _EmployeePageState();
}

class _EmployeePageState extends State<EmployeePage> {
  final List<EmployeeModel> _employees = [];

  void _addEmployee(EmployeeModel employee) {
    setState(() {
      _employees.add(employee);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detalhes do funcionário')),
      body: Column(
        children: [
          Expanded(
            child: _employees.isEmpty
                ? const Center(child: Text("Nenhum funcionário adicionado ainda."))
                : ListView.builder(
                    itemCount: _employees.length,
                    itemBuilder: (context, index) {
                      final e = _employees[index];
                      return Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                          side: const BorderSide(color: Colors.grey),
                        ),
                        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                        child: ListTile(
                          title: Text("${e.nome} ${e.sobreNome}"),
                          subtitle: Text("ID: ${e.id} - ${e.designacao}"),
                          trailing: Text(e.genero),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => EmployeeForm(onSubmit: _addEmployee),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
