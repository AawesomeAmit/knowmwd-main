
import 'dart:developer';

import 'package:get/get.dart';
import 'package:knowmed_flutter/AppManager/alert_dialogue.dart';
import 'package:knowmed_flutter/AppManager/app_util.dart';
import 'package:knowmed_flutter/AppManager/progress_dialogue.dart';
import 'package:knowmed_flutter/AppManager/user_data.dart';
import 'package:knowmed_flutter/Pages/ChangePwd/change_pwd_controller.dart';
import 'package:knowmed_flutter/Pages/Dashboard/dashboard_view.dart';
import 'package:knowmed_flutter/Pages/LoginPage/login_page_view.dart';

import 'forget_pwd_controller.dart';

class ForgetPwdModal{

  App app=App();
  UserData user=Get.put(UserData());
  ForgetPwdController controller=Get.put(ForgetPwdController());

  onBackPress(context,) async{
    app.replaceNavigate(context, const LoginPageView());
  }
  onForgetPwd(context,) async{
    ProgressDialogue().show(context, loadingText: 'Please wait...');
    var body={
      'mobileOREmail': user.getMobileOREmail,
      'otp': controller.otp.value.text,
      'password': controller.password.value.text,
      'confirmPassword': controller.confirmPassword.value.text,
    };
    var data=await app.api('updateNewPassword', body, context);
    log(data.toString());
    ProgressDialogue().hide();
    if(data['status']==0){
      alertToast( context,data['message']);
      // print(data['message']);
    }
    else{
      if(data['responseCode']==200){
        alertToast( context,'Password Changed Successfully!');
        app.replaceNavigate(context, const LoginPageView());
      } else {
        alertToast( context,data['responseMessage']);
      }
    }
  }
}