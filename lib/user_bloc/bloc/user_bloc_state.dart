part of 'user_bloc_bloc.dart';
class UserBlocState {
  final bool isLoading;
  final List<User> users;
  final List<Job> job;

  const UserBlocState({
    this.isLoading = false,
    this.users = const [],
    this.job = const [], // Здесь job инициализировано как пустой список по умолчанию
  });

  UserBlocState copyWith({
    bool? isLoading,
    List<User>? users,
    List<Job>? job,
  }) {
    return UserBlocState(
      isLoading: isLoading ?? this.isLoading,
      users: users ?? this.users,
      job: job ?? this.job, // Обновляем job, если оно передано
    );
  }
}



class User{
  final String name;
  final String id;

  User({required this.name, required this.id});
}

class Job{
final String job;
  final String id;

  Job({required this.job, required this.id});
}