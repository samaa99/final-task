import 'package:final_task/business_logic/guest_cubit.dart';
import 'package:final_task/repository/guset_repository.dart';
import 'package:final_task/screens/create_user_screen.dart';
import 'package:final_task/screens/guest_details_screen.dart';
import 'package:final_task/screens/guest_list_screen.dart';
import 'package:final_task/web_services/guest_web_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GuestCubit(GuestRepository(GuestWebService())),
      child: MaterialApp(
        title: 'Flutter Demo',
        home: CreateNewGuest(),
      ),
    );
  }
}
