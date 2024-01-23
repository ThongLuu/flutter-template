import 'dart:async';

import '/models/store.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../utils/logging/logger.dart';

part 'data_provider.dart';
part 'repository.dart';
part 'state.dart';

class StoresCubit extends Cubit<StoresState> {
  static StoresCubit cubit(BuildContext context, [bool listen = false]) =>
      BlocProvider.of<StoresCubit>(context, listen: listen);

  StoresCubit() : super(StoresDefault());

  final repo = StoresRepository();

  Future<void> fetch({String? keyword}) async {
    emit(const StoresFetchLoading());
    try {
      keyword ??= 'latest';

      Duration? difference;
      final currentTime = DateTime.now();
      List<Store>? data = [];

      data = await repo.fetchHive();
      // printOut("data from Hive");
      // printOut(data.toString());
      DateTime? storesTime = Hive.box('app').get('storesTime');
      if (storesTime != null) {
        difference = currentTime.difference(storesTime);
      }
      if (data == null || (difference != null && difference.inHours > 1)) {
        data = await repo.fetchApi();
      }

      emit(StoresFetchSuccess(data: data));
    } catch (e) {
      emit(StoresFetchFailed(message: e.toString()));
    }
  }
}
