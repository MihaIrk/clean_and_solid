import '../../domain/repository/i_repository_service.dart';
import '../../models/employee.dart';
import '../repository/shared_prefs_repository.dart';

class LocalService extends ILocalService {
  final SharedPrefs storage;

  LocalService({required this.storage});

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