class AppLink {

  static const String server = "https://c822-185-80-143-10.ngrok-free.app/medicinetime/php";

//
  static const String test = "$server/test.php";

// ================================= Auth ========================== //

  static const String signUp = "$server/auth/signup.php";
  static const String login = "$server/auth/login.php";

  static const String verifycodessignup = "$server/auth/verfiycode.php";

// ================================= ForgetPassword ========================== //


  static const String checkEmail = "$server/forgetpassword/checkemail.php";
  static const String resetPassword = "$server/forgetpassword/resetpassword.php";
  static const String verifycodeforgetpassword = "$server/forgetpassword/verifycode.php";

  static const String homepage = "$server/home.php"  ;

  static const String addmedicine = "$server/medicine.php"  ;
  static const String medicineview = "$server/medicine/view.php"  ;
  static const String removemedicine = "$server/medicine/remove.php"  ;

  static const String resend = "$server/auth/resend.php";


  static const String addalarm = "$server/alarm/alarm.php"  ;

 // static const String removemedicine = "$server/medicine/remove.php"  ;

}
