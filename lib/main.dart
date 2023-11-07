import 'package:eclipse_app/src/app.dart';
import 'package:eclipse_app/src/core/services/injection_container.dart';
import 'package:eclipse_app/src/features/explore_people/presentation/explore_people_bloc/explore_people_bloc.dart';
import 'package:eclipse_app/src/features/explore_people/presentation/images_cubit/images_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppServiceLocator.initAppServiceLocator();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => sl<ExplorePeopleBloc>()),
        BlocProvider(create: (context) => sl<ImagesCubit>()),
      ],
      child: const AppScreen(),
    );
  }
}
