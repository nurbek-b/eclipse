import 'dart:convert';
import 'dart:developer';

import 'package:eclipse_app/src/core/handle_error/exceptions.dart';
import 'package:eclipse_app/src/features/explore_people/data/model/company.dart';
import 'package:eclipse_app/src/features/explore_people/data/model/user.dart';
import 'package:http/http.dart';

abstract class RemoteData {
  Future<List<User>> getData();

  Future<List<String>> getImages();
}

class RemoteDataImpl extends RemoteData {
  @override
  Future<List<User>> getData() async {
    try {
      final response =
      await get(Uri.parse("https://jsonplaceholder.typicode.com/users/"));
      List responseList = json.decode(response.body);
      List<User> users = responseList
          .map(
            (data) => User(
              name: data['name'],
              username: data['username'],
              email: data['email'],
              company: Company(
                name: data['company']['name'],
                catchPhrase: data['company']['catchPhrase'],
                bs: data['company']['bs'],
              ),
            ),
          )
          .toList();
      return users;
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<List<String>> getImages() async {
    try {
      Future.delayed(const Duration(seconds: 2));
      return ['img_1.jpeg', 'img_2.jpeg', 'img_3.jpeg'];
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }
}
