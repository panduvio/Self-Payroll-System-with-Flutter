// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:tugas_kelompok_basis_data/dependency_injector.dart';
import 'package:tugas_kelompok_basis_data/presentations/providers/bloc/admin_bloc.dart';
import 'package:tugas_kelompok_basis_data/presentations/providers/bloc/employee_bloc.dart';
import 'package:tugas_kelompok_basis_data/presentations/screens/employee_home_screen.dart';
import 'package:tugas_kelompok_basis_data/presentations/screens/login_screen.dart';

void main() {
  setUp();
  runApp(
    MultiProvider(
      providers: [
        BlocProvider(
          create: (context) => EmployeeBloc(),
        ),
        BlocProvider(
          create: (context) => AdminBloc(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: EmployeeHomeScreen(
        userName: '',
      ),
    );
  }
}
