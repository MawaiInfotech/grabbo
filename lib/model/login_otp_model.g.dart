// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_otp_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LoginOtpModelImpl _$$LoginOtpModelImplFromJson(Map<String, dynamic> json) =>
    _$LoginOtpModelImpl(
      status: json['status'] as bool? ?? false,
      user_id: json['user_id'] as String? ?? "",
      message: json['message'] as String? ?? "",
    );

Map<String, dynamic> _$$LoginOtpModelImplToJson(_$LoginOtpModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'user_id': instance.user_id,
      'message': instance.message,
    };
