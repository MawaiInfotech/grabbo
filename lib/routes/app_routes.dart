import 'package:flutter/cupertino.dart';
import 'package:grabbo/pages/home_page.dart';
import 'package:grabbo/pages/product_detail_page.dart';

import '../pages/login_page.dart';
import '../pages/navigation_page.dart';
import '../pages/otp_verification_page.dart';
import '../pages/signup_page.dart';


class AppRoutes {
  static const loginPage = '/login_page';
  static const signUpPage = '/signUpPage';
  static const otpVerificationPage = '/otpVerificationPage';
  static const navigationPage = '/navigationPage';
  static const homePage = '/homePage';
  static const productDetailPage = '/productDetailPage';


  static Map<String, Widget Function(BuildContext)> getRoutes(BuildContext _) {
    return <String, Widget Function(BuildContext)>{
      loginPage: (_) => const LoginPage(),
      signUpPage: (_) => const SignUpPage(),
      otpVerificationPage: (_) => const OtpVerificationPage(),
      navigationPage: (_) => const NavigationPage(),
      homePage: (_) => const HomePage(),
      productDetailPage: (_) => const ProductDetailsPage(),

    };
  }
}
