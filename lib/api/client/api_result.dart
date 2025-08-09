import 'package:dio/dio.dart';
import 'package:exam_app/core/constants/app_text.dart';
import 'package:exam_app/utils/connection_manager/connection_manager.dart';
import 'package:exam_app/utils/exceptions/dio_exceptions.dart';
import 'package:exam_app/utils/exceptions/response_exception.dart';

sealed class Result<T> {}

class Success<T> extends Result<T> {
  final T data;

  Success(this.data);
}

class Failure<T> extends Result<T> {
  Failure({required this.errorMessage, this.responseException});
  final String errorMessage;
  final ResponseException? responseException;
}

Future<Result<T>> executeApi<T>(Future<T> Function() apiCall) async {
  try {
    final bool connection = await ConnectionManager.checkConnection();
    if (connection) {
      final data = await apiCall();
      return Success(data);
    } else {
      return Failure(
        errorMessage: AppText.connectionValidation,
        responseException: const ResponseException(
          message: AppText.connectionValidation,
          code: 0,
        ),
      );
    }
  } on DioException catch (error) {
    return Failure(
      errorMessage: DioExceptions.handleError(error).errorMessage,
      responseException: DioExceptions.handleError(error).responseException,
    );
  }
}
