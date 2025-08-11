import 'package:exam_app/api/client/api_result.dart';
import 'package:exam_app/api/requests/edit_profile_request/edit_profile_request.dart';
import 'package:exam_app/core/constants/app_text.dart';
import 'package:exam_app/domain/use_cases/edit_profile/edit_profile_use_case.dart';
import 'package:exam_app/presentation/edit_profile/views_model/edit_profile_intent.dart';
import 'package:exam_app/presentation/edit_profile/views_model/edit_profile_state.dart';
import 'package:exam_app/utils/exam_method_helper.dart';
import 'package:exam_app/utils/exceptions/response_exception.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class EditProfileCubit extends Cubit<EditProfileState> {
  @factoryMethod
  EditProfileCubit(this._editProfileUseCase) : super(EditProfileInitial());

  final EditProfileUseCase _editProfileUseCase;
  late final TextEditingController userNameController;
  late final TextEditingController firstNameController;
  late final TextEditingController lastNameController;
  late final TextEditingController emailController;
  late final TextEditingController phoneController;
  late final TextEditingController passwordController;
  late final GlobalKey<FormState> editProfileFormKey;
  late AutovalidateMode autoValidateMode;

  Future<void> doIntent({required EditProfileIntent intent}) async {
    switch (intent) {
      case EditProfileInitializeDataIntent():
        _onInit();
        break;
      case UpdateProfileIntent():
        await _editProfile();
        break;
      case NavigateToChangePasswordIntent():
        _navigateToChangePassword();
        break;
    }
  }

  void _onInit() async {
    editProfileFormKey = GlobalKey<FormState>();
    autoValidateMode = AutovalidateMode.disabled;
    userNameController = TextEditingController();
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    emailController = TextEditingController();
    phoneController = TextEditingController();
    passwordController = TextEditingController();
    _initializeUserDataFields();
  }

  void _initializeUserDataFields() {
    userNameController.text = ExamMethodHelper.userData?.username ?? "";
    firstNameController.text = ExamMethodHelper.userData?.firstName ?? "";
    lastNameController.text = ExamMethodHelper.userData?.lastName ?? "";
    emailController.text = ExamMethodHelper.userData?.email ?? "";
    phoneController.text = ExamMethodHelper.userData?.phone ?? "";
    passwordController.text = AppText.passwordHint2;
  }

  Future<void> _editProfile() async {
    if (editProfileFormKey.currentState!.validate()) {
      emit(EditProfileLoadingState());
      var result = await _editProfileUseCase.invoke(
        request: EditProfileRequest(
          username: userNameController.text.trim(),
          firstName: firstNameController.text.trim(),
          lastName: lastNameController.text.trim(),
          phone: phoneController.text.trim(),
          email: emailController.text.trim(),
        ),
      );
      switch (result) {
        case Success<void>():
          emit(EditProfileSuccessState());
          break;
        case Failure<void>():
          emit(
            EditProfileFailureState(
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

  void _enableAutoValidateMode() {
    autoValidateMode = AutovalidateMode.always;
    emit(EnableAutoValidateModeState());
  }

  void _navigateToChangePassword() {
    emit(NavigateToChangePasswordState());
  }

  @override
  Future<void> close() {
    userNameController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
