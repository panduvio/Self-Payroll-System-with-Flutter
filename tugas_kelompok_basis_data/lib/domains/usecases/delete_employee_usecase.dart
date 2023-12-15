import 'package:tugas_kelompok_basis_data/domains/repositories/admin_repository.dart';

class DeleteEmployeeUsecase {
  AdminRepository repository;

  DeleteEmployeeUsecase(this.repository);

  Future<void> removeEmployee(int id) {
    return repository.deleteEmployee(id);
  }
}
