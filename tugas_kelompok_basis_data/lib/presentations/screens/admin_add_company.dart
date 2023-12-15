// ignore_for_file: no_logic_in_create_state

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heroicons/heroicons.dart';
import 'package:tugas_kelompok_basis_data/constants/app_color.dart';
import 'package:tugas_kelompok_basis_data/domains/entities/company_entity.dart';
import 'package:tugas_kelompok_basis_data/presentations/providers/bloc/admin_bloc.dart';
import 'package:tugas_kelompok_basis_data/presentations/screens/admin_home_screen.dart';

class AdminAddCompanyScreen extends StatefulWidget {
  final bool isUpdate;
  final int companyIndex;
  final String comName;
  final int balance;

  const AdminAddCompanyScreen(
      {super.key,
      required this.isUpdate,
      required this.companyIndex,
      required this.comName,
      required this.balance});

  @override
  State<AdminAddCompanyScreen> createState() => _AdminAddCompanyScreenState(
        isUpdate: isUpdate,
        comName: comName,
        companyIndex: companyIndex,
        balance: balance,
      );
}

class _AdminAddCompanyScreenState extends State<AdminAddCompanyScreen> {
  final bool isUpdate;
  final int companyIndex;
  final String comName;
  final int balance;
  var formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController balanceController = TextEditingController();
  TextEditingController adressController = TextEditingController();

  _AdminAddCompanyScreenState({
    required this.isUpdate,
    required this.companyIndex,
    required this.comName,
    required this.balance,
  });

  @override
  void initState() {
    if (isUpdate == true) {
      nameController.text = comName;
    }
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    balanceController.dispose();
    adressController.dispose();
    super.dispose();
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
        child: Container(
          color: AppColor().snugCottage,
          child: ListView(
            children: [
              Form(
                key: formKey,
                child: Container(
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
                    'Fill Company Data !',
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.w600,
                      color: AppColor().snugCottage,
                    ),
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
                    icon: const HeroIcon(HeroIcons.buildingOffice2),
                    hintText: 'Input company name',
                    labelText: 'Company Name',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                  validator: (value) {
                    if (value!.isEmpty == true) {
                      return 'Company name can\'t be empty';
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
                  controller: balanceController,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  decoration: InputDecoration(
                    icon: const HeroIcon(HeroIcons.banknotes),
                    hintText: 'Input balance',
                    labelText: 'Balance',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                  validator: (value) {
                    if (value!.isEmpty == true) {
                      return 'Balance can\'t be empty';
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
                    final comData = CompanyEntity(
                        company_id: 0,
                        name: nameController.text,
                        balance: balance + int.parse(balanceController.text));
                    if (isUpdate == true) {
                      context
                          .read<AdminBloc>()
                          .add(UpdateCompanyData(companyData: comData));
                      context.read<AdminBloc>().add(GetAllCompany());
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AdminHomeScreen(),
                        ),
                      );
                    } else {
                      context
                          .read<AdminBloc>()
                          .add(AddCompany(companyData: comData));
                      context.read<AdminBloc>().add(GetAllCompany());
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
      ),
    );
  }
}
