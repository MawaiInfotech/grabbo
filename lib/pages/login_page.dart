import 'package:flutter/material.dart';
import 'package:grabbo/pages/home_page.dart';
import 'package:grabbo/pages/main_page.dart';
import 'package:grabbo/pages/signup_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String selectedCode = "+91";
  bool rememberMe = false;
  bool _obscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    //  backgroundColor: Colors.transparent,
      bottomNavigationBar: SafeArea(
        child: Container(
          color: Colors.transparent,
          height: 20,
          child:Center(child: Text("© 2025 Mawai Infotech PVT LTD. All rights reserved.",
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
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/images/shopping1.png", scale: 1),
                    SizedBox(height: 20,),
                    Image.asset("assets/images/new-logo.png",scale: 10, ),
                    const SizedBox(height: 10),
                    _buildLoginText(),
                    const SizedBox(height: 20),

                    // 📌 Phone Number Label
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 0, vertical: 5),
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
                      decoration: InputDecoration(
                        hintText: "Enter your phone number",
                        hintStyle: TextStyle(
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
                                  value: "+1",
                                  child: Text("+1"),
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
                        contentPadding: EdgeInsets.symmetric(horizontal: 10),
                      ),
                    ),

                    const SizedBox(height: 10),

                    // 📌 Password Label
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 0, vertical: 5),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Password",
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                    TextField(
                      obscureText: _obscure,
                      decoration: InputDecoration(
                        hintText: "***********",
                        hintStyle: const TextStyle(
                          color: Colors.grey,
                          fontSize: 19,
                          letterSpacing: 3,
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscure ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                            color: Colors.grey,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscure = !_obscure; // toggle state
                            });
                          },
                        ),
                        border: _border(),
                        enabledBorder: _border(),
                        focusedBorder: _border(),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                      ),
                    ),

                    const SizedBox(height: 15),

                    // 📌 Remember Me
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 0),
                      child: Row(
                        children: [
                          Checkbox(
                            value: rememberMe,
                            activeColor: Colors.orange,
                            onChanged: (val) {
                              setState(() {
                                rememberMe = val!;
                              });
                            },
                          ),
                          const Text("Remember Me"),
                        ],
                      ),
                    ),

                    const SizedBox(height: 0),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xffec7d18),
                        // padding: const EdgeInsets.symmetric(
                        //     horizontal: 100, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MainPage(),
                          ),
                        );
                      },
                      child: Center(
                        child: const Text(
                          "LOGIN",
                          style: TextStyle(color: Colors.white, fontSize: 17),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don't have an account? "),
                        TextButton(onPressed: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SignUpPage(),
                            ),
                          );
                        }, child: Text("Sign Up",
                        style: TextStyle(
                          color: Color(0xffec7d18),
                        ),))
                      ],
                    ),
                    SizedBox(height: 30,),
                    Text("By Continuing, You agree to our"),
                    Text("Terms and Conditions & Privacy Policy",
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
      ),
    );
  }

  _buildLoginText(){
    return const Text(
      "Enter your login information",
      style: TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.w500,
        color: Colors.black87,
      ),
    );
  }

  _border() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(40),
      borderSide: const BorderSide(color: Colors.grey),
    );
  }
}
