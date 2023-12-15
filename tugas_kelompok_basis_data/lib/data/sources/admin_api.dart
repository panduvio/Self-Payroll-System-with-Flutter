// ignore_for_file: unused_local_variable

import 'package:dio/dio.dart';
import 'package:tugas_kelompok_basis_data/data/models/company_model.dart';
import 'package:tugas_kelompok_basis_data/data/models/employee_model.dart';
import 'package:tugas_kelompok_basis_data/data/models/position_model.dart';
import 'package:tugas_kelompok_basis_data/domains/entities/company_entity.dart';
import 'package:tugas_kelompok_basis_data/domains/entities/employee_entity.dart';
import 'package:tugas_kelompok_basis_data/domains/entities/position_entity.dart';

class AdminApi {
  final String baseUrl = 'http://192.168.43.155:8000/api/';
  Dio dio = Dio();

  Future<List<EmployeeEntity>> getAllEmployee() async {
    try {
      final response = await dio.get('${baseUrl}employee/');
      if (response.statusCode == 200) {
        final List<dynamic> employeeList = response.data;
        // print(employeeList);
        final employees = employeeList.map((employeeJson) {
          final employeeModel = EmployeeModel.fromJson(employeeJson);
          return EmployeeEntity(
            id: employeeModel.id,
            employee_id: employeeModel.employee_id,
            position_id: employeeModel.position_id,
            private_pin: employeeModel.private_pin,
            name: employeeModel.name,
            phone: employeeModel.phone,
            email: employeeModel.email,
            address: employeeModel.address,
            is_paid: employeeModel.is_paid,
          );
        }).toList();
        return employees;
      } else {
        throw Exception('Failed to fetch employees');
      }
    } catch (e) {
      throw Exception('Failed to fetch all Employee: $e');
    }
  }

  Future<List<PositionEntity>> getAllPosition() async {
    try {
      final response = await dio.get('${baseUrl}positions/');
      if (response.statusCode == 200) {
        final List<dynamic> positionList = response.data;
        // print(employeeList);
        final positions = positionList.map((positionJson) {
          final positionModel = PositionModel.fromJson(positionJson);
          return PositionEntity(
            id: positionModel.id,
            name_position: positionModel.name_position,
            salary: positionModel.salary,
          );
        }).toList();
        return positions;
      } else {
        throw Exception('Failed to fetch positions');
      }
    } catch (e) {
      throw Exception('Failed to fetch all positions: $e');
    }
  }

  Future<List<CompanyEntity>> getAllCompany() async {
    try {
      final response = await dio.get('${baseUrl}company/');
      if (response.statusCode == 200) {
        final List<dynamic> companyList = response.data;
        // print(employeeList);
        final companies = companyList.map((companyJson) {
          final companyModel = CompanyModel.fromJson(companyJson);
          return CompanyEntity(
            company_id: companyModel.company_id,
            name: companyModel.name,
            balance: companyModel.balance,
          );
        }).toList();
        return companies;
      } else {
        throw Exception('Failed to fetch company');
      }
    } catch (e) {
      throw Exception('Failed to fetch all company: $e');
    }
  }

  Future<EmployeeEntity> getEmployeeById(int id) async {
    try {
      final response = await dio.get('${baseUrl}employee/$id');
      if (response.statusCode == 200) {
        final employee = response.data;
        final EmployeeEntity employeeEntity = EmployeeEntity(
          id: employee['id'],
          employee_id: employee['employee_id'],
          position_id: employee['position_id'],
          private_pin: employee['private_pin'],
          name: employee['name'],
          phone: employee['phone'],
          email: employee['email'],
          address: employee['address'],
          is_paid: employee['is_paid'],
        );
        return employeeEntity;
      } else {
        throw Exception('Failed to fetch employee');
      }
    } catch (e) {
      throw Exception('Failed to get data with id: $id because of : $e');
    }
  }

  void login(String email, String password) async {
    FormData data = FormData.fromMap({
      'email': email,
      'password': password,
    });
    try {
      final response = await dio.post('${baseUrl}admin/login/', data: data);
    } catch (e) {
      throw Exception('Failed to login as admin: $e');
    }
  }

  void addEmployee(EmployeeEntity employeeData) async {
    try {
      final Map<String, dynamic> data = {
        'name': employeeData.name,
        'private_pin': employeeData.private_pin,
        'position_id': employeeData.position_id,
        'email': employeeData.email,
        'address': employeeData.address,
        'phone': employeeData.phone,
      };
      final response = await dio.post('${baseUrl}employee/', data: data);
    } catch (e) {
      throw Exception('Failed to add new employee: $e');
    }
  }

  void addPosition(PositionEntity positionData) async {
    final Map<String, dynamic> data = {
      'name_position': positionData.name_position,
      'salary': positionData.salary,
    };
    try {
      final response = await dio.post('${baseUrl}positions/', data: data);
    } catch (e) {
      throw Exception('Failed to add new position: $e');
    }
  }

  void addCompany(CompanyEntity companyData) async {
    try {
      final Map<String, dynamic> data = {
        'name': companyData.name,
        'balance': companyData.balance,
      };
      final response = await dio.post('${baseUrl}company/', data: data);
    } catch (e) {
      throw Exception('Failed to add new company: $e');
    }
  }

  void updateEmployeeData(EmployeeEntity employeeData) async {
    try {
      final Map<String, dynamic> data = {
        'name': employeeData.name,
        'private_pin': employeeData.private_pin,
        'position_id': employeeData.position_id,
        'email': employeeData.email,
        'address': employeeData.address,
        'phone': employeeData.phone,
      };
      final response =
          await dio.patch('${baseUrl}employee/${employeeData.id}', data: data);
    } catch (e) {
      throw Exception('Failed to update employee data: $e');
    }
  }

  void updatePositionData(PositionEntity positionData) async {
    try {
      final Map<String, dynamic> data = {
        'name_position': positionData.name_position,
        'salary': positionData.salary,
      };
      final response =
          await dio.patch('${baseUrl}positions/${positionData.id}', data: data);
    } catch (e) {
      throw Exception('Failed to update position data: $e');
    }
  }

  void updateCompanyData(CompanyEntity companyData) async {
    try {
      final Map<String, dynamic> data = {
        'name': companyData.name,
        'balance': companyData.balance,
      };
      final response = await dio
          .patch('${baseUrl}company/${companyData.company_id + 1}', data: data);
    } catch (e) {
      throw Exception('Failed to update company data: $e');
    }
  }

  void deleteEmployee(int id) async {
    try {
      final response = await dio.delete(
        '${baseUrl}employee/$id',
      );
    } catch (e) {
      throw Exception('Failed to remove employee: $e');
    }
  }

  void deletePosition(String id) async {
    try {
      final response = await dio.delete(
        '${baseUrl}positions/$id',
      );
    } catch (e) {
      throw Exception('Failed to remove position: $e');
    }
  }

  void deleteCompany(String id) async {
    try {
      final response = await dio.delete(
        '${baseUrl}company/$id',
      );
    } catch (e) {
      throw Exception('Failed to remove company: $e');
    }
  }
}
