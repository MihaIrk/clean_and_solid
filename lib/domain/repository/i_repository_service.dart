import '../../models/employee.dart';

abstract class ILocalService {
  void createEmployee(Employee employee);
  Future <Employee> getEmployee(String id);
  Future <List<Employee>> getAllEmployees();
  void updateEmployee(Employee employee);
  void deleteEmployee(String id);
}