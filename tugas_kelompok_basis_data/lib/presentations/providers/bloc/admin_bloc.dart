import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tugas_kelompok_basis_data/dependency_injector.dart';
import 'package:tugas_kelompok_basis_data/domains/entities/company_entity.dart';
import 'package:tugas_kelompok_basis_data/domains/entities/employee_entity.dart';
import 'package:tugas_kelompok_basis_data/domains/entities/position_entity.dart';
import 'package:tugas_kelompok_basis_data/domains/usecases/delete_company_usecase.dart';
import 'package:tugas_kelompok_basis_data/domains/usecases/delete_employee_usecase.dart';
import 'package:tugas_kelompok_basis_data/domains/usecases/delete_position_usecase.dart';
import 'package:tugas_kelompok_basis_data/domains/usecases/get_all_company_usecase.dart';
import 'package:tugas_kelompok_basis_data/domains/usecases/get_all_employee_usecase.dart';
import 'package:tugas_kelompok_basis_data/domains/usecases/get_all_position_usecase.dart';
import 'package:tugas_kelompok_basis_data/domains/usecases/get_employee_by_id_usecase.dart';
import 'package:tugas_kelompok_basis_data/domains/usecases/post_company_usecase.dart';
import 'package:tugas_kelompok_basis_data/domains/usecases/post_employee_usecase.dart';
import 'package:tugas_kelompok_basis_data/domains/usecases/post_login_usecase.dart';
import 'package:tugas_kelompok_basis_data/domains/usecases/post_position_usecase.dart';
import 'package:tugas_kelompok_basis_data/domains/usecases/update_company_usecase.dart';
import 'package:tugas_kelompok_basis_data/domains/usecases/update_employee_data_usecase.dart';
import 'package:tugas_kelompok_basis_data/domains/usecases/update_position_data_usecase.dart';

part 'admin_event.dart';
part 'admin_state.dart';

class AdminBloc extends Bloc<AdminEvent, AdminState> {
  AdminBloc() : super(TryToProcessState()) {
    on<GetAllEmployee>(_getAllEmployee);
    on<GetAllPosition>(_getAllPosition);
    on<GetAllCompany>(_getAllCompany);
    on<GetEmployeeById>(_getEmployeeById);
    on<AddEmployee>(_addEmployee);
    on<AddPosition>(_addPosition);
    on<AddCompany>(_addCompany);
    on<Login>(_login);
    on<UpdateEmployeeData>(_updateEmployeeData);
    on<UpdatePositionData>(_updatePositionData);
    on<UpdateCompanyData>(_updateCompanyData);
    on<RemoveEmployee>(_removeEmployee);
    on<RemovePosition>(_removePosition);
    on<RemoveCompany>(_removeCompany);
  }

  void _getAllEmployee(GetAllEmployee event, Emitter<AdminState> emit) async {
    emit(TryToProcessState());
    try {
      final employees = await sl<GetAllEmployeeUsecase>().getAllEmployee();
      emit(SuccessGetAllEmployeeState(employees));
    } catch (e) {
      throw Exception('Failed to get all employee from bloc: $e');
    }
  }

  void _getAllPosition(GetAllPosition event, Emitter<AdminState> emit) async {
    emit(TryToProcessState());
    try {
      final positions = await sl<GetAllPositionUsecase>().getAllPosition();
      emit(SuccessGetAllPositionState(positions));
    } catch (e) {
      throw Exception('Failed to get all positions from bloc: $e');
    }
  }

  void _getAllCompany(GetAllCompany event, Emitter<AdminState> emit) async {
    emit(TryToProcessState());
    try {
      final companies = await sl<GetAllCompanyUsecase>().getAllCompany();
      emit(SuccessGetAllCompanyState(companies));
    } catch (e) {
      throw Exception('Failed to get all companies from bloc: $e');
    }
  }

  void _getEmployeeById(GetEmployeeById event, Emitter<AdminState> emit) async {
    emit(TryToProcessState());
    try {
      final employee =
          await sl<GetEmployeeByIdUsecase>().getEmployeeById(event.id);
      emit(SuccessGetEmployeeState(employee));
    } catch (e) {
      throw Exception('Failed to get employee from bloc: $e');
    }
  }

  void _addEmployee(AddEmployee event, Emitter<AdminState> emit) async {
    emit(TryToProcessState());
    try {
      await sl<PostEmployeeUsecase>().postEmployee(event.employeeData);
      add(GetAllEmployee());
    } catch (e) {
      throw Exception('Failed to add employee data');
    }
  }

  void _addPosition(AddPosition event, Emitter<AdminState> emit) async {
    emit(TryToProcessState());
    try {
      await sl<PostPositionUsecase>().postPosition(event.positionData);
      add(GetAllPosition());
    } catch (e) {
      throw Exception('Failed to add position data');
    }
  }

  void _addCompany(AddCompany event, Emitter<AdminState> emit) async {
    emit(TryToProcessState());
    try {
      await sl<PostCompanyUsecase>().postCompany(event.companyData);
      add(GetAllCompany());
    } catch (e) {
      throw Exception('Failed to add company data');
    }
  }

  void _login(Login event, Emitter<AdminState> emit) async {
    emit(TryToProcessState());
    try {
      await sl<PostLoginUsecase>()
          .postLogin(email: event.email, password: event.password);
      emit(SuccessLoginState());
    } catch (e) {
      throw Exception('Failed to login from bloc: $e');
    }
  }

  void _updateEmployeeData(
      UpdateEmployeeData event, Emitter<AdminState> emit) async {
    emit(TryToProcessState());
    try {
      await sl<UpdateEmployeeUsecase>().updateEmployee(event.employeeData);
      add(GetAllEmployee());
    } catch (e) {
      throw Exception('Failed to update employee data from bloc: $e');
    }
  }

  void _updatePositionData(
      UpdatePositionData event, Emitter<AdminState> emit) async {
    emit(TryToProcessState());
    try {
      await sl<UpdatePositionUsecase>().updatePosition(event.positionData);
      add(GetAllPosition());
    } catch (e) {
      throw Exception('Failed to update position data from bloc: $e');
    }
  }

  void _updateCompanyData(
      UpdateCompanyData event, Emitter<AdminState> emit) async {
    emit(TryToProcessState());
    try {
      await sl<UpdateCompanyUsecase>().updateCompany(event.companyData);
      add(GetAllCompany());
    } catch (e) {
      throw Exception('Failed to update company data from bloc: $e');
    }
  }

  void _removeEmployee(RemoveEmployee event, Emitter<AdminState> emit) async {
    emit(TryToProcessState());
    try {
      await sl<DeleteEmployeeUsecase>().removeEmployee(event.id);
      add(GetAllEmployee());
    } catch (e) {
      throw Exception('Failed to remove employee from bloc: $e');
    }
  }

  void _removePosition(RemovePosition event, Emitter<AdminState> emit) async {
    emit(TryToProcessState());
    try {
      await sl<DeletePositionUsecase>().removePosition(event.id);
      add(GetAllPosition());
    } catch (e) {
      throw Exception('Failed to remove position from bloc: $e');
    }
  }

  void _removeCompany(RemoveCompany event, Emitter<AdminState> emit) async {
    emit(TryToProcessState());
    try {
      await sl<DeleteCompanyUsecase>().removeCompany(event.id);
      add(GetAllCompany());
    } catch (e) {
      throw Exception('Failed to remove company from bloc: $e');
    }
  }
}
