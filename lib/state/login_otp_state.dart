import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:grabbo/model/login_otp_model.dart';

part 'login_otp_state.freezed.dart';

@freezed
class LoginOtpState with _$LoginOtpState {
  const factory LoginOtpState.loading(LoginOtpModel loginOtpModel) = _Loading;
  const factory LoginOtpState.content(LoginOtpModel loginOtpModel) = _Content;
  const factory LoginOtpState.success(LoginOtpModel loginOtpModel, String? message) = _Success;
  const factory LoginOtpState.failed( LoginOtpModel loginOtpModel, String message) =
  _Failed;

  factory LoginOtpState.initial() => const LoginOtpState.content(LoginOtpModel());
}