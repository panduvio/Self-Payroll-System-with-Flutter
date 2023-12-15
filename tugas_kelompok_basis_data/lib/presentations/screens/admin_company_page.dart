import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heroicons/heroicons.dart';
import 'package:tugas_kelompok_basis_data/constants/app_color.dart';
import 'package:tugas_kelompok_basis_data/presentations/providers/bloc/admin_bloc.dart';
import 'package:tugas_kelompok_basis_data/presentations/screens/admin_add_company.dart';

class AdminCompanyPage extends StatefulWidget {
  const AdminCompanyPage({super.key});

  @override
  State<AdminCompanyPage> createState() => _AdminCompanyPageState();
}

class _AdminCompanyPageState extends State<AdminCompanyPage> {
  bool coba = true;

  @override
  void initState() {
    context.read<AdminBloc>().add(GetAllCompany());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdminBloc, AdminState>(
      builder: (context, state) {
        if (state is SuccessGetAllCompanyState && state.companies.isNotEmpty) {
          final companies = state.companies;
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
                              builder: (context) => const AdminAddCompanyScreen(
                                isUpdate: false,
                                comName: '',
                                companyIndex: 0,
                                balance: 0,
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
                        'Add New Company',
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
                      itemCount: companies.length,
                      itemBuilder: (context, index) {
                        final company = companies[index];
                        return Card(
                          color: AppColor().evilLyn,
                          child: ExpansionTile(
                            title: Text(
                                'No. ${company.company_id} -- ${company.name}'),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                              side: BorderSide.none,
                            ),
                            tilePadding: const EdgeInsets.all(16),
                            childrenPadding: const EdgeInsets.all(16),
                            children: [
                              Text('Balance: Rp. ${company.balance},-'),
                              const SizedBox(
                                height: 16,
                              ),
                              Row(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                AdminAddCompanyScreen(
                                              isUpdate: true,
                                              companyIndex: company.company_id,
                                              comName: company.name,
                                              balance: company.balance,
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
                                ],
                              )
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
                        'Add New Company',
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
                  const Text('There is no any Company registered yet !'),
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
