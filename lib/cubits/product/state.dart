part of 'cubit.dart';

@immutable
class ProductState extends Equatable {
  final Product? data;
  final String? message;

  const ProductState({
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
class ProductDefault extends ProductState {}

@immutable
class ProductFetchLoading extends ProductState {
  const ProductFetchLoading() : super();
}

@immutable
class ProductFetchSuccess extends ProductState {
  const ProductFetchSuccess({Product? data}) : super(data: data);
}

@immutable
class ProductFetchFailed extends ProductState {
  const ProductFetchFailed({String? message}) : super(message: message);
}
