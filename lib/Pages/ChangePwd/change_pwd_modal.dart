import 'dart:convert';
import 'dart:developer';

import 'package:knowmed_flutter/AppManager/alert_dialogue.dart';
import 'package:knowmed_flutter/AppManager/app_util.dart';
import 'package:knowmed_flutter/AppManager/progress_dialogue.dart';
import 'package:knowmed_flutter/AppManager/user_data.dart';
import 'package:get/get.dart';
import 'package:knowmed_flutter/Pages/ChangePwd/change_pwd_controller.dart';
import 'package:knowmed_flutter/Pages/Dashboard/dashboard_view.dart';

class ChangePwdModal{

  App app=App();
  UserData user=Get.put(UserData());
  ChangePwdController controller=Get.put(ChangePwdController());

  changePwd(context,) async{
    ProgressDialogue().show(context, loadingText: 'Please wait...');
    var body={
      'userId': user.getUserId,
      'oldPassword': controller.passwordOld.value.text,
      'newPassword': controller.passwordNew.value.text,
    };
    var data=await app.api('changePassword', body, context);
    log(data.toString());
    ProgressDialogue().hide();
    if(data['status']==0){
      alertToast( context,data['message']);
      // print(data['message']);
    }
    else{
      if(data['responseCode']==200){
        alertToast( context,'Password Changed Successfully!');
        app.replaceNavigate(context, const DashboardView(),
            routeName: '/DashboardView');
      } else {
        alertToast( context,data['responseMessage']);
      }
    }
  }

  onBackPress(context,) async{
    app.replaceNavigate(context, const DashboardView());
  }
}