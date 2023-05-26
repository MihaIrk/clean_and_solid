import 'package:clean_and_solid/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

import '../../models/employee.dart';
import '../logic/cubit/employees_cubit/employees_list_cubit.dart';

class AddNewEmployeeScreen extends StatefulWidget {
  const AddNewEmployeeScreen({Key? key}) : super(key: key);

  @override
  State<AddNewEmployeeScreen> createState() => _AddNewEmployeeScreenState();
}

class _AddNewEmployeeScreenState extends State<AddNewEmployeeScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? newEmployeeName;
  String? newEmployeePost;
  int? newEmployeeAge;
  String? newEmployeeId;

  void setName(String? value) {
    newEmployeeName = value!;
  }

  void setPost(String? value) {
    newEmployeePost = value!;
  }

  void setAge(String? value) {
    newEmployeeAge = int.tryParse(value!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Добавить нового сотрудника'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFieldWidget(label: 'Имя сотрудника', setValue: setName),
            TextFieldWidget(label: 'Должность', setValue: setPost),
            TextFieldAgeWidget(setValue: setAge),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  final newEmployee = Employee(
                      name: newEmployeeName!,
                      age: newEmployeeAge!,
                      post: newEmployeePost!,
                      id: getIt<Uuid>().v4());
                  context
                      .read<EmployeesListCubit>()
                      .addNewEmployee(newEmployee);
                  Navigator.pop(context);
                }
              },
              child: const Text('Сохранить'),
            ),
          ],
        ),
      ),
    );
  }
}

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({Key? key, required this.label, required this.setValue})
      : super(key: key);
  final String label;
  final Function(String? value) setValue;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        textCapitalization: TextCapitalization.sentences,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: label,
        ),
        onSaved: setValue,
      ),
    );
  }
}

class TextFieldAgeWidget extends StatelessWidget {
  const TextFieldAgeWidget({Key? key, required this.setValue})
      : super(key: key);
  final Function(String? value) setValue;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        textCapitalization: TextCapitalization.sentences,
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Возраст',
        ),
        onSaved: setValue,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      ),
    );
  }
}
