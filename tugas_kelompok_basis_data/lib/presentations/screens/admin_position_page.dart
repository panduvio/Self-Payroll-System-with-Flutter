import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heroicons/heroicons.dart';
import 'package:tugas_kelompok_basis_data/constants/app_color.dart';
import 'package:tugas_kelompok_basis_data/presentations/providers/bloc/admin_bloc.dart';
import 'package:tugas_kelompok_basis_data/presentations/screens/admin_add_position_screen.dart';

class AdminPositionPage extends StatefulWidget {
  const AdminPositionPage({super.key});

  @override
  State<AdminPositionPage> createState() => _AdminPositionPageState();
}

class _AdminPositionPageState extends State<AdminPositionPage> {
  bool coba = true;

  @override
  void initState() {
    context.read<AdminBloc>().add(GetAllPosition());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdminBloc, AdminState>(
      builder: (context, state) {
        if (state is SuccessGetAllPositionState && state.positions.isNotEmpty) {
          final positions = state.positions;
          return Expanded(
            child: Container(
              height: double.maxFinite,
              alignment: Alignment.center,
              color: AppColor().snugCottage,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: MaterialButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const AdminAddPositionScreen(
                                isUpdate: false,
                                positionIndex: 0,
                                posName: '',
                                salary: 0,
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
                        'Add New Position',
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
                      itemCount: positions.length,
                      itemBuilder: (context, index) {
                        final position = positions[index];
                        return Card(
                          color: AppColor().evilLyn,
                          child: ExpansionTile(
                            title: Text(
                                'No. ${position.id} -- ${position.name_position}'),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                              side: BorderSide.none,
                            ),
                            tilePadding: const EdgeInsets.all(16),
                            childrenPadding: const EdgeInsets.all(16),
                            children: [
                              Text('Salary: Rp. ${position.salary},-'),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                AdminAddPositionScreen(
                                              isUpdate: true,
                                              positionIndex: position.id,
                                              posName: position.name_position,
                                              salary: position.salary,
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
                                        context.read<AdminBloc>().add(
                                            RemovePosition(
                                                id: '${position.id}'));
                                        context
                                            .read<AdminBloc>()
                                            .add(GetAllCompany());
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
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
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
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //       builder: (context) => AdminEmployeeAddScreen(),
                        //     ));
                      },
                      height: 60,
                      minWidth: double.maxFinite,
                      color: AppColor().deepPurple,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        'Add New Position',
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
                  const Text('This Company has no Position yet !'),
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
