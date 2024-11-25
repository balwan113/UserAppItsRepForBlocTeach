part of 'user_bloc_bloc.dart';

@immutable
 class UserBlocEvent {}


class UserGetBlocEvent extends UserBlocEvent{
  final int count;

  UserGetBlocEvent({required this.count});
}

class JobGetBlocEvent extends UserBlocEvent{
  final int count;

  JobGetBlocEvent({required this.count});
}