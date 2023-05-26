import '../../data/repository/shared_prefs_repository.dart';
import '../../models/employee.dart';

abstract class ILocalService {
  void createEmployee(Employee employee);

  Future<Employee> getEmployee(String id);

  Future<List<Employee>> getAllEmployees();

  void updateEmployee(Employee employee);

  void deleteEmployee(String id);
}

class SharedPrefsUseCase extends ILocalService {
  final SharedPrefs storage;

  SharedPrefsUseCase({required this.storage});

  @override
  void createEmployee(Employee employee) {
    storage.createEmployee(employee);
  }

  @override
  void deleteEmployee(String id) async {
    storage.deleteEmployee(id);
  }

  @override
  Future<List<Employee>> getAllEmployees() async {
    List<Employee> employeeList = await storage.getAllEmployees();
    return employeeList;
  }

  @override
  Future<Employee> getEmployee(String id) async {
    final employee = await storage.getEmployee(id);
    return employee;
  }

  @override
  void updateEmployee(Employee employee) async {
    await storage.updateEmployee(employee);
  }
}