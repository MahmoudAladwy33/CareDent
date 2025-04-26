import 'package:caredent/features/book_appointment/data/repos/create_appoinment_repo.dart';
import 'package:caredent/features/book_appointment/logic/cubit/create_appoinment_cubit.dart';
import 'package:caredent/features/profile/data/repos/update_user_image_repo.dart';
import 'package:caredent/features/profile/logic/update_user_cubit/update_user_cubit.dart';
import 'package:caredent/features/sign_up/data/repos/sign_up_repo.dart';
import 'package:caredent/features/sign_up/logic/sign_up_cubit/sign_up_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../features/get_available_appointments/data/repos/get_available_appointments_repo.dart';
import '../../features/get_available_appointments/logic/cubit/get_available_appointments_cubit.dart';
import '../../features/home/data/repos/get_reports_repo.dart';
import '../../features/home/logic/cubit/get_reports_cubit.dart';
import '../../features/login/data/repos/create_new_password_repo.dart';
import '../../features/login/data/repos/forget_pass_repo.dart';
import '../../features/login/data/repos/login_repo.dart';
import '../../features/login/data/repos/verify_password_repo.dart';
import '../../features/login/logic/create_new_password_cubit/create_new_password_cubit.dart';
import '../../features/login/logic/forget_pass_cubit/forget_password_cubit.dart';
import '../../features/login/logic/login_cubit/login_cubit.dart';
import '../../features/login/logic/verify_pass_cubit/verify_password_cubit.dart';
import '../../features/my_appointments/data/repos/create_review_repo.dart';
import '../../features/my_appointments/data/repos/delete_appointment_repo.dart';
import '../../features/my_appointments/data/repos/get_my_appointments_repo.dart';
import '../../features/my_appointments/logic/create_review_cubit/create_review_cubit.dart';
import '../../features/my_appointments/logic/delete_appoinment_cubit/delete_appoinment_cubit.dart';
import '../../features/my_appointments/logic/get_appoinments_cubit/get_my_appointments_cubit.dart';
import '../../features/profile/data/repos/update_user_repo.dart';

import '../../features/profile/logic/update_user_image_cubit/update_user_image_cubit.dart';
import '../../features/settings/data/repos/create_report_repo.dart';
import '../../features/settings/data/repos/update_report_repo.dart';
import '../../features/settings/logic/create_report_cubit/create_report_cubit.dart';
import '../../features/settings/logic/update_report_cubit/update_report_cubit.dart';
import '../../features/sign_up/data/repos/verify_account_repo.dart';
import '../../features/sign_up/logic/verify_account_cubit/verify_account_cubit.dart';
import '../logic/user_cubit/user_cubit.dart';
import '../networking/api_service.dart';
import '../networking/dio_factory.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Dio & ApiService
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  //login
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerLazySingleton<UserCubit>(() => UserCubit());
  getIt.registerFactory<LoginCubit>(
    () => LoginCubit(getIt(), getIt<UserCubit>()),
  );

  //signup
  getIt.registerLazySingleton<SignupRepo>(() => SignupRepo(getIt()));
  getIt.registerFactory<SignUpCubit>(() => SignUpCubit(getIt()));

  //verify account
  getIt.registerLazySingleton<VerifyAccountRepo>(
    () => VerifyAccountRepo(getIt()),
  );
  getIt.registerFactory<VerifyAccountCubit>(() => VerifyAccountCubit(getIt()));

  //forget password
  getIt.registerLazySingleton<ForgetPassRepo>(() => ForgetPassRepo(getIt()));

  getIt.registerFactory<ForgetPasswordCubit>(
    () => ForgetPasswordCubit(getIt()),
  );

  //verify password
  getIt.registerLazySingleton<VerifyPasswordRepo>(
    () => VerifyPasswordRepo(getIt()),
  );
  getIt.registerFactory<VerifyPasswordCubit>(
    () => VerifyPasswordCubit(getIt()),
  );

  //create new password
  getIt.registerLazySingleton<CreateNewPasswordRepo>(
    () => CreateNewPasswordRepo(getIt()),
  );
  getIt.registerFactory<CreateNewPasswordCubit>(
    () => CreateNewPasswordCubit(getIt()),
  );

  //create appointment
  getIt.registerLazySingleton<CreateAppoinmentRepo>(
    () => CreateAppoinmentRepo(getIt()),
  );
  getIt.registerFactory<CreateAppoinmentCubit>(
    () => CreateAppoinmentCubit(getIt()),
  );

  //update user
  getIt.registerLazySingleton<UpdateUserRepo>(() => UpdateUserRepo(getIt()));
  getIt.registerFactory<UpdateUserCubit>(() => UpdateUserCubit(getIt()));

  //update user image
  getIt.registerLazySingleton<Dio>(() => DioFactory.getDio());

  getIt.registerLazySingleton<UpdateUserImageRepo>(
    () => UpdateUserImageRepo(getIt<Dio>()),
  );

  getIt.registerFactory<UpdateUserImageCubit>(
    () => UpdateUserImageCubit(getIt<UpdateUserImageRepo>()),
  );

  //getMyAppointments
  getIt.registerLazySingleton<GetMyAppointmentsRepo>(
    () => GetMyAppointmentsRepo(getIt()),
  );
  getIt.registerFactory<GetMyAppointmentsCubit>(
    () => GetMyAppointmentsCubit(getIt()),
  );

  //CreateReview
  getIt.registerLazySingleton<CreateReviewRepo>(
    () => CreateReviewRepo(getIt()),
  );
  getIt.registerFactory<CreateReviewCubit>(() => CreateReviewCubit(getIt()));

  //DeleteAppointment
  getIt.registerLazySingleton<DeleteAppointmentRepo>(
    () => DeleteAppointmentRepo(getIt()),
  );
  getIt.registerFactory<DeleteAppoinmentCubit>(
    () => DeleteAppoinmentCubit(getIt()),
  );

  //CreateReport
  getIt.registerLazySingleton<CreateReportRepo>(
    () => CreateReportRepo(getIt()),
  );
  getIt.registerFactory<CreateReportCubit>(() => CreateReportCubit(getIt()));

  //updateReport
  getIt.registerLazySingleton<UpdateReportRepo>(
    () => UpdateReportRepo(getIt()),
  );
  getIt.registerFactory<UpdateReportCubit>(() => UpdateReportCubit(getIt()));

  //getReports
  getIt.registerLazySingleton<GetReportsRepo>(() => GetReportsRepo(getIt()));
  getIt.registerFactory<GetReportsCubit>(() => GetReportsCubit(getIt()));

  //getAvailableAppointments
  getIt.registerLazySingleton<GetAvailableAppointmentsRepo>(
    () => GetAvailableAppointmentsRepo(getIt()),
  );
  getIt.registerFactory<GetAvailableAppointmentsCubit>(
    () => GetAvailableAppointmentsCubit(getIt()),
  );
}
