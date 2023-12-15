import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heroicons/heroicons.dart';
import 'package:tugas_kelompok_basis_data/constants/app_color.dart';
import 'package:tugas_kelompok_basis_data/presentations/providers/bloc/admin_bloc.dart';
import 'package:tugas_kelompok_basis_data/presentations/screens/admin_add_employee_screen.dart';

class AdminEmployeePage extends StatefulWidget {
  const AdminEmployeePage({super.key});

  @override
  State<AdminEmployeePage> createState() => _AdminEmployeePageState();
}

class _AdminEmployeePageState extends State<AdminEmployeePage> {
  bool coba = true;

  @override
  void initState() {
    // TODO: implement initState
    context.read<AdminBloc>().add(GetAllEmployee());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdminBloc, AdminState>(
      builder: (context, state) {
        if (state is SuccessGetAllEmployeeState && state.employees.isNotEmpty) {
          final employees = state.employees;
          return Expanded(
            child: Container(
              height: double.maxFinite,
              alignment: Alignment.center,
              color: AppColor().snugCottage,
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AdminEmployeeAddScreen(
                              isUpdate: false,
                              employeeIndex: 0,
                            ),
                          ));
                    },
                    height: 60,
                    minWidth: double.maxFinite,
                    color: AppColor().deepPurple,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      'Add New Employee',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                        color: AppColor().sugarpills,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: employees.length,
                    itemBuilder: (context, index) {
                      final employee = employees[index];
                      return Card(
                        color: AppColor().evilLyn,
                        child: ExpansionTile(
                          title: Text(employee.name),
                          tilePadding: const EdgeInsets.all(8),
                          childrenPadding: const EdgeInsets.all(16),
                          shape: const RoundedRectangleBorder(
                              side: BorderSide.none),
                          children: [
                            Table(
                              children: [
                                TableRow(children: [
                                  const Text('Id'),
                                  Text(': ${employee.id}'),
                                ]),
                                TableRow(children: [
                                  const Text('Position Id'),
                                  Text(': ${employee.position_id}'),
                                ]),
                                TableRow(children: [
                                  const Text('E-mail'),
                                  Text(': ${employee.email}'),
                                ]),
                                TableRow(children: [
                                  const Text('Phone Number'),
                                  Text(': ${employee.phone}'),
                                ]),
                                TableRow(children: [
                                  const Text('Adress'),
                                  Text(': ${employee.address}'),
                                ]),
                              ],
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              AdminEmployeeAddScreen(
                                            isUpdate: true,
                                            employeeIndex: employee.id,
                                          ),
                                        ));
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(6),
                                    height: 50,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      gradient: LinearGradient(
                                        colors: [
                                          AppColor().alienParasyte,
                                          AppColor().lushGreenery,
                                          // AppColor().blueHeathButterfly,
                                        ],
                                      ),
                                    ),
                                    child: const Row(
                                      children: [
                                        Text('Update Data'),
                                        SizedBox(
                                          width: 8,
                                        ),
                                        HeroIcon(HeroIcons.pencilSquare),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 12,
                                ),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      context
                                          .read<AdminBloc>()
                                          .add(RemoveEmployee(id: employee.id));
                                      context
                                          .read<AdminBloc>()
                                          .add(GetAllEmployee());
                                    });
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(6),
                                    height: 50,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      gradient: LinearGradient(
                                        colors: [
                                          AppColor().grapefruit,
                                          AppColor().pelati,
                                        ],
                                      ),
                                    ),
                                    child: const Row(
                                      children: [
                                        Text('Remove Data'),
                                        SizedBox(
                                          width: 8,
                                        ),
                                        HeroIcon(HeroIcons.trash),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      );
                    },
                  ),
                )
              ]),
            ),
          );
        } else {
          return Expanded(
            child: SizedBox(
              height: double.maxFinite,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: MaterialButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const AdminEmployeeAddScreen(
                                isUpdate: false,
                                employeeIndex: 0,
                              ),
                            ));
                      },
                      height: 60,
                      minWidth: double.maxFinite,
                      color: AppColor().deepPurple,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        'Add New Employee',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                          color: AppColor().sugarpills,
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  const HeroIcon(HeroIcons.exclamationTriangle),
                  const SizedBox(
                    height: 6,
                  ),
                  const Text('This Company has no Employee yet !'),
                  const Spacer(),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
