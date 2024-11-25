part of 'registration_bloc.dart';

abstract class RegistrationBlocState {}

class CountInitial extends RegistrationBlocState {
  final int count;
  CountInitial({required this.count});
}
class RegistrationCounterState extends RegistrationBlocState {
  final int count;

  RegistrationCounterState(this.count);
}

class RegistrationLoading extends RegistrationBlocState {}

class RegistrationSuccess extends RegistrationBlocState {
  final String userName;
  RegistrationSuccess({required this.userName});
}

class RegistrationFailure extends RegistrationBlocState {}
