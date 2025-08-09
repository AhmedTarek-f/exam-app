import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:exam_app/api/requests/edit_profile_request/edit_profile_request.dart';
import 'package:exam_app/api/requests/email_verification_request/email_verification_request.dart';
import 'package:exam_app/api/requests/forget_password_request/forget_password_email_request.dart';
import 'package:exam_app/api/requests/login_request/login_request.dart';
import 'package:exam_app/api/requests/reset_password_request/reset_password_request.dart';
import 'package:exam_app/api/requests/signup_request/signup_request.dart';
import 'package:exam_app/api/responses/edit_profile_response/edit_profile_response.dart';
import 'package:exam_app/api/responses/email_verification_response/email_verification_response.dart';
import 'package:exam_app/api/responses/forget_password_response/forget_password_email_response.dart';
import 'package:exam_app/api/responses/login_response/login_response.dart';
import 'package:exam_app/api/responses/reset_password_response/reset_password_response.dart';
import 'package:exam_app/api/responses/signup_response/signup_response.dart';
import 'package:exam_app/api/responses/splash_response/splash_response.dart';
import 'package:exam_app/core/constants/endpoints.dart';
import 'package:retrofit/retrofit.dart';

part 'api_client.g.dart';

@injectable
@RestApi()
abstract class ApiClient {
  @factoryMethod
  factory ApiClient(Dio dio) = _ApiClient;

  @POST(Endpoints.loginUri)
  Future<LoginResponse> login({@Body() required LoginRequest request});

  @POST(Endpoints.forgotPasswordUri)
  Future<ForgetPasswordEmailResponse> sendEmailVerification({
    @Body() required ForgetPasswordEmailRequest request,
  });

  @POST(Endpoints.verifyResetCodeUri)
  Future<EmailVerificationResponse> verifyEmailCode({
    @Body() required EmailVerificationRequest request,
  });
  @POST(Endpoints.signUpUri)
  Future<SignupResponse> signup({@Body() required SignupRequest request});

  @PUT(Endpoints.resetPasswordUri)
  Future<ResetPasswordResponse> resetPassword({
    @Body() required ResetPasswordRequest request,
  });

  @GET(Endpoints.logoutUri)
  Future<void> logout({@Header("token") required String token});

  @PUT(Endpoints.editProfileUri)
  Future<EditProfileResponse> editProfile({
    @Header("token") required String token,
    @Body() required EditProfileRequest request,
  });

  @GET(Endpoints.getUserDataUri)
  Future<SplashResponse> getUserData({@Header("token") required String token});
}
