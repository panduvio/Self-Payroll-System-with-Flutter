import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tugas_kelompok_basis_data/dependency_injector.dart';
import 'package:tugas_kelompok_basis_data/domains/usecases/get_salary_usecase.dart';

part 'employee_event.dart';
part 'employee_state.dart';

class EmployeeBloc extends Bloc<EmployeeEvent, EmployeeState>
    with ChangeNotifier {
  EmployeeBloc() : super(TryToGetState()) {
    on<GetSalary>(_getSalary);
  }

  void _getSalary(GetSalary event, Emitter<EmployeeState> emit) async {
    emit(TryToGetState());
    try {
      await sl<GetSalaryUsecase>().getSalary(id: event.id, pin: event.pin);
      emit(SuccessGetState());
    } catch (e) {
      throw Exception('Failed to get Salary: $e');
    }
  }
}
