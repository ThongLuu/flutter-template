import 'dart:async';

import '/models/store.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../models/product.dart';
import '../../utils/logging/logger.dart';

part 'data_provider.dart';
part 'repository.dart';
part 'state.dart';

class ProductCubit extends Cubit<ProductState> {
  static ProductCubit cubit(BuildContext context, [bool listen = false]) =>
      BlocProvider.of<ProductCubit>(context, listen: listen);

  ProductCubit() : super(ProductDefault());

  final repo = ProductRepository();

  Future<void> fetch(String? keyword) async {
    emit(const ProductFetchLoading());
    try {
      if (keyword == null) throw ErrorDescription("Product Id is null");
      Duration? difference;
      final currentTime = DateTime.now();
      Product? data;
      data = await repo.fetchApi(keyword);

      emit(ProductFetchSuccess(data: data));
    } catch (e) {
      emit(ProductFetchFailed(message: e.toString()));
    }
  }
}
