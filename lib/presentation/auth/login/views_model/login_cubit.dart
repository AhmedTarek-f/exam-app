import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:exam_app/api/client/api_result.dart';
import 'package:exam_app/api/requests/login_request/login_request.dart';
import 'package:exam_app/core/cache/shared_preferences_helper.dart';
import 'package:exam_app/core/constants/const_keys.dart';
import 'package:exam_app/domain/entities/login/user_data_entity.dart';
import 'package:exam_app/domain/use_cases/login/login_with_email_and_password_use_case.dart';
import 'package:exam_app/presentation/auth/login/views_model/login_intent.dart';
import 'package:exam_app/presentation/auth/login/views_model/login_state.dart';
import 'package:exam_app/utils/exam_method_helper.dart';
import 'package:exam_app/utils/exceptions/response_exception.dart';
import 'package:exam_app/utils/secure_storage/secure_storage.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  final LoginWithEmailAndPasswordUseCase loginWithEmailAndPasswordUseCase;
  @factoryMethod
  LoginCubit({required this.loginWithEmailAndPasswordUseCase})
    : super(LoginInitial());

  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  late final GlobalKey<FormState> loginFormKey;
  late bool rememberMe;
  ChangeObscureState _obscurePasswordState = ChangeObscureState();

  Future<void> doIntent({required LoginIntent intent}) async {
    switch (intent) {
      case InitializeLoginFormIntent():
        _onInit();
        break;
      case ChangeAutoValidateModeIntent():
        _enableAutoValidateMode();
        break;
      case LoginWithEmailAndPasswordIntent():
        await _login();
        break;
      case ToggleObscurePasswordIntent():
        _toggleObscure();
        break;
      case ToggleRememberMeIntent():
        await _toggleRememberMe();
        break;
    }
  }

  void _onInit() async {
    loginFormKey = GlobalKey<FormState>();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    _getRememberMeValue();
    if (rememberMe) await _getRememberedUserData();
  }

  void _enableAutoValidateMode() {
    emit(
      EnableAutoValidateModeState(autoValidateMode: AutovalidateMode.always),
    );
  }

  void _toggleObscure() {
    _obscurePasswordState = _obscurePasswordState.copyWith(
      isObscurePassword: _obscurePasswordState.isObscure,
    );
    emit(_obscurePasswordState);
  }

  void _getRememberMeValue() {
    rememberMe = SharedPreferencesHelper.getBool(key: ConstKeys.rememberMe);
  }

  Future<void> _toggleRememberMe() async {
    rememberMe = !rememberMe;
    await SharedPreferencesHelper.saveBool(
      key: ConstKeys.rememberMe,
      value: rememberMe,
    );
    await _forgetUserData();
    emit(ToggleRememberMeState());
  }

  Future<void> _rememberUserData() async {
    await SecureStorage.saveData(
      key: ConstKeys.email,
      value: emailController.text,
    );
    await SecureStorage.saveData(
      key: ConstKeys.password,
      value: passwordController.text,
    );
  }

  Future<void> _forgetUserData() async {
    await SecureStorage.deleteData(key: ConstKeys.email);
    await SecureStorage.deleteData(key: ConstKeys.password);
  }

  Future<void> _getRememberedUserData() async {
    emailController.text =
        await SecureStorage.getData(key: ConstKeys.email) ?? "";
    passwordController.text =
        await SecureStorage.getData(key: ConstKeys.password) ?? "";
  }

  Future<void> _login() async {
    if (loginFormKey.currentState!.validate()) {
      emit(LoginLoadingState());
      var userData = await loginWithEmailAndPasswordUseCase.invoke(
        request: LoginRequest(
          email: emailController.text,
          password: passwordController.text,
        ),
      );
      switch (userData) {
        case Success<UserDataEntity?>():
          {
            ExamMethodHelper.userData = userData.data;
            if (rememberMe) await _rememberUserData();
            emit(LoginSuccessState());
            break;
          }
        case Failure<UserDataEntity?>():
          emit(
            LoginFailureState(
              errorData:
                  userData.responseException ??
                  ResponseException(code: 0, message: userData.errorMessage),
            ),
          );
          break;
      }
    } else {
      _enableAutoValidateMode();
    }
  }

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
