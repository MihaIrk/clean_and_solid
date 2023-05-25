import 'package:freezed_annotation/freezed_annotation.dart';

part 'employee.freezed.dart';
part 'employee.g.dart';

@freezed
class Employee with _$Employee{
  const factory Employee({
    required String name,
    required int age,
    required String post,
    required String id,
}) = _Employee;
  factory Employee.fromJson(Map<String, dynamic>json) => _$EmployeeFromJson(json);
}