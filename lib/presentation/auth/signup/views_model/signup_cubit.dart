import 'package:exam_app/api/client/api_result.dart';
import 'package:exam_app/api/requests/signup_request/signup_request.dart';
import 'package:exam_app/domain/entities/login/user_data_entity.dart';
import 'package:exam_app/domain/use_cases/signup/signup_use_case.dart';
import 'package:exam_app/presentation/auth/signup/views_model/sign_up_intent.dart';
import 'package:exam_app/utils/exceptions/response_exception.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'signup_state.dart';

@injectable
class SignUpCubit extends Cubit<SignUpState> {
  final SignupUseCase signupUseCase;
  @factoryMethod
  SignUpCubit(this.signupUseCase) : super(SignUpInitial());

  late final GlobalKey<FormState> signupFormKey;
  late final TextEditingController userNameController;
  late final TextEditingController firstNameController;
  late final TextEditingController lastNameController;
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  late final TextEditingController rePasswordController;
  late final TextEditingController phoneController;

  ChangePasswordObscureState _changePasswordObscureState =
      ChangePasswordObscureState();
  ChangeConfirmPasswordObscureState _changeConfirmPasswordObscureState =
      ChangeConfirmPasswordObscureState();

  Future<void> doIntent({required SignupIntent intent}) async {
    switch (intent) {
      case InitializeSignupIntent():
        _onInit();
        break;
      case ToggleObscurePasswordIntent():
        _togglePasswordObscure();
        break;
      case ToggleConfirmObscurePasswordIntent():
        _toggleConfirmPasswordObscure();
        break;
      case SignupWithEmailAndPasswordIntent():
        await _signUp();
    }
  }

  void _onInit() {
    signupFormKey = GlobalKey<FormState>();
    userNameController = TextEditingController();
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    rePasswordController = TextEditingController();
    phoneController = TextEditingController();
  }

  void _enableAutoValidateMode() {
    emit(
      EnableAutoValidateModeState(autoValidateMode: AutovalidateMode.always),
    );
  }

  void _togglePasswordObscure() {
    _changePasswordObscureState = _changePasswordObscureState.copyWith(
      isObscurePassword: _changePasswordObscureState.isObscure,
    );
    emit(_changePasswordObscureState);
  }

  void _toggleConfirmPasswordObscure() {
    _changeConfirmPasswordObscureState = _changeConfirmPasswordObscureState
        .copyWith(
          isObscurePassword:
              _changeConfirmPasswordObscureState.isObscureConfirm,
        );
    emit(_changeConfirmPasswordObscureState);
  }

  Future<void> _signUp() async {
    if (signupFormKey.currentState!.validate()) {
      emit(SignUpLoadingState());
      var result = await signupUseCase.invoke(
        request: SignupRequest(
          username: userNameController.text.trim(),
          firstName: firstNameController.text.trim(),
          lastName: lastNameController.text.trim(),
          email: emailController.text.trim(),
          password: passwordController.text,
          rePassword: rePasswordController.text,
          phone: phoneController.text.trim(),
        ),
      );
      switch (result) {
        case Success<UserDataEntity?>():
          emit(SignUpSuccessState());
          break;
        case Failure<UserDataEntity?>():
          emit(
            SignUpFailureState(
              errorData:
                  result.responseException ??
                  ResponseException(code: 0, message: result.errorMessage),
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
    userNameController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    rePasswordController.dispose();
    phoneController.dispose();
    return super.close();
  }
}
