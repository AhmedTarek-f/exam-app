import 'package:exam_app/api/client/api_result.dart';
import 'package:exam_app/domain/entities/home/subject_entity.dart';
import 'package:exam_app/domain/use_cases/home/get_all_subjects_use_case.dart';
import 'package:exam_app/presentation/home/presentation/views_model/home_intent.dart';
import 'package:exam_app/presentation/home/presentation/views_model/home_state.dart';
import 'package:exam_app/utils/exceptions/response_exception.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  final GetAllSubjectsUseCase _getAllSubjectsUseCase;
  HomeCubit(this._getAllSubjectsUseCase) : super(HomeInitial());

  Future<void> doIntent({required HomeIntent intent}) async {
    switch (intent) {
      case GetAllSubjectsIntent():
        _fetchSubjects();
        break;
    }
  }

  Future<void> _fetchSubjects() async {
    emit(FetchSubjectsLoadingState());
    final result = await _getAllSubjectsUseCase.invoke();
    switch (result) {
      case Success<List<SubjectEntity>>():
        {
          emit(FetchSubjectsSuccessState(subjects: result.data));
          break;
        }
      case Failure<List<SubjectEntity>>():
        {
          emit(
            FetchSubjectsFailureState(
              errorData:
                  result.responseException ??
                  ResponseException(code: 0, message: result.errorMessage),
            ),
          );
          break;
        }
    }
  }
}
