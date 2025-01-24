import 'package:dio/dio.dart';
import 'package:flutter_advanced/core/networking/api_service.dart';
import 'package:flutter_advanced/core/networking/dio_factory.dart';
import 'package:flutter_advanced/features/auth/data/repos/login_repo.dart';
import 'package:flutter_advanced/features/auth/logic/login_cubit/login_cubit.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;
Future<void> setupLocator() async {
  // Network
  Dio dio = DioFactory.getDio();
  locator.registerLazySingleton<ApiService>(() => ApiService(dio));

  // Login
  locator.registerLazySingleton<LoginRepo>(() => LoginRepo(locator()));
  locator.registerLazySingleton<LoginCubit>(() => LoginCubit(locator()));
}
