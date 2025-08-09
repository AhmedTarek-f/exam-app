import 'package:json_annotation/json_annotation.dart';

part 'email_verification_request.g.dart';

@JsonSerializable()
class EmailVerificationRequest {
  @JsonKey(name: "resetCode")
  final String? resetCode;

  EmailVerificationRequest({this.resetCode});

  factory EmailVerificationRequest.fromJson(Map<String, dynamic> json) {
    return _$EmailVerificationRequestFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$EmailVerificationRequestToJson(this);
  }
}
