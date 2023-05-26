import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../domain/usecases/shared_prefs_use_case.dart';
import '../../../../models/employee.dart';

part 'employees_list_state.dart';

part 'employees_list_cubit.freezed.dart';

class EmployeesListCubit extends Cubit<EmployeesListState> {
  EmployeesListCubit({required this.useCase})
      : super(const EmployeesListState(employees: []));
  final SharedPrefsUseCase useCase;

  void addNewEmployee(Employee employee) async {
    useCase.createEmployee(employee);
    final employees = await useCase.getAllEmployees();
    emit(state.copyWith(employees: employees));
  }

  void getEmployeesList() async {
    final employees = await useCase.getAllEmployees();
    emit(state.copyWith(employees: employees));
  }

  void deleteEmployee(String id) async {
    useCase.deleteEmployee(id);
    final employees = await useCase.getAllEmployees();
    emit(state.copyWith(employees: employees));
  }
}
