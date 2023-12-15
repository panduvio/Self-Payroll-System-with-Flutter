// ignore_for_file: no_logic_in_create_state

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heroicons/heroicons.dart';
import 'package:tugas_kelompok_basis_data/constants/app_color.dart';
import 'package:tugas_kelompok_basis_data/presentations/providers/bloc/employee_bloc.dart';
import 'package:tugas_kelompok_basis_data/presentations/screens/login_screen.dart';

class EmployeeHomeScreen extends StatefulWidget {
  final String userName;
  const EmployeeHomeScreen({super.key, required this.userName});

  @override
  State<EmployeeHomeScreen> createState() =>
      _EmployeeHomeScreenState(userName: userName);
}

class _EmployeeHomeScreenState extends State<EmployeeHomeScreen> {
  var formKey = GlobalKey<FormState>();
  final String userName;

  TextEditingController idController = TextEditingController();
  TextEditingController pinController = TextEditingController();

  _EmployeeHomeScreenState({required this.userName});

  @override
  void dispose() {
    idController.dispose();
    pinController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const LoginScreen(),
              ));
        },
        backgroundColor: AppColor().ferry,
        child: HeroIcon(
          HeroIcons.power,
          color: AppColor().evilLyn,
        ),
      ),
      body: Center(
        child: Form(
          key: formKey,
          child: Container(
            height: double.maxFinite,
            width: double.maxFinite,
            color: AppColor().snugCottage,
            child: Column(
              children: [
                Container(
                  alignment: Alignment.bottomLeft,
                  padding: const EdgeInsets.all(16),
                  height: 160,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.vertical(
                        bottom: Radius.circular(18)),
                    color: AppColor().infinity,
                  ),
                  child: Text(
                    'Hello $userName!!!',
                    style: TextStyle(
                        fontSize: 46,
                        fontWeight: FontWeight.w700,
                        color: AppColor().snugCottage),
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: TextFormField(
                    controller: idController,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    decoration: InputDecoration(
                      icon: const HeroIcon(HeroIcons.identification),
                      hintText: 'Input your id',
                      label: const Text('Id'),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16)),
                    ),
                    validator: (value) {
                      if (value!.isEmpty == true) {
                        return 'Id can\'t be empty';
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: TextFormField(
                    controller: pinController,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    obscureText: true,
                    decoration: InputDecoration(
                      icon: const HeroIcon(HeroIcons.key),
                      hintText: 'Input your pin',
                      label: const Text('Private Pin'),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16)),
                    ),
                    validator: (value) {
                      if (value!.isEmpty == true) {
                        return 'Pin can\'t be empty';
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                MaterialButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      final idSalary = idController.text;
                      final pinSalary = pinController.text;

                      context.read<EmployeeBloc>().add(GetSalary(
                            id: int.parse(idSalary),
                            pin: pinSalary,
                          ));
                      idController.clear();
                      pinController.clear();
                    }
                  },
                  height: 60,
                  color: AppColor().evilLyn,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Text(
                    'Get Salary !',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w300),
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
