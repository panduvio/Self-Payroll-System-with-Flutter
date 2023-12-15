part of 'employee_bloc.dart';

abstract class EmployeeState {}

class TryToGetState extends EmployeeState {}

class SuccessGetState extends EmployeeState {
  final bool result;

  SuccessGetState(this.result);
}

class FailedGetState extends EmployeeState {}
