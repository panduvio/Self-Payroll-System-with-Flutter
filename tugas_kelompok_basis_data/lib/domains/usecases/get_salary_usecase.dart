import 'package:tugas_kelompok_basis_data/domains/repositories/employee_repository.dart';

class GetSalaryUsecase {
  EmployeeRepository repository;

  GetSalaryUsecase(this.repository);

  Future<void> getSalary({required int id, required String pin}) {
    return repository.getSalary(id, pin);
  }
}
