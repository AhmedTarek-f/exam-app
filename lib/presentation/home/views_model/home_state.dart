import 'package:equatable/equatable.dart';
import 'package:exam_app/domain/entities/home/subject_entity.dart';
import 'package:exam_app/utils/exceptions/response_exception.dart';

sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class FetchSubjectsSuccessState extends HomeState with EquatableMixin {
  FetchSubjectsSuccessState({required this.subjects});
  final List<SubjectEntity> subjects;

  @override
  List<Object?> get props => [subjects];
}

final class FetchSubjectsLoadingState extends HomeState {}

final class FetchSubjectsFailureState extends HomeState {
  FetchSubjectsFailureState({required this.errorData});
  final ResponseException errorData;
}

final class NavigateToSubjectExamsState extends HomeState {
  NavigateToSubjectExamsState({required this.subjectData});
  final SubjectEntity subjectData;
}
