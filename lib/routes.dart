import 'package:medicinetime/view/screen/alarm/addalarm.dart';
import 'package:medicinetime/view/screen/alarm/alarm.dart';
import 'package:medicinetime/view/screen/auth/forgetpassword/forgetpassword.dart';
import 'package:medicinetime/view/screen/auth/forgetpassword/resetpassword.dart';
import 'package:medicinetime/view/screen/auth/forgetpassword/success_resetpassword.dart';
import 'package:medicinetime/view/screen/auth/forgetpassword/verifycode.dart';
import 'package:medicinetime/view/screen/auth/login.dart';
import 'package:medicinetime/view/screen/auth/signup.dart';
import 'package:medicinetime/view/screen/auth/success_signup.dart';
import 'package:medicinetime/view/screen/auth/verifycodesignup.dart';
import 'package:medicinetime/view/screen/dailydosage.dart';
import 'package:medicinetime/view/screen/homescreen.dart';
import 'package:medicinetime/view/screen/medicine/addmedicine.dart';
import 'view/screen/language.dart';

import 'core/constant/routes.dart';

import 'package:get/get.dart';

import 'core/middleware/mymiddleware.dart';


List<GetPage<dynamic>>? routes = [
  GetPage(name: "/", page: () => const Language() , middlewares: [
    MyMiddleWare()
  ]),
  GetPage(name: AppRoute.login, page: () => const Login()),
  GetPage(name: AppRoute.signUp, page: () => const SignUp()),
  GetPage(name: AppRoute.forgetPassword, page: () => const ForgetPassword()),
  GetPage(name: AppRoute.verfiyCode, page: () => const VerfiyCode()),
  GetPage(name: AppRoute.resetPassword, page: () => const ResetPassword()),
  GetPage(name: AppRoute.successResetpassword, page: () => const SuccessResetPassword()),
  GetPage(name: AppRoute.successSignUp, page: () => const SuccessSignUp()),
  GetPage(name: AppRoute.verfiyCodeSignUp, page: () => const VerfiyCodeSignUp()),

// GetPage(name: AppRoute.homepage , page: () => const HomePage()),

  GetPage(name: AppRoute.addmedicine , page: () => const AddMedicine()),
  GetPage(name: AppRoute.homepage, page: () => const HomeScreen()),

  GetPage(name: AppRoute.alarmpage, page: () => const AlarmPage()),


  GetPage(name: AppRoute.addalarmpage, page: () => const AddAlarm()),
  GetPage(name: AppRoute.dailydosage, page: () => const DailyDosagePage()),


];