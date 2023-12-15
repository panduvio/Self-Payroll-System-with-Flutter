import 'package:tugas_kelompok_basis_data/domains/entities/employee_entity.dart';
import 'package:tugas_kelompok_basis_data/domains/repositories/admin_repository.dart';

class PostEmployeeUsecase {
  AdminRepository repository;

  PostEmployeeUsecase(this.repository);

  Future<void> postEmployee(EmployeeEntity employeeData) {
    return repository.postEmployee(employeeData);
  }
}
