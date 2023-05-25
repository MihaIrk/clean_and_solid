import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../../domain/repository/i_repository.dart';
import '../../models/employee.dart';

class SharedPrefs implements ILocalRepository{
  late final SharedPreferences _prefs;
  //final _prefs = getIt<SharedPreferences>();
  Future<void> init()async {
    _prefs = await SharedPreferences.getInstance();
  }

  @override
  Future createEmployee(Employee employee) async {
    final allEmployeesString = _prefs.getString('employees');
    List<dynamic>dynamicList = [];
    if (allEmployeesString != null) {
      dynamicList = jsonDecode(allEmployeesString);
    }
    List<Employee> employees = [];
    if(dynamicList.isNotEmpty) {
      employees = dynamicList.map((e) => Employee.fromJson(e as Map<String, dynamic>)).toList();
    }
    employees.add(employee);
    await _prefs.setString("employees",jsonEncode(employees));
    await _prefs.setString('id', jsonEncode(employee));
  }

  @override
  Future deleteEmployee(String id) async {
    final String? allEmployeesString = _prefs.getString('employees');
    List<dynamic>dynamicList = jsonDecode(allEmployeesString!);
    List<Employee> employees = [];
    if(dynamicList.isNotEmpty) {
      employees = dynamicList.map((e) => Employee.fromJson(e as Map<String, dynamic>)).toList();
      employees.removeWhere((element) => element.id == id);
      await _prefs.setString('employees', jsonEncode(employees));
    }
    await _prefs.remove(id);
  }

  @override
  Future <List<Employee>> getAllEmployees() async {
    final String? allEmployeesString = _prefs.getString('employees');
    final List<dynamic>dynamicList = jsonDecode(allEmployeesString!);
    List<Employee> employees = [];
    if(dynamicList.isNotEmpty) {
      employees = dynamicList.map((e) => Employee.fromJson(e as Map<String, dynamic>)).toList();
    }
    return employees;
  }

  @override
  Future<Employee> getEmployee(String id) async {
    final String? value = _prefs.getString(id);
    final Employee employee = jsonDecode(value!);
    return employee;
  }

  @override
  Future updateEmployee(Employee employee) async {
    await _prefs.setString(employee.id, jsonEncode(employee));
  }
}