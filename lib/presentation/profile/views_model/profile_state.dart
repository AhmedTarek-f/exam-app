import 'package:exam_app/utils/exceptions/response_exception.dart';

sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class UpdatedProfileDataState extends ProfileState {}

final class NavigateToChangePasswordState extends ProfileState {}

final class LogoutSuccessState extends ProfileState {}

final class LogoutLoadingState extends ProfileState {}

final class LogoutFailureState extends ProfileState {
  LogoutFailureState({required this.errorData});
  final ResponseException errorData;
}
