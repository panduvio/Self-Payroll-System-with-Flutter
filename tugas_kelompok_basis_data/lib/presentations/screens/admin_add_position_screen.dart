// ignore_for_file: no_logic_in_create_state

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heroicons/heroicons.dart';
import 'package:tugas_kelompok_basis_data/constants/app_color.dart';
import 'package:tugas_kelompok_basis_data/domains/entities/position_entity.dart';
import 'package:tugas_kelompok_basis_data/presentations/providers/bloc/admin_bloc.dart';
import 'package:tugas_kelompok_basis_data/presentations/screens/admin_home_screen.dart';

class AdminAddPositionScreen extends StatefulWidget {
  final bool isUpdate;
  final int positionIndex;
  final String posName;
  final int salary;

  const AdminAddPositionScreen({
    super.key,
    required this.isUpdate,
    required this.positionIndex,
    required this.posName,
    required this.salary,
  });

  @override
  State<AdminAddPositionScreen> createState() => _AdminAddPositionScreenState(
        isUpdate: isUpdate,
        positionIndex: positionIndex,
        posName: posName,
        salary: salary,
      );
}

class _AdminAddPositionScreenState extends State<AdminAddPositionScreen> {
  final bool isUpdate;
  final int positionIndex;
  final String posName;
  final int salary;
  TextEditingController positionController = TextEditingController();
  TextEditingController salaryController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  _AdminAddPositionScreenState(
      {required this.isUpdate,
      required this.positionIndex,
      required this.posName,
      required this.salary});

  @override
  void dispose() {
    positionController.dispose();
    salaryController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    if (isUpdate == true) {
      positionController.text = posName;
      salaryController.text = salary.toString();
    }
    super.initState();
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
                      'Fill Position Data !',
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
                      controller: positionController,
                      decoration: InputDecoration(
                        icon: const HeroIcon(HeroIcons.mapPin),
                        hintText: 'Input position name',
                        labelText: 'Position Name',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12)),
                      ),
                      validator: (value) {
                        if (value!.isEmpty == true) {
                          return 'Position name can\'t be empty';
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
                      controller: salaryController,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      decoration: InputDecoration(
                        icon: const HeroIcon(HeroIcons.banknotes),
                        hintText: 'Input Salary',
                        labelText: 'Salary',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12)),
                      ),
                      validator: (value) {
                        if (value!.isEmpty == true) {
                          return 'Salary can\'t be empty';
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
                    child: MaterialButton(
                      onPressed: () {
                        final posData = PositionEntity(
                            id: 0,
                            name_position: positionController.text,
                            salary: int.parse(salaryController.text));
                        if (isUpdate == true) {
                          context
                              .read<AdminBloc>()
                              .add(UpdatePositionData(positionData: posData));
                          context.read<AdminBloc>().add(GetAllPosition());
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const AdminHomeScreen(),
                            ),
                          );
                        } else {
                          context
                              .read<AdminBloc>()
                              .add(AddPosition(positionData: posData));
                          context.read<AdminBloc>().add(GetAllPosition());
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
                      child: Text(isUpdate == true ? 'Save' : 'Add'),
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
