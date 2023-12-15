import 'package:tugas_kelompok_basis_data/domains/entities/employee_entity.dart';
import 'package:tugas_kelompok_basis_data/domains/repositories/admin_repository.dart';

class UpdateEmployeeUsecase {
  AdminRepository repository;

  UpdateEmployeeUsecase(this.repository);

  Future<void> updateEmployee(EmployeeEntity employeeData) {
    return repository.updateEmployeeData(employeeData);
  }
}
