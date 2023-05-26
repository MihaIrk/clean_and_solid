import '../../models/employee.dart';
import '../repository_interface/i_repository.dart';

class SharedPrefsUseCase {
  ILocalRepository repository;

  SharedPrefsUseCase({
    required this.repository,
  });

  void createEmployee(Employee employee) {
    repository.createEmployee(employee);
  }

  void deleteEmployee(String id) async {
    repository.deleteEmployee(id);
  }

  Future<List<Employee>> getAllEmployees() async {
    List<Employee> employeeList = await repository.getAllEmployees();
    return employeeList;
  }

  Future<Employee> getEmployee(String id) async {
    final employee = await repository.getEmployee(id);
    return employee;
  }

  void updateEmployee(Employee employee) async {
    await repository.updateEmployee(employee);
  }
}
