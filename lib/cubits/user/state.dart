part of 'cubit.dart';

@immutable
sealed class UserState extends Equatable {
  final User? data;
  final String? message;

  const UserState({
    this.data,
    this.message,
  });

  @override
  List<Object?> get props => [
        data,
        message,
      ];
}

@immutable
class UserDefault extends UserState {}

@immutable
class UserFetchLoading extends UserState {
  const UserFetchLoading() : super();
}

@immutable
class UserFetchSuccess extends UserState {
  const UserFetchSuccess({User? data}) : super(data: data);
}

@immutable
class UserFetchFailed extends UserState {
  const UserFetchFailed({String? message}) : super(message: message);
}

class UserLoaded extends UserState {
  const UserLoaded({User? data}) : super(data: data);
}
