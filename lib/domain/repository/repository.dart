import '../models/employee.dart';


abstract class ILocalRepository {
  Future createEmployee(Employee employee);
  Future<Employee> getEmployee(String id);
  Future<List<Employee>> getAllEmployees();
  Future updateEmployee(Employee employee);
  Future deleteEmployee(String id);
}