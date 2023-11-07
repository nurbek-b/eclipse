import 'package:dartz/dartz.dart';
import 'package:eclipse_app/src/core/handle_error/exceptions.dart';
import 'package:eclipse_app/src/core/handle_error/failure.dart';
import 'package:eclipse_app/src/core/handle_error/network_info.dart';
import 'package:eclipse_app/src/features/explore_people/data/data_source/remote_data_source.dart';
import 'package:eclipse_app/src/features/explore_people/data/model/user.dart';
import 'package:eclipse_app/src/features/explore_people/domain/base_repository/base_repository.dart';

class Repo extends BaseRepo {
  final RemoteData remoteData;
  final NetworkInfo networkInfo;

  Repo({required this.remoteData, required this.networkInfo});

  @override
  Future<Either<Failure, List<User>>> getUsers() async {
    if (await networkInfo.isConnected) {
      try {
        final result = await remoteData.getData();
        return Right(result);
      } on ServerException catch (failure) {
        return left(ServerFailure(message: failure.message.toString()));
      }
    } else {
      return left(const ServerFailure(message: 'No Internet Connection'));
    }
  }

  @override
  Future<Either<Failure, List<String>>> getImages() async {
    if (await networkInfo.isConnected) {
      try {
        final result = await remoteData.getImages();
        return Right(result);
      } on ServerException catch (failure) {
        return left(ServerFailure(message: failure.message.toString()));
      }
    } else {
      return left(const ServerFailure(message: 'No Internet Connection'));
    }
  }
}
