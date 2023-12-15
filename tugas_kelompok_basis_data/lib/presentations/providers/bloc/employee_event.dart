part of 'employee_bloc.dart';

@immutable
abstract class EmployeeEvent {}

class GetSalary extends EmployeeEvent {
  final int id;
  final String pin;

  GetSalary({
    required this.id,
    required this.pin,
  });
}
