part of 'cubit.dart';

@immutable
class StoresState extends Equatable {
  final List<Store>? data;
  final String? message;

  const StoresState({
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
class StoresDefault extends StoresState {}

@immutable
class StoresFetchLoading extends StoresState {
  const StoresFetchLoading() : super();
}

@immutable
class StoresFetchSuccess extends StoresState {
  const StoresFetchSuccess({List<Store>? data}) : super(data: data);
}

@immutable
class StoresFetchFailed extends StoresState {
  const StoresFetchFailed({String? message}) : super(message: message);
}
