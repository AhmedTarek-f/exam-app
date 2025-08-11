import 'package:equatable/equatable.dart';
import 'package:exam_app/domain/entities/home/subject_entity.dart';
import 'package:exam_app/utils/exceptions/response_exception.dart';

sealed class HomeState extends Equatable {}

final class HomeInitial extends HomeState {
  @override
  List<Object?> get props => [];
}

final class FetchSubjectsSuccessState extends HomeState {
  FetchSubjectsSuccessState({required this.subjects});
  final List<SubjectEntity> subjects;

  @override
  List<Object?> get props => [subjects];
}

final class FetchSubjectsLoadingState extends HomeState {
  @override
  List<Object?> get props => [];
}

final class FetchSubjectsFailureState extends HomeState {
  FetchSubjectsFailureState({required this.errorData});
  final ResponseException errorData;

  @override
  List<Object?> get props => [];
}
