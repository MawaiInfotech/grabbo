import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grabbo/bloc/login_verify_otp_bloc.dart';
import 'package:grabbo/pages/navigation_page.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

import '../routes/app_routes.dart';
import '../services/login_service.dart';
import '../state/login_otp_state.dart';
import '../utils/snackbar_utils.dart';

class OtpVerificationPage extends StatefulWidget {
  const OtpVerificationPage({super.key, required this.phone});

  final String phone;

  @override
  State<OtpVerificationPage> createState() => _OtpVerificationPageState();
}

class _OtpVerificationPageState extends State<OtpVerificationPage> {

  final TextEditingController _otpController = TextEditingController();

  late LoginService loginService;
  late LoginVerifyOtpBloc loginVerifyOtpBloc;



  @override
  void initState() {
    loginService = Provider.of<LoginService>(context, listen: false);
    loginVerifyOtpBloc = LoginVerifyOtpBloc(loginService);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/login_bg.jpg"),
            fit: BoxFit.fill,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Back button
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black.withOpacity(0.1),
                  ),
                  child: IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.arrow_back,size: 25,),

                  ),
                ),
                const SizedBox(height: 20),

                // Title
                const Center(
                  child: Text(
                    "Verification Code",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                 Center(
                  child: Text(
                    "We have sent the verification code on mobile number \n ${widget.phone}",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 15,
                      color: Colors.black54,
                      fontWeight: FontWeight.w500
                    ),
                  ),
                ),
                const SizedBox(height: 60),

                Center(
                  child: Pinput(
                    controller: _otpController,
                    length: 6,
                    defaultPinTheme: PinTheme(
                      width: 40,
                      height: 45,
                      textStyle: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.orange), // orange border initially
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    focusedPinTheme: PinTheme(
                      width: 40,
                      height: 45,
                      textStyle: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.deepOrange, width: 2), // highlight focus
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    submittedPinTheme: PinTheme(
                      width: 40,
                      height: 45,
                      textStyle: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey), // turn grey after filled
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    showCursor: true,
                    separatorBuilder: (index) => const SizedBox(width: 16),
                    onCompleted: (value) {
                      debugPrint("OTP Entered: $value");
                    },
                  ),
                ),

                const SizedBox(height: 40),

               buildSubmitContainer(),
                const SizedBox(height: 20),

                Center(
                  child: TextButton(
                    onPressed: () {
                      debugPrint("Resend OTP clicked");
                    },
                    child: const Text(
                      "Resend OTP",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                const Spacer(),

                const Column(
                  children: [
                    Text.rich(
                      TextSpan(
                        text: "By continuing, You agree to our ",
                        style: TextStyle(color: Colors.black54, fontSize: 13),
                        children: [
                          TextSpan(
                            text: "Terms of Services",
                            style: TextStyle(color: Colors.orange),
                          ),
                          TextSpan(text: " & "),
                          TextSpan(
                            text: "Privacy Policy",
                            style: TextStyle(color: Colors.orange),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 15),
                    Text(
                      "© Mawai Infotech Ltd. Powered by Goerp.ai",
                      style: TextStyle(color: Colors.black54, fontSize: 13),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildSubmitContainer() {
    print(_otpController.text);
    return BlocConsumer<LoginVerifyOtpBloc, LoginOtpState>(
        bloc: loginVerifyOtpBloc,
        listener: (_, state) {
          state.maybeWhen(
              success: (_, message) {
                SnackBarUtils.show(
                  context,
                  message: message ?? "Logged In successfully 🎉",
                  // isSuccess: false,
                );
                Navigator.push(context, MaterialPageRoute(builder: (context) =>  const NavigationPage()));
              },
              failed: (_, message) {
                SnackBarUtils.show(
                  context,
                  message: message ,
                   isSuccess: false,
                );
              },
              orElse: () {

              });
        },
        builder: (context, state) {
          return state.maybeWhen(loading: (_) {
            return const CircularProgressIndicator();
          }, orElse: () {
            return ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xffec7d18),
                padding: const EdgeInsets.symmetric(
                    vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
              ),
              onPressed: () {
                _submitOTP();
              },
              child: const Center(
                child: Text(
                  "Submit",
                  style: TextStyle(color: Colors.white, fontSize: 17),
                ),
              ),
            );
          });
        });
  }

  void _submitOTP() async {
    // print(pinController.text);

    await loginVerifyOtpBloc.loginOTP(_otpController.text);
  }

}

//