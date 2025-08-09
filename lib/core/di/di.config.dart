// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../api/client/api_client.dart' as _i508;
import '../../api/client/api_module.dart' as _i272;
import '../../api/data_source/edit_profile/remote_data_source/edit_profile_remote_data_source_impl.dart'
    as _i527;
import '../../api/data_source/forget_password/email_verification/remote_data_source/email_verification_remote_data_source_impl.dart'
    as _i40;
import '../../api/data_source/forget_password/forget_password_email/remote_data_source/forget_password_email_remote_data_source_impl.dart'
    as _i120;
import '../../api/data_source/forget_password/reset_password/remote_data_source/reset_password_remote_data_source_impl.dart'
    as _i442;
import '../../api/data_source/login/remote_data_source/login_remote_data_source_impl.dart'
    as _i221;
import '../../api/data_source/profile/remote_data_source/profile_remote_data_source_impl.dart'
    as _i913;
import '../../api/data_source/signup/remote_data_source/signup_remote_data_source_impl.dart'
    as _i354;
import '../../api/data_source/splash/remote_data_source/splash_remote_data_source_impl.dart'
    as _i1009;
import '../../data/data_source/edit_profile/remote_data_source/edit_profile_remote_data_source.dart'
    as _i500;
import '../../data/data_source/forget_password/email_verification/remote_data_source/email_verification_remote_data_source.dart'
    as _i449;
import '../../data/data_source/forget_password/forget_password_email/remote_data_source/forget_password_email_remote_data_source.dart'
    as _i40;
import '../../data/data_source/forget_password/reset_password/remote_data_source/reset_password_remote_data_source.dart'
    as _i787;
import '../../data/data_source/login/remote_data_source/login_remote_data_source.dart'
    as _i684;
import '../../data/data_source/profile/remote_data_source/profile_remote_data_source.dart'
    as _i470;
import '../../data/data_source/signup/remote_data_source/signup_remote_data_source.dart'
    as _i879;
import '../../data/data_source/splash/remote_data_source/splash_remote_data_source.dart'
    as _i592;
import '../../data/repositories/edit_profile/edit_profile_repository_impl.dart'
    as _i216;
import '../../data/repositories/forget_password/email_verification_repository_impl.dart'
    as _i155;
import '../../data/repositories/forget_password/forget_password_email_repository_impl.dart'
    as _i543;
import '../../data/repositories/forget_password/reset_password_repository_impl.dart'
    as _i672;
import '../../data/repositories/login/login_repository_impl.dart' as _i722;
import '../../data/repositories/profile/profile_repository_impl.dart' as _i770;
import '../../data/repositories/signup/signup_repository_impl.dart' as _i881;
import '../../data/repositories/splash/splash_repository_impl.dart' as _i928;
import '../../domain/repositories/edit_profile/edit_profile_repository.dart'
    as _i157;
import '../../domain/repositories/forget_password/email_verification_repository.dart'
    as _i167;
import '../../domain/repositories/forget_password/forget_password_email_repository.dart'
    as _i499;
import '../../domain/repositories/forget_password/reset_password_repository.dart'
    as _i884;
import '../../domain/repositories/login/login_repository.dart' as _i300;
import '../../domain/repositories/profile/profile_repository.dart' as _i445;
import '../../domain/repositories/signup/signup_repository.dart' as _i415;
import '../../domain/repositories/splash/splash_repository.dart' as _i967;
import '../../domain/use_cases/edit_profile/edit_profile_use_case.dart' as _i89;
import '../../domain/use_cases/forget_password/reset_password_use_case.dart'
    as _i690;
import '../../domain/use_cases/forget_password/send_email_verification_use_case.dart'
    as _i808;
import '../../domain/use_cases/forget_password/verify_email_use_case.dart'
    as _i513;
import '../../domain/use_cases/login/login_with_email_and_password_use_case.dart'
    as _i197;
