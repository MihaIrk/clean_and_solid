import 'package:clean_and_solid/presentation/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'data/repository/shared_prefs_repository.dart';
import 'data/service/local_service.dart';
import 'domain/states/cubit/employees_cubit/employees_list_cubit.dart';

GetIt getIt = GetIt.instance;

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  getIt.registerSingleton<SharedPrefs>(SharedPrefs());
  await getIt<SharedPrefs>().init();
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final SharedPrefs storage = getIt<SharedPrefs>();
    final LocalService localService = LocalService(storage: storage);
    return BlocProvider(
      create: (context) => EmployeesListCubit(localService: localService)..getEmployeesList(),
      child: MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurpleAccent),
          useMaterial3: true,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
