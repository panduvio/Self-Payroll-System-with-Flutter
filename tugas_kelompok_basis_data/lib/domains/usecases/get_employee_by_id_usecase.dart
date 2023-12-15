import 'package:tugas_kelompok_basis_data/domains/entities/employee_entity.dart';
import 'package:tugas_kelompok_basis_data/domains/repositories/admin_repository.dart';

class GetEmployeeByIdUsecase {
  AdminRepository repository;

  GetEmployeeByIdUsecase(this.repository);

  Future<EmployeeEntity> getEmployeeById(int id) {
    return repository.getEmployeeById(id);
  }
}
