import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../models/user.dart';
import '../../utils/logging/logger.dart';

part 'data_provider.dart';
part 'repository.dart';
part 'state.dart';

class UserCubit extends Cubit<UserState> {
  static UserCubit cubit(BuildContext context, [bool listen = false]) =>
      BlocProvider.of(context, listen: listen);

  UserCubit() : super(UserDefault());

  final repo = UserRepository();

  Future<void> login(String? username, String? password) async {
    emit(const UserFetchLoading());
    try {
      if (username == null ||
          password == null ||
          username.isEmpty ||
          password.isEmpty) throw ErrorDescription("User or Password is null");
      Duration? difference;
      final currentTime = DateTime.now();
      User? data;
      data = await repo.login(username, password);

      emit(UserFetchSuccess(data: data));
    } catch (e) {
      emit(UserFetchFailed(message: e.toString()));
    }
  }
}
