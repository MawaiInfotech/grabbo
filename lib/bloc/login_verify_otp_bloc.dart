import 'package:flutter_bloc/flutter_bloc.dart';
import '../error/api_error.dart';
import '../services/login_service.dart';
import '../state/login_otp_state.dart';

class LoginVerifyOtpBloc extends Cubit<LoginOtpState>{
  LoginVerifyOtpBloc(this.loginService): super(LoginOtpState.initial());

  LoginService loginService;

  Future<void> loginOTP(String phone,String otp)async{
    try{
      emit(LoginOtpState.loading(state.loginOtpModel));
      final message = await loginService.verifyLoginOTP(phone, otp);
      emit(LoginOtpState.success(state.loginOtpModel, message));
    }on ApiError catch(error){
      emit(LoginOtpState.failed(state.loginOtpModel,  error.message));
    }
  }
}