import 'package:clean_and_solid/presentation/pages/employee_info_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/employee.dart';
import '../logic/cubit/employees_cubit/employees_list_cubit.dart';
import 'add_new_employee_screen.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Список сотрудников'),
      ),
      body: BlocBuilder<EmployeesListCubit, EmployeesListState>(
        builder: (context, state) {
          if (state.employees.isEmpty) {
            return const Center(
              child: Text('Увы но у вас нет сотрудников'),
            );
          } else {
            return ListView.builder(
              itemCount: state.employees.length,
              itemBuilder: (context, index) => EmployeeViewWidget(
                employee: state.employees[index],
              ),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Добавить нового сотрудника',
        onPressed: () async {
          Navigator.push(context,
              MaterialPageRoute(builder: (_) => const AddNewEmployeeScreen()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class EmployeeViewWidget extends StatelessWidget {
  const EmployeeViewWidget({Key? key, required this.employee})
      : super(key: key);
  final Employee employee;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text('Имя: ${employee.name}'),
        subtitle: Text('Должность: ${employee.post}'),
        trailing: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => EmployeeInfoScreen(employee: employee),
              ),
            );
          },
          icon: const Icon(Icons.info_outline),
        ),
      ),
    );
  }
}
