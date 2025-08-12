import 'package:exam_app/api/client/api_result.dart';
import 'package:exam_app/domain/entities/subject_exams/subject_exam_entity.dart';
import 'package:exam_app/domain/use_cases/subject_exams/get_subject_exams_use_case.dart';
import 'package:exam_app/presentation/subject_exams/views_model/subject_exams_intent.dart';
import 'package:exam_app/presentation/subject_exams/views_model/subject_exams_state.dart';
import 'package:exam_app/utils/exceptions/response_exception.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class SubjectExamsCubit extends Cubit<SubjectExamsState> {
  SubjectExamsCubit(this._getSubjectExamsUseCase)
    : super(SubjectExamsInitial());
  final GetSubjectExamsUseCase _getSubjectExamsUseCase;
  Future<void> doIntent({required SubjectExamsIntent intent}) async {
    switch (intent) {
      case GetAllSubjectExamsIntent():
        _getAllSubjectExams(subjectId: intent.subjectId);
        break;
      case StartExamIntent():
        _startExam();
        break;
    }
  }

  Future<void> _getAllSubjectExams({required String subjectId}) async {
    emit(FetchSubjectExamsLoadingState());
    final result = await _getSubjectExamsUseCase.invoke(subjectId: subjectId);
    switch (result) {
      case Success<List<SubjectExamEntity>>():
        {
          emit(FetchSubjectExamsSuccessState(subjectExams: result.data));
          break;
        }
      case Failure<List<SubjectExamEntity>>():
        {
          emit(
            FetchSubjectExamsFailureState(
              errorData:
                  result.responseException ??
                  ResponseException(code: 0, message: result.errorMessage),
            ),
          );
          break;
        }
    }
  }

  void _startExam() {
    emit(StartExamState());
  }
}
