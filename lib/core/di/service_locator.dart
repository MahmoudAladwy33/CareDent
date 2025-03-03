import 'package:caredent/features/sign_up/data/repos/sign_up_repo.dart';
import 'package:caredent/features/sign_up/logic/sign_up_cubit/sign_up_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../features/login/data/repos/login_repo.dart';
import '../../features/login/logic/cubit/login_cubit.dart';
import '../../features/sign_up/data/repos/verify_account_repo.dart';
import '../../features/sign_up/logic/verify_account_cubit/verify_account_cubit.dart';
import '../networking/api_service.dart';
import '../networking/dio_factory.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Dio & ApiService
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  //login
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));

  //signup
  getIt.registerLazySingleton<SignupRepo>(() => SignupRepo(getIt()));
  getIt.registerFactory<SignUpCubit>(() => SignUpCubit(getIt()));

  //verify account
  getIt.registerLazySingleton<VerifyAccountRepo>(
    () => VerifyAccountRepo(getIt()),
  );
  getIt.registerFactory<VerifyAccountCubit>(() => VerifyAccountCubit(getIt()));
}
