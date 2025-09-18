import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              Image.asset(
                "assets/images/new-logo.png", // your logo asset
                height: 40,
              ),

              const SizedBox(height: 20),

              Image.asset(
                "assets/images/signup-img.png", // your illustration asset
                height: 220,
              ),

              const SizedBox(height: 25),

              // Full Name
              TextField(
                decoration: _inputDecoration("Full Name"),
              ),
              const SizedBox(height: 16),

              // Email
              TextField(
                decoration: _inputDecoration("Email"),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16),

              // Phone
              TextField(
                decoration: _inputDecoration("Phone"),
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 16),

              // Password
              TextField(
                obscureText: _obscurePassword,
                decoration: _inputDecoration(
                  "Password",
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscurePassword
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      color: Colors.black54,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Confirm Password
              TextField(
                obscureText: _obscureConfirmPassword,
                decoration: _inputDecoration(
                  "Confirm Password",
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscureConfirmPassword
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      color: Colors.black54,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureConfirmPassword = !_obscureConfirmPassword;
                      });
                    },
                  ),
                ),
              ),

              const SizedBox(height: 30),

              // Sign Up Button
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xffec7d18),

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SuccessPage()),
                    );
                  },
                  child: const Text(
                    "Sign Up",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,),
                  ),
                ),
              ),

              const SizedBox(height: 30),

              // Footer Text
              const Text(
                "© Mawai Infotech Ltd. Powered by Goerp.ai",
                style: TextStyle(fontSize: 12, color: Colors.black54),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  InputDecoration _inputDecoration(String hint, {Widget? suffixIcon}) {
    return InputDecoration(
      hintText: hint,
      hintStyle: const TextStyle(
        fontSize: 16,
        color: Colors.black87,
      ),
      filled: true,
      fillColor: Colors.white,
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: const BorderSide(color: Colors.grey), // grey border
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: const BorderSide(color: Colors.grey), // grey border
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: const BorderSide(color: Colors.grey, width: 1.5),
      ),
      suffixIcon: suffixIcon,
    );
  }

}

class SuccessPage extends StatelessWidget {
  const SuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Welcome")),
      body: const Center(
        child: Text(
          "Signup Successful!",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
