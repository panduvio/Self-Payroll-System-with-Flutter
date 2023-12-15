// ignore_for_file: non_constant_identifier_names

class EmployeeEntity {
  final int id;
  final String employee_id;
  final String position_id;
  final String private_pin;
  final String name;
  final String phone;
  final String email;
  final String address;
  final bool is_paid;

  EmployeeEntity({
    required this.id,
    required this.employee_id,
    required this.position_id,
    required this.private_pin,
    required this.name,
    required this.phone,
    required this.email,
    required this.address,
    this.is_paid = false,
  });
}