import '../../domain/use_cases/profile/logout_use_case.dart' as _i217;
import '../../domain/use_cases/signup/signup_use_case.dart' as _i139;
import '../../domain/use_cases/splash/get_user_use_case.dart' as _i391;
import '../../presentation/auth/forget_password/email_verification/views_model/email_verification_cubit.dart'
    as _i533;
import '../../presentation/auth/forget_password/forget_password_email/views_model/forget_password_email_cubit.dart'
    as _i206;
import '../../presentation/auth/forget_password/reset_password/views_model/reset_password_cubit.dart'
    as _i941;
import '../../presentation/auth/login/views_model/login_cubit.dart' as _i512;
import '../../presentation/auth/signup/views_model/signup_cubit.dart' as _i751;
import '../../presentation/dashboard/domain/controllers/home_controller.dart'
    as _i305;
import '../../presentation/dashboard/presentation/cubits/home_cubit.dart'
    as _i69;
import '../../presentation/edit_profile/views_model/edit_profile_cubit.dart'
    as _i556;
import '../../presentation/profile/views_model/profile_cubit.dart' as _i1028;
import '../../presentation/splash/presentation/views_model/splash_cubit.dart'
    as _i481;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final apiModule = _$ApiModule();
    gh.singleton<_i361.Dio>(() => apiModule.provideDio());
    gh.lazySingleton<_i69.HomeCubit>(() => _i69.HomeCubit());
    gh.factory<_i305.HomeController>(
      () => _i305.HomeController(gh<_i69.HomeCubit>()),
    );
    gh.factory<_i508.ApiClient>(() => _i508.ApiClient(gh<_i361.Dio>()));
    gh.factory<_i500.EditProfileRemoteDataSource>(
      () => _i527.EditProfileRemoteDataSourceImpl(gh<_i508.ApiClient>()),
    );
    gh.factory<_i787.ResetPasswordRemoteDataSource>(
      () => _i442.ResetPasswordRemoteDataSourceImpl(gh<_i508.ApiClient>()),
    );
    gh.factory<_i592.SplashRemoteDataSource>(
      () => _i1009.SplashRemoteDataSourceImpl(apiClient: gh<_i508.ApiClient>()),
    );
    gh.factory<_i684.LoginRemoteDataSource>(
      () => _i221.LoginRemoteDataSourceImpl(gh<_i508.ApiClient>()),
    );
    gh.factory<_i879.SignupRemoteDataSource>(
      () => _i354.SignupRemoteDataSourceImpl(gh<_i508.ApiClient>()),
    );
    gh.factory<_i157.EditProfileRepository>(
      () => _i216.EditProfileRepositoryImpl(
        editProfileRemoteDataSource: gh<_i500.EditProfileRemoteDataSource>(),
      ),
    );
    gh.factory<_i40.ForgetPasswordEmailRemoteDataSource>(
      () =>
          _i120.ForgetPasswordEmailRemoteDataSourceImpl(gh<_i508.ApiClient>()),
    );
    gh.factory<_i449.EmailVerificationRemoteDataSource>(
      () => _i40.EmailVerificationRemoteDataSourceImpl(gh<_i508.ApiClient>()),
    );
    gh.factory<_i470.ProfileRemoteDataSource>(
      () => _i913.ProfileRemoteDataSourceImpl(gh<_i508.ApiClient>()),
    );
    gh.factory<_i884.ResetPasswordRepository>(
      () => _i672.ResetPasswordRepositoryImpl(
        resetPasswordRemoteDataSource:
            gh<_i787.ResetPasswordRemoteDataSource>(),
      ),
    );
    gh.factory<_i300.LoginRepository>(
      () => _i722.LoginRepositoryImpl(
        loginRemoteDataSource: gh<_i684.LoginRemoteDataSource>(),
      ),
    );
    gh.factory<_i967.SplashRepository>(
      () => _i928.SplashRepositoryImpl(
        splashRemoteDataSource: gh<_i592.SplashRemoteDataSource>(),
      ),
    );
    gh.factory<_i167.EmailVerificationRepository>(
      () => _i155.EmailVerificationRepositoryImpl(
        emailVerificationRemoteDataSource:
            gh<_i449.EmailVerificationRemoteDataSource>(),
      ),
    );
    gh.factory<_i391.GetUserUseCase>(
      () => _i391.GetUserUseCase(gh<_i967.SplashRepository>()),
    );
    gh.factory<_i690.ResetPasswordUseCase>(
      () => _i690.ResetPasswordUseCase(gh<_i884.ResetPasswordRepository>()),
    );
    gh.factory<_i415.SignupRepository>(
      () => _i881.SignupRepositoryImpl(
        signupRemoteDataSource: gh<_i879.SignupRemoteDataSource>(),
      ),
    );
    gh.factory<_i445.ProfileRepository>(
      () => _i770.ProfileRepositoryImpl(
        profileRemoteDataSource: gh<_i470.ProfileRemoteDataSource>(),
      ),
    );
    gh.factory<_i89.EditProfileUseCase>(
      () => _i89.EditProfileUseCase(gh<_i157.EditProfileRepository>()),
    );
    gh.factory<_i139.SignupUseCase>(
      () => _i139.SignupUseCase(gh<_i415.SignupRepository>()),
    );
    gh.factory<_i481.SplashCubit>(
      () => _i481.SplashCubit(gh<_i391.GetUserUseCase>()),
    );
    gh.factory<_i499.ForgetPasswordEmailRepository>(
      () => _i543.ForgetPasswordEmailRepositoryImpl(
        forgetPasswordEmailRemoteDataSource:
            gh<_i40.ForgetPasswordEmailRemoteDataSource>(),
      ),
    );
    gh.factory<_i217.LogoutUseCase>(
      () => _i217.LogoutUseCase(gh<_i445.ProfileRepository>()),
    );
    gh.factory<_i941.ResetPasswordCubit>(
      () => _i941.ResetPasswordCubit(
        resetPasswordUseCase: gh<_i690.ResetPasswordUseCase>(),
      ),
    );
    gh.factory<_i556.EditProfileCubit>(
      () => _i556.EditProfileCubit(
        editProfileUseCase: gh<_i89.EditProfileUseCase>(),
      ),
    );
    gh.factory<_i751.SignUpCubit>(
      () => _i751.SignUpCubit(gh<_i139.SignupUseCase>()),
    );
    gh.factory<_i197.LoginWithEmailAndPasswordUseCase>(
      () => _i197.LoginWithEmailAndPasswordUseCase(gh<_i300.LoginRepository>()),
    );
    gh.factory<_i808.SendEmailVerificationUseCase>(
      () => _i808.SendEmailVerificationUseCase(
        gh<_i499.ForgetPasswordEmailRepository>(),
      ),
    );
    gh.factory<_i206.ForgetPasswordEmailCubit>(
      () => _i206.ForgetPasswordEmailCubit(
        sendEmailVerificationUseCase: gh<_i808.SendEmailVerificationUseCase>(),
      ),
    );
    gh.factory<_i513.VerifyEmailUseCase>(
      () => _i513.VerifyEmailUseCase(gh<_i167.EmailVerificationRepository>()),
    );
    gh.factory<_i1028.ProfileCubit>(
      () => _i1028.ProfileCubit(logoutUseCase: gh<_i217.LogoutUseCase>()),
    );
    gh.factory<_i512.LoginCubit>(
      () => _i512.LoginCubit(
        loginWithEmailAndPasswordUseCase:
            gh<_i197.LoginWithEmailAndPasswordUseCase>(),
      ),
    );
    gh.factory<_i533.EmailVerificationCubit>(
      () => _i533.EmailVerificationCubit(
        sendEmailVerificationUseCase: gh<_i808.SendEmailVerificationUseCase>(),
        verifyEmailUseCase: gh<_i513.VerifyEmailUseCase>(),
      ),
    );
    return this;
  }
}

class _$ApiModule extends _i272.ApiModule {}
