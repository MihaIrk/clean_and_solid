import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/employee.dart';
import '../logic/cubit/employees_cubit/employees_list_cubit.dart';

class EmployeeInfoScreen extends StatelessWidget {
  const EmployeeInfoScreen({Key? key, required this.employee})
      : super(key: key);
  final Employee employee;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(employee.name),
      ),
      body: Center(
        child: Column(
          children: [
            Text('Возраст сотрудника: ${employee.age}'),
            Text('Должность: ${employee.post}'),
            Text('ID сотрудника: ${employee.id}'),
            ElevatedButton(
              onPressed: () {
                context.read<EmployeesListCubit>().deleteEmployee(employee.id);
                Navigator.pop(context);
              },
              child: const Text('Уволить'),
            ),
          ],
        ),
      ),
    );
  }
}
