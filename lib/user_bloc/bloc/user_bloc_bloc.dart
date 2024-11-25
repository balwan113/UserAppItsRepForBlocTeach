import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'user_bloc_event.dart';
part 'user_bloc_state.dart';

class UserBloc extends Bloc<UserBlocEvent, UserBlocState> {


  UserBloc() : super(const UserBlocState()) {
    on<UserGetBlocEvent>(_onGetUser);
    on<JobGetBlocEvent>(_onGetJob);
  }
  // Проверьте тип состояния и определите корректное условие


  _onGetUser(UserGetBlocEvent event, Emitter<UserBlocState> emit) async {
    emit(const UserBlocState(isLoading: true));
    await Future.delayed(const Duration(seconds: 2));
    final users = List.generate(event.count, (index) => User(name: 'name user', id: index.toString()));
    emit(state.copyWith(users: users));
  }
_onGetJob(JobGetBlocEvent event, Emitter<UserBlocState> emit) async {
  emit(state.copyWith(isLoading: true)); // Устанавливаем isLoading в true
  await Future.delayed(const Duration(seconds: 2)); // Эмуляция задержки
  final job = List.generate(event.count, (index) => Job(job: 'job user', id: index.toString()));
  emit(state.copyWith(job: job, isLoading: false)); // Обновляем job и isLoading на false
}

}
