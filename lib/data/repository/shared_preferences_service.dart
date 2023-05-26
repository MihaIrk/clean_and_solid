import 'package:clean_and_solid/data/source/local/shared_preferences_storage.dart';

import '../../domain/repository_interface/i_repository.dart';
import '../../models/employee.dart';

class SharedPreferencesService implements ILocalRepository{
  SharedPreferencesRepository repository;

  SharedPreferencesService({
    required this.repository,
    });

  @override
  Future createEmployee(Employee employee) {
    return repository.createEmployee(employee);
  }

  @override
  Future deleteEmployee(String id) {
    return repository.deleteEmployee(id);
  }

  @override
  Future<List<Employee>> getAllEmployees() {
    return repository.getAllEmployees();
  }

  @override
  Future<Employee> getEmployee(String id) {
    return repository.getEmployee(id);
  }

  @override
  Future updateEmployee(Employee employee) {
    return repository.updateEmployee(employee);
  }
}