import 'package:tugas_kelompok_basis_data/domains/entities/company_entity.dart';
import 'package:tugas_kelompok_basis_data/domains/repositories/admin_repository.dart';

class GetAllCompanyUsecase {
  AdminRepository repository;

  GetAllCompanyUsecase(this.repository);

  Future<List<CompanyEntity>> getAllCompany() {
    return repository.getAllCompany();
  }
}
