import 'package:tugas_kelompok_basis_data/domains/entities/employee_entity.dart';
import 'package:tugas_kelompok_basis_data/domains/repositories/admin_repository.dart';

class GetAllEmployeeUsecase {
  AdminRepository repository;

  GetAllEmployeeUsecase(this.repository);

  Future<List<EmployeeEntity>> getAllEmployee() {
    return repository.getAllEmployee();
  }
}
