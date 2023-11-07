import 'package:dartz/dartz.dart';
import 'package:eclipse_app/src/core/handle_error/failure.dart';
import 'package:eclipse_app/src/features/explore_people/data/model/user.dart';
import 'package:eclipse_app/src/features/explore_people/domain/use_case/fetch_users_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'explore_people_event.dart';

part 'explore_people_state.dart';

class ExplorePeopleBloc extends Bloc<ExplorePeopleEvent, ExplorePeopleState> {
  final GetDataUseCase getDataUseCase;

  ExplorePeopleBloc(this.getDataUseCase)
      : super(ExplorePeopleInitial()) {
    on<OnExplorePeopleEventCalled>((event, emit) async {
      emit(ExplorePeopleLoading());
      try {
        final Either<Failure, List<User>> result = await getDataUseCase.call();
        result.fold((l) {
          print("error ExplorePeopleBloc --> ${l.message}");
          emit(ExplorePeopleErrorState(l.message));
        }, (users) {
          emit(ExplorePeopleLoaded(users));
        });
      } catch (e) {
        print("error --> $e");
        emit(ExplorePeopleErrorState(e.toString()));
      }
    });
  }
}
