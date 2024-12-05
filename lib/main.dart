import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';
import 'package:mod_monitor_app/bloc/timer_bloc.dart';
import 'package:mod_monitor_app/ui_kit/colors.dart';
import 'bloc/home_bloc.dart';
import 'bloc/trigger_bloc.dart';
import 'navigation/routes.dart';
import 'storages/isar.dart';

final getIt = GetIt.instance;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final isar = await AppIsarDatabase.init();
  getIt.registerSingleton<Isar>(isar);

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => HomeCubit(),
        ),
        BlocProvider(
          create: (_) => TimerCubit(),
        ),
        BlocProvider(
          create: (_) => TriggerCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: AppColors.primary,
          useMaterial3: true,
        ),
        routes: AppRouting().routes,
      ),
    );
  }
}
