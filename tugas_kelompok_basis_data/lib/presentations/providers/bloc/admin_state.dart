part of 'admin_bloc.dart';

abstract class AdminState {}

class TryToProcessState extends AdminState {}

class SuccessGetAllEmployeeState extends AdminState {
  final List<EmployeeEntity> employees;

  SuccessGetAllEmployeeState(this.employees);
}

class SuccessGetEmployeeState extends AdminState {
  final EmployeeEntity employee;

  SuccessGetEmployeeState(this.employee);
}

class SuccessGetAllPositionState extends AdminState {
  final List<PositionEntity> positions;

  SuccessGetAllPositionState(this.positions);
}

class SuccessGetAllCompanyState extends AdminState {
  final List<CompanyEntity> companies;

  SuccessGetAllCompanyState(this.companies);
}

class SuccessLoginState extends AdminState {}

class SuccessTopupState extends AdminState {}

class SuccessSetupState extends AdminState {}

class SuccessUpdateState extends AdminState {}

class FailedGetDataState extends AdminState {}

class FailedProcessState extends AdminState {}
