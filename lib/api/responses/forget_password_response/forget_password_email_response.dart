import 'package:json_annotation/json_annotation.dart';

part 'forget_password_email_response.g.dart';

@JsonSerializable()
class ForgetPasswordEmailResponse {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "info")
  final String? info;

  ForgetPasswordEmailResponse({this.message, this.info});

  factory ForgetPasswordEmailResponse.fromJson(Map<String, dynamic> json) {
    return _$ForgetPasswordEmailResponseFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ForgetPasswordEmailResponseToJson(this);
  }
}
