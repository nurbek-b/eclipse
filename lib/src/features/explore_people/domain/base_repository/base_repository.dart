import 'package:dartz/dartz.dart';
import 'package:eclipse_app/src/core/handle_error/failure.dart';
import 'package:eclipse_app/src/features/explore_people/data/model/user.dart';

abstract class BaseRepo {
  Future<Either<Failure, List<User>>> getUsers();

  Future<Either<Failure, List<String>>> getImages();
}
