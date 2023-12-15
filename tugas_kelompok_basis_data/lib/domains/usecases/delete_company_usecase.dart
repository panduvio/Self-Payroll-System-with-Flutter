import 'package:tugas_kelompok_basis_data/domains/repositories/admin_repository.dart';

class DeleteCompanyUsecase {
  AdminRepository repository;

  DeleteCompanyUsecase(this.repository);

  Future<void> removeCompany(String id) {
    return repository.deleteCompany(id);
  }
}
