// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';

part 'employee_model.freezed.dart';
part 'employee_model.g.dart';

@Freezed()
class EmployeeModel with _$EmployeeModel {
  factory EmployeeModel({
    required int id,
    required String position_id,
    required String employee_id,
    required String private_pin,
    required String name,
    required String phone,
    required String email,
    required String address,
    @Default(false) bool is_paid,
  }) = _EmployeeModel;

  factory EmployeeModel.fromJson(Map<String, dynamic> json) =>
      _$EmployeeModelFromJson(json);
}
