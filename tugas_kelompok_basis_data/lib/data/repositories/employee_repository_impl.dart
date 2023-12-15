import 'package:tugas_kelompok_basis_data/data/sources/employee_api.dart';
import 'package:tugas_kelompok_basis_data/domains/repositories/employee_repository.dart';

class EmployeeRepositoryImpl implements EmployeeRepository {
  EmployeeApi api = EmployeeApi();
  @override
  Future<void> getSalary(int id, String pin) async {
    await api.getSalary(id, pin);
  }
}
