// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'employee_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

EmployeeModel _$EmployeeModelFromJson(Map<String, dynamic> json) {
  return _EmployeeModel.fromJson(json);
}

/// @nodoc
mixin _$EmployeeModel {
  int get id => throw _privateConstructorUsedError;
  String get position_id => throw _privateConstructorUsedError;
  String get employee_id => throw _privateConstructorUsedError;
  String get private_pin => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  bool get is_paid => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EmployeeModelCopyWith<EmployeeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmployeeModelCopyWith<$Res> {
  factory $EmployeeModelCopyWith(
          EmployeeModel value, $Res Function(EmployeeModel) then) =
      _$EmployeeModelCopyWithImpl<$Res, EmployeeModel>;
  @useResult
  $Res call(
      {int id,
      String position_id,
      String employee_id,
      String private_pin,
      String name,
      String phone,
      String email,
      String address,
      bool is_paid});
}

/// @nodoc
class _$EmployeeModelCopyWithImpl<$Res, $Val extends EmployeeModel>
    implements $EmployeeModelCopyWith<$Res> {
  _$EmployeeModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? position_id = null,
    Object? employee_id = null,
    Object? private_pin = null,
    Object? name = null,
    Object? phone = null,
    Object? email = null,
    Object? address = null,
    Object? is_paid = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      position_id: null == position_id
          ? _value.position_id
          : position_id // ignore: cast_nullable_to_non_nullable
              as String,
      employee_id: null == employee_id
          ? _value.employee_id
          : employee_id // ignore: cast_nullable_to_non_nullable
              as String,
      private_pin: null == private_pin
          ? _value.private_pin
          : private_pin // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      is_paid: null == is_paid
          ? _value.is_paid
          : is_paid // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EmployeeModelImplCopyWith<$Res>
    implements $EmployeeModelCopyWith<$Res> {
  factory _$$EmployeeModelImplCopyWith(
          _$EmployeeModelImpl value, $Res Function(_$EmployeeModelImpl) then) =
      __$$EmployeeModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String position_id,
      String employee_id,
      String private_pin,
      String name,
      String phone,
      String email,
      String address,
      bool is_paid});
}

/// @nodoc
class __$$EmployeeModelImplCopyWithImpl<$Res>
    extends _$EmployeeModelCopyWithImpl<$Res, _$EmployeeModelImpl>
    implements _$$EmployeeModelImplCopyWith<$Res> {
  __$$EmployeeModelImplCopyWithImpl(
      _$EmployeeModelImpl _value, $Res Function(_$EmployeeModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? position_id = null,
    Object? employee_id = null,
    Object? private_pin = null,
    Object? name = null,
    Object? phone = null,
    Object? email = null,
    Object? address = null,
    Object? is_paid = null,
  }) {
    return _then(_$EmployeeModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      position_id: null == position_id
          ? _value.position_id
          : position_id // ignore: cast_nullable_to_non_nullable
              as String,
      employee_id: null == employee_id
          ? _value.employee_id
          : employee_id // ignore: cast_nullable_to_non_nullable
              as String,
      private_pin: null == private_pin
          ? _value.private_pin
          : private_pin // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      is_paid: null == is_paid
          ? _value.is_paid
          : is_paid // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EmployeeModelImpl implements _EmployeeModel {
  _$EmployeeModelImpl(
      {required this.id,
      required this.position_id,
      required this.employee_id,
      required this.private_pin,
      required this.name,
      required this.phone,
      required this.email,
      required this.address,
      this.is_paid = false});

  factory _$EmployeeModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$EmployeeModelImplFromJson(json);

  @override
  final int id;
  @override
  final String position_id;
  @override
  final String employee_id;
  @override
  final String private_pin;
  @override
  final String name;
  @override
  final String phone;
  @override
  final String email;
  @override
  final String address;
  @override
  @JsonKey()
  final bool is_paid;

  @override
  String toString() {
    return 'EmployeeModel(id: $id, position_id: $position_id, employee_id: $employee_id, private_pin: $private_pin, name: $name, phone: $phone, email: $email, address: $address, is_paid: $is_paid)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EmployeeModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.position_id, position_id) ||
                other.position_id == position_id) &&
            (identical(other.employee_id, employee_id) ||
                other.employee_id == employee_id) &&
            (identical(other.private_pin, private_pin) ||
                other.private_pin == private_pin) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.is_paid, is_paid) || other.is_paid == is_paid));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, position_id, employee_id,
      private_pin, name, phone, email, address, is_paid);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EmployeeModelImplCopyWith<_$EmployeeModelImpl> get copyWith =>
      __$$EmployeeModelImplCopyWithImpl<_$EmployeeModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EmployeeModelImplToJson(
      this,
    );
  }
}

abstract class _EmployeeModel implements EmployeeModel {
  factory _EmployeeModel(
      {required final int id,
      required final String position_id,
      required final String employee_id,
      required final String private_pin,
      required final String name,
      required final String phone,
      required final String email,
      required final String address,
      final bool is_paid}) = _$EmployeeModelImpl;

  factory _EmployeeModel.fromJson(Map<String, dynamic> json) =
      _$EmployeeModelImpl.fromJson;

  @override
  int get id;
  @override
  String get position_id;
  @override
  String get employee_id;
  @override
  String get private_pin;
  @override
  String get name;
  @override
  String get phone;
  @override
  String get email;
  @override
  String get address;
  @override
  bool get is_paid;
  @override
  @JsonKey(ignore: true)
  _$$EmployeeModelImplCopyWith<_$EmployeeModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
