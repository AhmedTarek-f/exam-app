import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:exam_app/core/constants/app_text.dart';
import 'package:exam_app/domain/use_cases/profile/logout_use_case.dart';
import 'package:exam_app/presentation/profile/views_model/profile_intent.dart';
import 'package:exam_app/presentation/profile/views_model/profile_state.dart';
import 'package:exam_app/utils/exam_method_helper.dart';
import 'package:exam_app/utils/exceptions/dio_exceptions.dart';
import 'package:exam_app/utils/exceptions/response_exception.dart';

@injectable
class ProfileCubit extends Cubit<ProfileState> {
  @factoryMethod
  ProfileCubit({required this.logoutUseCase}) : super(ProfileInitial());

  final LogoutUseCase logoutUseCase;
  late final TextEditingController userNameController;
  late final TextEditingController firstNameController;
  late final TextEditingController lastNameController;
  late final TextEditingController emailController;
  late final TextEditingController phoneController;
  late final TextEditingController passwordController;

  Future<void> doIntent({required ProfileIntent intent}) async {
    switch (intent) {
      case ProfileInitializeDataIntent():
        _onInit();
        break;
      case LogoutIntent():
        await _logout();
        break;
      case UpdateProfileDataIntent():
        _updateUserData();
        break;
    }
  }

  void _onInit() async {
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

  Future<void> _logout() async {
    try {
      emit(LogoutLoadingState());
      await logoutUseCase.invoke();
      emit(LogoutSuccessState());
    } catch (error) {
      if (error is DioExceptions) {
        emit(
          LogoutFailureState(
            errorData:
                error.responseException ??
                ResponseException(code: 0, message: error.errorMessage),
          ),
        );
      }
    }
  }

  void _updateUserData() {
    userNameController.text = ExamMethodHelper.userData?.username ?? "";
    firstNameController.text = ExamMethodHelper.userData?.firstName ?? "";
    lastNameController.text = ExamMethodHelper.userData?.lastName ?? "";
    emailController.text = ExamMethodHelper.userData?.email ?? "";
    phoneController.text = ExamMethodHelper.userData?.phone ?? "";
    emit(UpdatedProfileDataState());
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
