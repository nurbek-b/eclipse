import 'package:dartz/dartz.dart';
import 'package:eclipse_app/src/core/handle_error/failure.dart';
import 'package:eclipse_app/src/features/explore_people/domain/use_case/fetch_images_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'images_state.dart';

class ImagesCubit extends Cubit<ImagesState> {
  final GetImagesUseCase getImagesUseCase;

  ImagesCubit(this.getImagesUseCase) : super(ImagesInitial());

  void fetchImages() async {
    try {
      final Either<Failure, List<String>> result =
          await getImagesUseCase.call();
      result.fold((l) {
        print("error ImagesCubit --> ${l.message}");
        emit(ImagesErrorState(l.message));
      }, (images) {
        emit(ImagesLoadedState(images));
      });
    } catch (e) {
      print("error ImagesCubit --> $e");
      emit(ImagesErrorState(e.toString()));
    }
  }
}
