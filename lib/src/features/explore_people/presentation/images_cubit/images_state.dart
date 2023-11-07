part of 'images_cubit.dart';

abstract class ImagesState {}

class ImagesInitial extends ImagesState {}

class ImagesLoading extends ImagesState {}

class ImagesLoadedState extends ImagesState {
  final List<String> images;

  ImagesLoadedState(this.images);
}

class ImagesErrorState extends ImagesState {
  ImagesErrorState(this.message);

  final String message;
}
