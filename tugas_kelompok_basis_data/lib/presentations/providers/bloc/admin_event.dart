part of 'admin_bloc.dart';

@immutable
abstract class AdminEvent {}

class GetAllEmployee extends AdminEvent {}

class GetAllPosition extends AdminEvent {}

class GetAllCompany extends AdminEvent {}

class GetEmployeeById extends AdminEvent {
  final int id;

  GetEmployeeById({required this.id});
}

class Login extends AdminEvent {
  final String email;
  final String password;

  Login({
    required this.email,
    required this.password,
  });
}

class AddEmployee extends AdminEvent {
  final EmployeeEntity employeeData;

  AddEmployee({
    required this.employeeData,
  });
}

class AddPosition extends AdminEvent {
  final PositionEntity positionData;

  AddPosition({
    required this.positionData,
  });
}

class AddCompany extends AdminEvent {
  final CompanyEntity companyData;

  AddCompany({
    required this.companyData,
  });
}

class SetupBalance extends AdminEvent {
  final String compName;
  final int balance;

  SetupBalance({
    required this.compName,
    required this.balance,
  });
}

class TopupBalance extends AdminEvent {
  final String compName;
  final int balance;

  TopupBalance({
    required this.compName,
    required this.balance,
  });
}

class UpdateEmployeeData extends AdminEvent {
  final EmployeeEntity employeeData;

  UpdateEmployeeData({required this.employeeData});
}

class UpdatePositionData extends AdminEvent {
  final PositionEntity positionData;

  UpdatePositionData({required this.positionData});
}

class UpdateCompanyData extends AdminEvent {
  final CompanyEntity companyData;

  UpdateCompanyData({required this.companyData});
}

class RemoveEmployee extends AdminEvent {
  final int id;

  RemoveEmployee({required this.id});
}

class RemovePosition extends AdminEvent {
  final String id;

  RemovePosition({required this.id});
}

class RemoveCompany extends AdminEvent {
  final String id;

  RemoveCompany({required this.id});
}
