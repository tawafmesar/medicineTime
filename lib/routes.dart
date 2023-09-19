import 'package:medicinetime/view/screen/auth/checkemail.dart';
import 'package:medicinetime/view/screen/auth/forgetpassword/forgetpassword.dart';
import 'package:medicinetime/view/screen/auth/forgetpassword/resetpassword.dart';
import 'package:medicinetime/view/screen/auth/forgetpassword/success_resetpassword.dart';
import 'package:medicinetime/view/screen/auth/forgetpassword/verifycode.dart';
import 'package:medicinetime/view/screen/auth/login.dart';
import 'package:flutter/material.dart';
import 'package:medicinetime/view/screen/auth/signup.dart';
import 'package:medicinetime/view/screen/auth/success_signup.dart';

import 'core/constant/routes.dart';

Map<String, Widget Function(BuildContext)> routes = {
  AppRoute.login: (context) => const Login(),
  AppRoute.signUp: (context) => const SignUp(),
  AppRoute.login: (context) => const Login(),
  AppRoute.signUp: (context) => const SignUp(),
  AppRoute.forgetPassword: (context) => const ForgetPassword(),
  AppRoute.verfiyCode: (context) => const VerfiyCode(),
  AppRoute.resetPassword: (context) => const ResetPassword(),
  AppRoute.checkemail: (context) => const CheckEmail(),
  AppRoute.successResetpassword: (context) => const SuccessResetPassword(),
  AppRoute.successSignUp: (context) => const SuccessSignUp(),
};