import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_otp_model.g.dart';
part 'login_otp_model.freezed.dart';

@freezed
class LoginOtpModel with _$LoginOtpModel{
  const factory LoginOtpModel({
    @Default(false) bool status,
    @Default("") String message,
  }) = _LoginOtpModel;

  factory LoginOtpModel.fromJson(Map<String, dynamic> json) => _$LoginOtpModelFromJson(json);
}