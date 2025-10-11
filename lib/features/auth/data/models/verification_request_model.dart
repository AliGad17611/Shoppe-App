import 'package:json_annotation/json_annotation.dart';

part 'verification_request_model.g.dart';

@JsonSerializable()
class VerificationRequestModel {
  final String email;
  final String otp;

  VerificationRequestModel({
    required this.email,
    required this.otp,
  });

  Map<String, dynamic> toJson() => _$VerificationRequestModelToJson(this);
}
