import 'package:exam_app/core/router/route_names.dart';
import 'package:exam_app/presentation/auth/forget_password/email_verification/views/email_verification_view.dart';
import 'package:exam_app/presentation/auth/forget_password/forget_password_email/views/forget_password_email_view.dart';
import 'package:exam_app/presentation/auth/forget_password/reset_password/views/reset_password_view.dart';
import 'package:exam_app/presentation/auth/login/views/login_view.dart';
import 'package:exam_app/presentation/auth/signup/views/sign_up_screen.dart';
import 'package:exam_app/presentation/change_password/views/change_password_view.dart';
import 'package:exam_app/presentation/dashboard/presentation/screens/dashboard_screen.dart';
import 'package:exam_app/presentation/edit_profile/views/edit_profile_view.dart';
import 'package:exam_app/presentation/profile/views_model/profile_cubit.dart';
import 'package:exam_app/presentation/splash/presentation/views/splash_screen.dart';
import 'package:flutter/material.dart';

abstract class AppRouter {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.splash:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case RouteNames.login:
        return MaterialPageRoute(builder: (_) => const LoginView());
      case RouteNames.forgetPasswordEmail:
        return MaterialPageRoute(
          builder: (_) => const ForgetPasswordEmailView(),
        );
      case RouteNames.emailVerification:
        final String email = settings.arguments as String;
        return MaterialPageRoute(
          builder: (_) => EmailVerificationView(userEmail: email),
        );
      case RouteNames.signup:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());
      case RouteNames.resetPassword:
        final String email = settings.arguments as String;
        return MaterialPageRoute(
          builder: (_) => ResetPasswordView(userEmail: email),
        );
      case RouteNames.dashboard:
        return MaterialPageRoute(builder: (_) => const DashboardScreen());
      case RouteNames.editProfile:
        final ProfileCubit profileController =
            settings.arguments as ProfileCubit;
        return MaterialPageRoute(
          builder: (_) => EditProfileView(profileController: profileController),
        );
      case RouteNames.changePassword:
        return MaterialPageRoute(builder: (_) => const ChangePasswordView());
      default:
        return null;
    }
  }
}
