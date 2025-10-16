import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grabbo/bloc/login_otp_bloc.dart';
import 'package:grabbo/pages/otp_verification_page.dart';
import 'package:grabbo/utils/snackbar_utils.dart';
import 'package:provider/provider.dart';

import '../routes/app_routes.dart';
import '../services/login_service.dart';
import '../state/login_otp_state.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String selectedCode = "+233";
  bool rememberMe = false;

  late LoginService loginService;
  late LoginOtpBloc loginOtpBloc;
  TextEditingController phoneController = TextEditingController();


  @override
  void initState() {
    loginService = Provider.of<LoginService>(context, listen: false);
    loginOtpBloc = LoginOtpBloc(loginService);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
    //  backgroundColor: Colors.transparent,
      bottomNavigationBar: SafeArea(
        child: Container(
          color: Colors.transparent,
          height: 20,
          child:const Center(child: Text("© 2025 Mawai Infotech PVT LTD. Powered by Goerp.ai.",
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: Colors.grey
          ),
          ))
        ),
      ),
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
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                          onPressed: (){
                            Navigator.pushNamed(context, AppRoutes.navigationPage);

                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black.withOpacity(0.2),
                            elevation: 0,
                            padding: const EdgeInsets.symmetric(
                                vertical: 0, horizontal: 10),
                            minimumSize: const Size(60, 30),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),

                          ),
                          child: const Text("Skip >",style: TextStyle(color: Colors.black))
                      )
                    ],
                  ),
                  Image.asset("assets/images/shopping1.png", scale: 1),
                  const SizedBox(height: 20,),
                  Image.asset("assets/images/new-logo.png",scale: 10, ),

                  const SizedBox(height: 50),

                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Phone Number",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  TextField(
                    keyboardType: TextInputType.phone,
                    controller: phoneController,
                    decoration: InputDecoration(
                      hintText: "Enter your phone number",
                      hintStyle: const TextStyle(
                        color: Colors.grey
                      ),
                      prefixIcon: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: selectedCode,

                            items: const [
                              DropdownMenuItem(
                                value: "+91",
                                child: Text("+91"),
                              ),
                              DropdownMenuItem(
                                value: "+233",
                                child: Text("+233"),
                              ),
                              DropdownMenuItem(
                                value: "+44",
                                child: Text("+44"),
                              ),
                            ],
                            onChanged: (value) {
                              setState(() {
                                selectedCode = value!;
                              });
                            },
                          ),
                        ),
                      ),
                      border: _border(),
                      enabledBorder: _border(),
                      focusedBorder: _border(),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                    ),
                  ),

                  const SizedBox(height: 30),

                  // 📌 Password Label
                  // const Padding(
                  //   padding: EdgeInsets.symmetric(horizontal: 0, vertical: 5),
                  //   child: Align(
                  //     alignment: Alignment.centerLeft,
                  //     child: Text(
                  //       "Password",
                  //       style: TextStyle(fontWeight: FontWeight.w600),
                  //     ),
                  //   ),
                  // ),
                  // TextField(
                  //   obscureText: _obscure,
                  //   decoration: InputDecoration(
                  //     hintText: "***********",
                  //     hintStyle: const TextStyle(
                  //       color: Colors.grey,
                  //       fontSize: 19,
                  //       letterSpacing: 3,
                  //     ),
                  //     suffixIcon: IconButton(
                  //       icon: Icon(
                  //         _obscure ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                  //         color: Colors.grey,
                  //       ),
                  //       onPressed: () {
                  //         setState(() {
                  //           _obscure = !_obscure; // toggle state
                  //         });
                  //       },
                  //     ),
                  //     border: _border(),
                  //     enabledBorder: _border(),
                  //     focusedBorder: _border(),
                  //     filled: true,
                  //     fillColor: Colors.white,
                  //     contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                  //   ),
                  // ),
                  //
                  // const SizedBox(height: 15),

                  // 📌 Remember Me
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(horizontal: 0),
                  //   child: Row(
                  //     children: [
                  //       Checkbox(
                  //         value: rememberMe,
                  //         activeColor: Colors.orange,
                  //         onChanged: (val) {
                  //           setState(() {
                  //             rememberMe = val!;
                  //           });
                  //         },
                  //       ),
                  //       const Text("Remember Me"),
                  //     ],
                  //   ),
                  // ),
                  //
                  // const SizedBox(height: 0),
                 buildSubmitContainer(),

                  SizedBox(height: MediaQuery.of(context).size.height*0.2),
                  const Text("By Continuing, You agree to our"),
                  const Text("Terms and Conditions & Privacy Policy",
                  style: TextStyle(
                    color: Color(0xffec7d18),
                  fontWeight: FontWeight.w500
                  //  decoration: TextDecoration.underline,
                  ),),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildSubmitContainer() {
    return BlocConsumer<LoginOtpBloc, LoginOtpState>(
        bloc: loginOtpBloc,
        listener: (_, state) {
          state.maybeWhen(
              success: (_, message) {
                SnackBarUtils.show(
                  context,
                  message: message ?? "OTP sent successfully 🎉",
                 // isSuccess: false,
                );
                Navigator.push(context, MaterialPageRoute(builder: (context) =>  OtpVerificationPage(phone: phoneController.text)));
              },
              failed: (_, message) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
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
                  "SEND OTP",
                  style: TextStyle(color: Colors.white, fontSize: 17),
                ),
              ),
            );
          });
        });
  }

  void _submitOTP() async {
    // print(pinController.text);

    await loginOtpBloc.loginOTP(phoneController.text);
  }

  _border() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(40),
      borderSide: const BorderSide(color: Colors.grey),
    );
  }



}
