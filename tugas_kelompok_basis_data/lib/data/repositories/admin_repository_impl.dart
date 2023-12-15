import 'package:tugas_kelompok_basis_data/data/sources/admin_api.dart';
import 'package:tugas_kelompok_basis_data/domains/entities/company_entity.dart';
import 'package:tugas_kelompok_basis_data/domains/entities/employee_entity.dart';
import 'package:tugas_kelompok_basis_data/domains/entities/position_entity.dart';
import 'package:tugas_kelompok_basis_data/domains/repositories/admin_repository.dart';

class AdminRepositoryImpl implements AdminRepository {
  AdminApi api = AdminApi();

  @override
  Future<void> deleteEmployee(int id) async {
    api.deleteEmployee(id);
  }

  @override
  Future<List<EmployeeEntity>> getAllEmployee() async {
    final employees = await api.getAllEmployee();
    return employees;
  }

  @override
  Future<EmployeeEntity> getEmployeeById(int id) async {
    final employee = await api.getEmployeeById(id);
    return employee;
  }

  @override
  Future<void> postEmployee(EmployeeEntity employeeData) async {
    api.addEmployee(employeeData);
  }

  @override
  Future<void> postLogin(String email, String password) async {
    api.login(email, password);
  }

  @override
  Future<void> updateEmployeeData(EmployeeEntity employeeData) async {
    api.updateEmployeeData(employeeData);
  }

  @override
  Future<void> deletePosition(String id) async {
    api.deletePosition(id);
  }

  @override
  Future<List<PositionEntity>> getAllPosition() async {
    final positions = await api.getAllPosition();
    return positions;
  }

  @override
  Future<void> postPosition(PositionEntity positionData) async {
    api.addPosition(positionData);
  }

  @override
  Future<void> updatePositionData(PositionEntity positionData) async {
    api.updatePositionData(positionData);
  }

  @override
  Future<void> deleteCompany(String id) async {
    api.deleteCompany(id);
  }

  @override
  Future<List<CompanyEntity>> getAllCompany() async {
    final companies = await api.getAllCompany();
    return companies;
  }

  @override
  Future<void> postCompany(CompanyEntity companyData) async {
    api.addCompany(companyData);
  }

  @override
  Future<void> updateCompanyData(CompanyEntity companyData) async {
    api.updateCompanyData(companyData);
  }
}
