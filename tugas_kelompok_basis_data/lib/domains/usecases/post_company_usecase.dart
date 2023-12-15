import 'package:tugas_kelompok_basis_data/domains/entities/company_entity.dart';
import 'package:tugas_kelompok_basis_data/domains/repositories/admin_repository.dart';

class PostCompanyUsecase {
  AdminRepository repository;

  PostCompanyUsecase(this.repository);

  Future<void> postCompany(CompanyEntity companyData) {
    return repository.postCompany(companyData);
  }
}
