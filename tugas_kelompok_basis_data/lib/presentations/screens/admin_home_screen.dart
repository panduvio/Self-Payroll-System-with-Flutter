import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:tugas_kelompok_basis_data/constants/app_color.dart';
import 'package:tugas_kelompok_basis_data/presentations/screens/admin_company_page.dart';
import 'package:tugas_kelompok_basis_data/presentations/screens/admin_employee_page.dart';
import 'package:tugas_kelompok_basis_data/presentations/screens/admin_position_page.dart';
import 'package:tugas_kelompok_basis_data/presentations/screens/login_screen.dart';

class AdminHomeScreen extends StatefulWidget {
  const AdminHomeScreen({super.key});

  @override
  State<AdminHomeScreen> createState() => _AdminHomeScreenState();
}

class _AdminHomeScreenState extends State<AdminHomeScreen> {
  int bottomNavIndex = 0;
  TextEditingController nameController = TextEditingController();

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
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColor().infinity,
        selectedItemColor: AppColor().evilLyn,
        unselectedItemColor: AppColor().snugCottage,
        onTap: (value) {
          setState(() {
            bottomNavIndex = value;
          });
        },
        currentIndex: bottomNavIndex,
        items: const [
          BottomNavigationBarItem(
            icon: HeroIcon(HeroIcons.userGroup),
            label: 'Employee',
          ),
          BottomNavigationBarItem(
            icon: HeroIcon(HeroIcons.mapPin),
            label: 'Position',
          ),
          BottomNavigationBarItem(
            icon: HeroIcon(HeroIcons.buildingOffice2),
            label: 'Company',
          ),
        ],
      ),
      body: Center(
        child: Container(
          height: double.maxFinite,
          width: double.maxFinite,
          color: AppColor().snugCottage,
          child: Column(
            children: [
              Container(
                alignment: Alignment.bottomLeft,
                padding: const EdgeInsets.all(20),
                height: 160,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  borderRadius:
                      const BorderRadius.vertical(bottom: Radius.circular(18)),
                  color: AppColor().infinity,
                ),
                child: Text(
                  'Hello User!!!',
                  style: TextStyle(
                      fontSize: 46,
                      fontWeight: FontWeight.w700,
                      color: AppColor().snugCottage),
                ),
              ),
              const SizedBox(
                height: 6,
              ),
              bottomNavIndex == 0
                  ? const AdminEmployeePage()
                  : (bottomNavIndex == 1
                      ? const AdminPositionPage()
                      : const AdminCompanyPage()),
              const SizedBox(
                height: 6,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
