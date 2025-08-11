import 'package:exam_app/utils/exceptions/response_exception.dart';

sealed class EditProfileState {}

final class EditProfileInitial extends EditProfileState {}

final class EnableAutoValidateModeState extends EditProfileState {}

final class NavigateToChangePasswordState extends EditProfileState {}

final class EditProfileSuccessState extends EditProfileState {}

final class EditProfileLoadingState extends EditProfileState {}

final class EditProfileFailureState extends EditProfileState {
  EditProfileFailureState({required this.errorData});
  final ResponseException errorData;
}
