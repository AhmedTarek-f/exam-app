import 'package:dio/dio.dart';
import 'package:exam_app/core/constants/app_text.dart';

class ResponseException {
  const ResponseException({required this.message, required this.code});

  final String message;
  final num code;

  static ResponseException empty() => const ResponseException(
    message: AppText.noResponseReceivedMessage,
    code: 0,
  );

  factory ResponseException.handleException({required Response? response}) {
    if (response != null && response.data is Map<String, dynamic>) {
      final data = response.data as Map<String, dynamic>;
      return ResponseException(
        message: data['message'] ?? AppText.anUnknownErrorOccurred,
        code: data['code'] ?? 0,
      );
    } else {
      return empty();
    }
  }
}
