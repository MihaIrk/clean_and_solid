import 'package:clean_and_solid/presentation/logic/cubit/employees_cubit/employees_list_cubit.dart';
import 'package:clean_and_solid/presentation/pages/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:uuid/uuid.dart';
import 'data/repository/shared_preferences_service.dart';
import 'data/source/local/shared_preferences_storage.dart';
import 'domain/usecases/shared_prefs_use_case.dart';

GetIt getIt = GetIt.instance;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  getIt.registerSingleton<SharedPreferencesRepository>(SharedPreferencesRepository());
  await getIt<SharedPreferencesRepository>().init();
  getIt.registerSingleton<Uuid>(const Uuid());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final SharedPreferencesService repository = SharedPreferencesService(repository: getIt<SharedPreferencesRepository>());
    final SharedPrefsUseCase useCase = SharedPrefsUseCase(repository: repository);
    return BlocProvider(
      create: (context) =>
          EmployeesListCubit(useCase: useCase)..getEmployeesList(),
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
