import 'package:json_annotation/json_annotation.dart';
import 'package:exam_app/domain/entities/login/user_data_entity.dart';

part 'splash_response.g.dart';

@JsonSerializable()
class SplashResponse {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "user")
  final User? user;

  SplashResponse({this.message, this.user});

  factory SplashResponse.fromJson(Map<String, dynamic> json) {
    return _$SplashResponseFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$SplashResponseToJson(this);
  }
}

@JsonSerializable()
class User {
  @JsonKey(name: "_id")
  final String? Id;
  @JsonKey(name: "username")
  final String? username;
  @JsonKey(name: "firstName")
  final String? firstName;
  @JsonKey(name: "lastName")
  final String? lastName;
  @JsonKey(name: "email")
  final String? email;
  @JsonKey(name: "phone")
  final String? phone;
  @JsonKey(name: "role")
  final String? role;
  @JsonKey(name: "isVerified")
  final bool? isVerified;
  @JsonKey(name: "createdAt")
  final String? createdAt;
  @JsonKey(name: "passwordChangedAt")
  final String? passwordChangedAt;

  User({
    this.Id,
    this.username,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.role,
    this.isVerified,
    this.createdAt,
    this.passwordChangedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return _$UserFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$UserToJson(this);
  }

  UserDataEntity toUserDataEntity() {
    return UserDataEntity(
      email: email,
      username: username,
      firstName: firstName,
      lastName: lastName,
      phone: phone,
    );
  }
}
