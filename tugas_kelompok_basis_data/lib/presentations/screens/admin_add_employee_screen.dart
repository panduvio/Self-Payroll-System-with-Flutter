// ignore_for_file: no_logic_in_create_state

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heroicons/heroicons.dart';
import 'package:tugas_kelompok_basis_data/constants/app_color.dart';
import 'package:tugas_kelompok_basis_data/domains/entities/employee_entity.dart';
import 'package:tugas_kelompok_basis_data/domains/entities/position_entity.dart';
import 'package:tugas_kelompok_basis_data/presentations/providers/bloc/admin_bloc.dart';
import 'package:tugas_kelompok_basis_data/presentations/screens/admin_home_screen.dart';

class AdminEmployeeAddScreen extends StatefulWidget {
  final bool isUpdate;
  final int employeeIndex;
  const AdminEmployeeAddScreen({
    super.key,
    required this.isUpdate,
    required this.employeeIndex,
  });

  @override
  State<AdminEmployeeAddScreen> createState() => _AdminEmployeeAddScreenState(
      isUpdate: isUpdate, employeeIndex: employeeIndex);
}

class _AdminEmployeeAddScreenState extends State<AdminEmployeeAddScreen> {
  late List<PositionEntity> positionList = [];
  late List<String> dropList = [];
  late String selectedPosition = '';

  var formKey = GlobalKey<FormState>();
  bool isGenerated = false;
  final bool isUpdate;
  final int employeeIndex;
  late EmployeeEntity employee;
  bool emailValid = false;
  TextEditingController nameController = TextEditingController();
  TextEditingController pinController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController adressController = TextEditingController();

  _AdminEmployeeAddScreenState({
    required this.isUpdate,
    required this.employeeIndex,
  });

  @override
  void initState() {
    if (isUpdate == true) {
      context.read<AdminBloc>().add(GetEmployeeById(id: employeeIndex));
    }
    super.initState();
  }

  // void getEmployeeById() {
  //   context.read<AdminBloc>().add(GetAllPosition());
  // }

  void getPosition() {
    context.read<AdminBloc>().add(GetAllPosition());
  }

  @override
  void dispose() {
    nameController.dispose();
    pinController.dispose();
    emailController.dispose();
    phoneController.dispose();
    adressController.dispose();
    super.dispose();
  }

  void validateEmail() {
    final bool isValid = EmailValidator.validate(emailController.text.trim());
    emailValid = isValid;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor().infinity,
        leading: InkWell(
          onTap: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const AdminHomeScreen(),
                ));
          },
          child: HeroIcon(
            HeroIcons.chevronLeft,
            color: AppColor().snugCottage,
          ),
        ),
      ),
      body: Center(
        child: BlocBuilder<AdminBloc, AdminState>(builder: (context, state) {
          if (state is SuccessGetEmployeeState && isUpdate == true) {
            employee = state.employee;

            nameController.text = employee.name;
            pinController.text = employee.private_pin;
            emailController.text = employee.email;
            phoneController.text = employee.phone;
            adressController.text = employee.address;
          }
          if (isGenerated == false) {
            getPosition();
          }
          if (state is SuccessGetAllPositionState && isGenerated == false) {
            positionList = state.positions;
            for (int i = 0; i < positionList.length; i++) {
              dropList.add(positionList[i].name_position);
            }
            selectedPosition = dropList[employeeIndex];
            isGenerated = true;
          }
          return Form(
            key: formKey,
            child: Container(
              color: AppColor().snugCottage,
              child: ListView(
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    alignment: Alignment.bottomLeft,
                    height: 80,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.vertical(
                        bottom: Radius.circular(10),
                      ),
                      color: AppColor().infinity,
                    ),
                    child: Text(
                      'Fill Employee Data !',
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.w600,
                        color: AppColor().snugCottage,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: TextFormField(
                      controller: nameController,
                      decoration: InputDecoration(
                        icon: const HeroIcon(HeroIcons.user),
                        hintText: 'Input name',
                        labelText: 'Name',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12)),
                      ),
                      validator: (value) {
                        if (value!.isEmpty == true) {
                          return 'Name can\'t be empty';
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
                      decoration: InputDecoration(
                        icon: const HeroIcon(HeroIcons.key),
                        hintText: 'Input pin',
                        labelText: 'Pin',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12)),
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
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Row(
                      children: [
                        const HeroIcon(HeroIcons.mapPin),
                        const SizedBox(
                          width: 20,
                        ),
                        Text(
                          'Position : ',
                          style: TextStyle(
                            fontSize: 16,
                            color: AppColor().ferry,
                          ),
                        ),
                        const Spacer(),
                        Container(
                          padding: const EdgeInsets.all(7),
                          alignment: Alignment.centerLeft,
                          // width: 336,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              width: 1,
                              color: Colors.grey,
                            ),
                          ),
                          child: DropdownButton(
                            hint: Text(
                              selectedPosition,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            items: dropList.map((String items) {
                              return DropdownMenuItem(
                                value: items,
                                child: Text(items),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                selectedPosition = value!;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                        icon: const HeroIcon(HeroIcons.envelope),
                        hintText: 'Input email',
                        labelText: 'Email',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12)),
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
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: TextFormField(
                      controller: phoneController,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      decoration: InputDecoration(
                        icon: const HeroIcon(HeroIcons.phone),
                        hintText: 'Input phone number',
                        labelText: 'Phone Number',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12)),
                      ),
                      validator: (value) {
                        if (value!.isEmpty == true) {
                          return 'Phone number can\'t be empty';
                        } else if (value.length < 10) {
                          return 'Phone number should contain at least 10 characters';
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
                      controller: adressController,
                      decoration: InputDecoration(
                        icon: const HeroIcon(HeroIcons.homeModern),
                        hintText: 'Input adress',
                        labelText: 'Adress',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12)),
                      ),
                      validator: (value) {
                        validateEmail();

                        if (value!.isEmpty) {
                          return 'Adress can\'t be empty';
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: MaterialButton(
                      onPressed: () {
                        final empData = EmployeeEntity(
                          id: employeeIndex,
                          employee_id: '',
                          position_id:
                              dropList.indexOf(selectedPosition).toString(),
                          private_pin: pinController.text,
                          name: nameController.text,
                          phone: phoneController.text,
                          email: emailController.text,
                          address: adressController.text,
                        );
                        if (isUpdate == true) {
                          context
                              .read<AdminBloc>()
                              .add(UpdateEmployeeData(employeeData: empData));
                          context.read<AdminBloc>().add(GetAllEmployee());
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const AdminHomeScreen(),
                            ),
                          );
                        } else {
                          context
                              .read<AdminBloc>()
                              .add(AddEmployee(employeeData: empData));
                          context.read<AdminBloc>().add(GetAllEmployee());
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const AdminHomeScreen(),
                            ),
                          );
                        }
                      },
                      color: AppColor().evilLyn,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      child: Text(
                        isUpdate == true ? 'Save' : 'Add',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
