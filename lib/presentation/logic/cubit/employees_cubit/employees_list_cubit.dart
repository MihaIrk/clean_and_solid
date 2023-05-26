import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../domain/usecases/shared_prefs_use_case.dart';
import '../../../../models/employee.dart';

part 'employees_list_state.dart';

part 'employees_list_cubit.freezed.dart';

class EmployeesListCubit extends Cubit<EmployeesListState> {
  EmployeesListCubit({required this.localService})
      : super(const EmployeesListState(employees: []));
  final ILocalService localService;

  void addNewEmployee(Employee employee) async {
    localService.createEmployee(employee);
    final employees = await localService.getAllEmployees();
    emit(state.copyWith(employees: employees));
  }

  void getEmployeesList() async {
    final employees = await localService.getAllEmployees();
    emit(state.copyWith(employees: employees));
  }

  void deleteEmployee(String id) async {
    localService.deleteEmployee(id);
    final employees = await localService.getAllEmployees();
    emit(state.copyWith(employees: employees));
  }
}
