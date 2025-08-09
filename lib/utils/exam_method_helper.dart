import 'package:exam_app/domain/entities/login/user_data_entity.dart';

abstract class ExamMethodHelper {
  static UserDataEntity? userData;
  static String? currentUserToken;
}
