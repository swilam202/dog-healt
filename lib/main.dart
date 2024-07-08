// ignore_for_file: prefer_const_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled4/controllers/clinic_controller/clinic_cubit.dart';
import 'package:untitled4/controllers/signup_controller/signup_cubit.dart';
import 'package:untitled4/home.dart';

import 'package:untitled4/services/notification_services.dart';

import 'controllers/causes_controller/causes_cubit.dart';
import 'controllers/find_disease_controller/find_disease_cubit.dart';
import 'controllers/login_controller/login_cubit.dart';
import 'firebase_options.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await LocalNotificationServices().initialize();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoginCubit()),
        BlocProvider(create: (context) => SignupCubit()),
        BlocProvider(create: (context) => CausesCubit()),
        BlocProvider(create: (context) => FindDiseaseCubit()),
        BlocProvider(create: (context) => ClinicCubit()),

      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Home(),
      ),
    );
  }
}