import 'package:assignment_test/core/cubit/fix_cubit.dart';
import 'package:assignment_test/core/cubit/internet_cubit.dart';
import 'package:assignment_test/core/cubit/item_details_cubit.dart';
import 'package:assignment_test/core/cubit/items_cubit.dart';
import 'package:assignment_test/core/cubit/login_cubit.dart';
import 'package:assignment_test/ui/views/main_view/main_view.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final InternetCubit _connectivityCubit =
      InternetCubit(connectivity: Connectivity());

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginCubit(),
        ),
        BlocProvider(
          create: (context) => ItemsCubit(),
        ),
        BlocProvider(
          create: (context) => ItemDetailsCubit(),
        ),
        BlocProvider(
          create: (context) => FixCubit(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        builder: BotToastInit(),
        navigatorObservers: [BotToastNavigatorObserver()],
        home: BlocProvider(
          create: (context) => _connectivityCubit,
          child: const MyHomePage(title: 'Potato Tech Flutter Assignment'),
        ),
      ),
    );
  }
}
