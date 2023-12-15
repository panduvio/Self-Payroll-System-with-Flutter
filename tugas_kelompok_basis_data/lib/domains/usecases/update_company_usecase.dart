import 'package:tugas_kelompok_basis_data/domains/entities/company_entity.dart';
import 'package:tugas_kelompok_basis_data/domains/repositories/admin_repository.dart';

class UpdateCompanyUsecase {
  AdminRepository repository;

  UpdateCompanyUsecase(this.repository);

  Future<void> updateCompany(CompanyEntity companyData) {
    return repository.updateCompanyData(companyData);
  }
}
