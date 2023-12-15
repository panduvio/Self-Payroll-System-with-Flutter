import 'package:tugas_kelompok_basis_data/data/sources/employee_api.dart';
import 'package:tugas_kelompok_basis_data/domains/repositories/employee_repository.dart';

class EmployeeRepositoryImpl implements EmployeeRepository {
  EmployeeApi api = EmployeeApi();
  @override
  Future<bool> getSalary(int id, String pin) async {
    final result = await api.getSalary(id, pin);
    return result;
  }
}
