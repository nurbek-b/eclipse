import 'package:dartz/dartz.dart';
import 'package:eclipse_app/src/core/handle_error/failure.dart';
import 'package:eclipse_app/src/features/explore_people/domain/base_repository/base_repository.dart';

class GetImagesUseCase {
  final BaseRepo baseRepo;

  GetImagesUseCase({required this.baseRepo});

  Future<Either<Failure, List<String>>> call() async {
    return await baseRepo.getImages();
  }
}
