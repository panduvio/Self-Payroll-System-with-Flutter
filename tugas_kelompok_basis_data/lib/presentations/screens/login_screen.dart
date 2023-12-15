import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tugas_kelompok_basis_data/constants/app_color.dart';
import 'package:tugas_kelompok_basis_data/presentations/providers/bloc/admin_bloc.dart';
import 'package:tugas_kelompok_basis_data/presentations/screens/admin_home_screen.dart';
import 'package:tugas_kelompok_basis_data/presentations/screens/employee_home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  List<String> loginAs = ['Admin', 'Employee'];
  String selectedValue = 'Employee';
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool emailValid = false;

  void validateEmail() {
    final bool isValid = EmailValidator.validate(emailController.text.trim());
    emailValid = isValid;
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Widget userField() {
    return Column(
      children: [
        Form(
          key: formKey,
          child: TextFormField(
            controller: nameController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Input name',
              label: Text('Name'),
            ),
            validator: (value) {
              if (value!.isEmpty == true) {
                return 'Name cannot be empty';
              } else {
                return null;
              }
            },
          ),
        ),
      ],
    );
  }

  Widget adminField() {
    return Form(
      key: formKey,
      child: Column(
        children: [
          TextFormField(
            controller: emailController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Input admin E-mail',
              label: Text('E-mail'),
            ),
            validator: (value) {
              validateEmail();

              if (value!.isEmpty) {
                return 'E-mail can\'t be empty';
              } else if (emailValid == false) {
                return 'Please input email correctly !';
              } else {
                return null;
              }
            },
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            controller: passwordController,
            obscureText: true,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Input password',
              label: Text('Password'),
            ),
            validator: (value) {
              if (value!.isEmpty == true) {
                return 'Password cannot be empty';
              } else if (value.length < 8) {
                return 'Password should contain at least 8 characters';
              } else if (!RegExp(
                      r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[\W_]).{8,}$')
                  .hasMatch(value)) {
                return 'Password should contain at least a symbol, a number, and an upper case letter';
              } else {
                return null;
              }
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(16),
          height: double.maxFinite,
          width: double.maxFinite,
          color: AppColor().snugCottage,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Login',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 46,
                    fontWeight: FontWeight.w700,
                    color: AppColor().infinity),
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: RadioListTile(
                      title: Text(loginAs[0]),
                      value: loginAs[0],
                      groupValue: selectedValue,
                      onChanged: ((value) {
                        setState(() {
                          selectedValue = value!;
                        });
                      }),
                    ),
                  ),
                  Flexible(
                    child: RadioListTile(
                      title: Text(loginAs[1]),
                      value: loginAs[1],
                      groupValue: selectedValue,
                      onChanged: ((value) {
                        setState(() {
                          selectedValue = value!;
                        });
                      }),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              selectedValue == 'Admin' ? adminField() : userField(),
              const SizedBox(
                height: 20,
              ),
              MaterialButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    if (selectedValue == 'Admin') {
                      context.read<AdminBloc>().add(
                            Login(
                              email: emailController.text,
                              password: passwordController.text,
                            ),
                          );
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AdminHomeScreen(),
                          ));
                    } else {
                      final name = nameController.text;
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EmployeeHomeScreen(
                              userName: name,
                            ),
                          ));
                    }
                  }
                },
                height: 55,
                minWidth: double.maxFinite,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                color: AppColor().evilLyn,
                splashColor: AppColor().infinity.withAlpha(16),
                child: const Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
