part of 'employees_list_cubit.dart';

@freezed
class EmployeesListState with _$EmployeesListState {
  const factory EmployeesListState({required List<Employee> employees}) =
      _Initial;
}
