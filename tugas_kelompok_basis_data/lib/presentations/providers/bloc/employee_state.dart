part of 'employee_bloc.dart';

abstract class EmployeeState {}

class TryToGetState extends EmployeeState {}

class SuccessGetState extends EmployeeState {}

class FailedGetState extends EmployeeState {}
