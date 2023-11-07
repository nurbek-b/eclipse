import 'package:eclipse_app/src/features/explore_people/presentation/explore_people_screen.dart';
import 'package:eclipse_app/src/themes/app_style.dart';
import 'package:flutter/material.dart';

class AppScreen extends StatefulWidget {
  const AppScreen({Key? key}) : super(key: key);

  @override
  State<AppScreen> createState() => _AppScreenState();
}

class _AppScreenState extends State<AppScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tinder Like App',
      theme: AppTheme.themeData,
      debugShowCheckedModeBanner: false,
      home: const ExplorePeopleScreen(),
      routes: {
        ExplorePeopleScreen.routeName: (context) => const ExplorePeopleScreen(),
      },
    );
  }
}
