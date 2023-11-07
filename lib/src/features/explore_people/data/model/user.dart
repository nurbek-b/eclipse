import 'package:eclipse_app/src/features/explore_people/data/model/company.dart';

class User {
  User({
    required this.name,
    required this.username,
    required this.email,
    required this.company,
  });

  final String name;
  final String username;
  final String email;
  final Company company;
}
