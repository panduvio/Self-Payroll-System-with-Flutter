import 'package:tugas_kelompok_basis_data/domains/entities/company_entity.dart';
import 'package:tugas_kelompok_basis_data/domains/entities/employee_entity.dart';
import 'package:tugas_kelompok_basis_data/domains/entities/position_entity.dart';

abstract class AdminRepository {
  Future<List<EmployeeEntity>> getAllEmployee();
  Future<List<PositionEntity>> getAllPosition();
  Future<List<CompanyEntity>> getAllCompany();
  Future<EmployeeEntity> getEmployeeById(int id);
  Future<void> postLogin(String email, String password);
  Future<void> postEmployee(EmployeeEntity employeeData);
  Future<void> postPosition(PositionEntity positionData);
  Future<void> postCompany(CompanyEntity companyData);
  Future<void> updateEmployeeData(EmployeeEntity employeeData);
  Future<void> updatePositionData(PositionEntity positionData);
  Future<void> updateCompanyData(CompanyEntity companyData);
  Future<void> deleteEmployee(int id);
  Future<void> deletePosition(String id);
  Future<void> deleteCompany(String id);
}
