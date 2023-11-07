part of 'explore_people_bloc.dart';

abstract class ExplorePeopleState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ExplorePeopleInitial extends ExplorePeopleState {}

class ExplorePeopleLoaded extends ExplorePeopleState {
  ExplorePeopleLoaded(this.users);

  final List<User> users;
}

class ExplorePeopleLoading extends ExplorePeopleState {}

class ExplorePeopleErrorState extends ExplorePeopleState {
  ExplorePeopleErrorState(this.message);

  final String message;
}
