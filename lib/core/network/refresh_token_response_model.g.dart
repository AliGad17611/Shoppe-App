// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'refresh_token_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RefreshTokenResponseModel _$RefreshTokenResponseModelFromJson(
  Map<String, dynamic> json,
) => RefreshTokenResponseModel(
  accessToken: json['accessToken'] as String,
  refreshToken: json['refreshToken'] as String,
);

Map<String, dynamic> _$RefreshTokenResponseModelToJson(
  RefreshTokenResponseModel instance,
) => <String, dynamic>{
  'accessToken': instance.accessToken,
  'refreshToken': instance.refreshToken,
};
