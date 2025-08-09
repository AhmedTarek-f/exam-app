import 'package:json_annotation/json_annotation.dart';
import 'package:exam_app/api/models/user_model/user_model.dart';

part 'edit_profile_response.g.dart';

@JsonSerializable()
class EditProfileResponse {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "user")
  final UserModel? user;

  EditProfileResponse({this.message, this.user});

  factory EditProfileResponse.fromJson(Map<String, dynamic> json) {
    return _$EditProfileResponseFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$EditProfileResponseToJson(this);
  }
}
