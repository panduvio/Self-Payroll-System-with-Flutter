import 'package:get_it/get_it.dart';
import 'package:tugas_kelompok_basis_data/data/repositories/admin_repository_impl.dart';
import 'package:tugas_kelompok_basis_data/data/repositories/employee_repository_impl.dart';
import 'package:tugas_kelompok_basis_data/domains/repositories/admin_repository.dart';
import 'package:tugas_kelompok_basis_data/domains/repositories/employee_repository.dart';
import 'package:tugas_kelompok_basis_data/domains/usecases/delete_company_usecase.dart';
import 'package:tugas_kelompok_basis_data/domains/usecases/delete_employee_usecase.dart';
import 'package:tugas_kelompok_basis_data/domains/usecases/delete_position_usecase.dart';
import 'package:tugas_kelompok_basis_data/domains/usecases/get_all_company_usecase.dart';
import 'package:tugas_kelompok_basis_data/domains/usecases/get_all_employee_usecase.dart';
import 'package:tugas_kelompok_basis_data/domains/usecases/get_all_position_usecase.dart';
import 'package:tugas_kelompok_basis_data/domains/usecases/get_employee_by_id_usecase.dart';
import 'package:tugas_kelompok_basis_data/domains/usecases/get_salary_usecase.dart';
import 'package:tugas_kelompok_basis_data/domains/usecases/post_company_usecase.dart';
import 'package:tugas_kelompok_basis_data/domains/usecases/post_employee_usecase.dart';
import 'package:tugas_kelompok_basis_data/domains/usecases/post_login_usecase.dart';
import 'package:tugas_kelompok_basis_data/domains/usecases/post_position_usecase.dart';
import 'package:tugas_kelompok_basis_data/domains/usecases/update_company_usecase.dart';
import 'package:tugas_kelompok_basis_data/domains/usecases/update_employee_data_usecase.dart';
import 'package:tugas_kelompok_basis_data/domains/usecases/update_position_data_usecase.dart';

final sl = GetIt.instance;

void setUp() {
  sl.registerLazySingleton<EmployeeRepository>(() => EmployeeRepositoryImpl());
  sl.registerLazySingleton<AdminRepository>(() => AdminRepositoryImpl());

  sl.registerLazySingleton<GetSalaryUsecase>(() => GetSalaryUsecase(sl()));

  sl.registerLazySingleton<GetAllEmployeeUsecase>(
      () => GetAllEmployeeUsecase(sl()));
  sl.registerLazySingleton<GetEmployeeByIdUsecase>(
      () => GetEmployeeByIdUsecase(sl()));
  sl.registerLazySingleton<PostLoginUsecase>(() => PostLoginUsecase(sl()));
  sl.registerLazySingleton<PostEmployeeUsecase>(
      () => PostEmployeeUsecase(sl()));
  sl.registerLazySingleton<UpdateEmployeeUsecase>(
      () => UpdateEmployeeUsecase(sl()));
  sl.registerLazySingleton<DeleteEmployeeUsecase>(
      () => DeleteEmployeeUsecase(sl()));

  sl.registerLazySingleton<GetAllPositionUsecase>(
      () => GetAllPositionUsecase(sl()));
  sl.registerLazySingleton<PostPositionUsecase>(
      () => PostPositionUsecase(sl()));
  sl.registerLazySingleton<UpdatePositionUsecase>(
      () => UpdatePositionUsecase(sl()));
  sl.registerLazySingleton<DeletePositionUsecase>(
      () => DeletePositionUsecase(sl()));

  sl.registerLazySingleton<GetAllCompanyUsecase>(
      () => GetAllCompanyUsecase(sl()));
  sl.registerLazySingleton<PostCompanyUsecase>(() => PostCompanyUsecase(sl()));
  sl.registerLazySingleton<UpdateCompanyUsecase>(
      () => UpdateCompanyUsecase(sl()));
  sl.registerLazySingleton<DeleteCompanyUsecase>(
      () => DeleteCompanyUsecase(sl()));
}
