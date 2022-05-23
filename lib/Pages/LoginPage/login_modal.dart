
import 'dart:developer';

import 'package:dart_ipify/dart_ipify.dart';
import 'package:knowmed_flutter/AppManager/alert_dialogue.dart';
import 'package:knowmed_flutter/AppManager/progress_dialogue.dart';
import 'package:knowmed_flutter/AppManager/app_util.dart';
import 'package:knowmed_flutter/AppManager/user_data.dart';
import 'package:get/get.dart';
import 'package:knowmed_flutter/Pages/Dashboard/dashboard_view.dart';
import 'package:knowmed_flutter/Pages/ForgetPassword/forget_pwd_view.dart';
// import 'package:knowmed_flutter/Modal/assignedQuizBankTopic.dart';
// import 'package:knowmed_flutter/Pages/Dashboard/dashboard_view.dart';
import 'dart:convert';
import 'package:knowmed_flutter/Pages/LoginPage/login_controller.dart';
import 'package:knowmed_flutter/Pages/LoginPage/login_page_view.dart';

class LoginModal {
  
  
  
  App app=App();
  UserData user=Get.put(UserData());
  LoginController controller=Get.put(LoginController());

onPressForget(context) async{
  ProgressDialogue().show(context, loadingText: 'Please wait...');
  var body={
    'mobileOREmail': controller.mobileOREmail.value.text,
  };
  var data=await app.api('generateOTPForForgotPassword', body, context);
  log(data.toString());
  ProgressDialogue().hide();
  if(data['status']==0){
    alertToast( context,data['message']);
    // print(data['message']);
  }
  else{
    if(data['responseCode']==0){
      alertToast( context,data['responseMessage']);
    } else {
      await user.addUserData(data['responseValue'][0]);
      alertToast( context,data['responseMessage']);
      app.replaceNavigate(context, const ForgetPwdview());
    }
  }
}
  onPressLogin(context) async{
 //   app.navigate(context, const DashboardView(),);

    // if(controller.formKey.value.currentState!.validate()){
      await loginUser(context);
    // }

  }
  
  
  loginUser(context,) async{
    ProgressDialogue().show(context, loadingText: 'Logging In');
    var body={
      'userId': controller.userIdC.value.text.toString(),
      'password': controller.passwordC.value.text.toString(),
      'deviceTypeId': '1',
      'deviceId': '1',
      'appType': 'KD',
    };
    var data=await app.api('checkUserLogin', body, context);
    log(data.toString());
    ProgressDialogue().hide();
    if(data['status']==0){
      alertToast( context,data['message']);
      // print(data['message']);
    }
    else{
      if(data['responseCode']==200){
        await user.addUserData(data['responseValue'][0]);
        await user.addToken(data['responseValue'][0]['token']);
        app.replaceNavigate(context, const DashboardView(),
            routeName: '/DashboardView');
      } else {
        alertToast( context,data['responseMessage']);
      }
    }
  }
}