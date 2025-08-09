part of 'signup_cubit.dart';

abstract class SignUpState {}

class SignUpInitial extends SignUpState {}

class SignUpLoadingState extends SignUpState {}

class SignUpSuccessState extends SignUpState {}

final class EnableAutoValidateModeState extends SignUpState {
  EnableAutoValidateModeState({required this.autoValidateMode});
  final AutovalidateMode autoValidateMode;
}

final class ChangePasswordObscureState extends SignUpState {
  ChangePasswordObscureState({this.isObscure = true});
  bool isObscure;

  ChangePasswordObscureState copyWith({required bool isObscurePassword}) {
    isObscurePassword = !isObscurePassword;
    return ChangePasswordObscureState(isObscure: isObscurePassword);
  }
}

final class ChangeConfirmPasswordObscureState extends SignUpState {
  ChangeConfirmPasswordObscureState({this.isObscureConfirm = true});
  bool isObscureConfirm;

  ChangeConfirmPasswordObscureState copyWith({
    required bool isObscurePassword,
  }) {
    isObscurePassword = !isObscurePassword;
    return ChangeConfirmPasswordObscureState(
      isObscureConfirm: isObscurePassword,
    );
  }
}

class SignUpFailureState extends SignUpState {
  SignUpFailureState({required this.errorData});
  final ResponseException errorData;
}
