import 'package:json_annotation/json_annotation.dart';

part 'resend_code_request_model.g.dart';

@JsonSerializable()
class ResendCodeRequestModel {
  final String email;

  ResendCodeRequestModel({required this.email,});

  Map<String, dynamic> toJson() => _$ResendCodeRequestModelToJson(this);
}
