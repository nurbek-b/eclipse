import 'package:dartz/dartz.dart';
import 'package:eclipse_app/src/core/handle_error/failure.dart';
import 'package:eclipse_app/src/features/explore_people/data/model/user.dart';
import 'package:eclipse_app/src/features/explore_people/domain/base_repository/base_repository.dart';

class GetDataUseCase {
  final BaseRepo baseRepo;

  GetDataUseCase({required this.baseRepo});

  Future<Either<Failure, List<User>>> call() async {
    return await baseRepo.getUsers();
  }
}
