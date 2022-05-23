import 'package:knowmed_flutter/AppManager/alert_dialogue.dart';
import 'package:knowmed_flutter/AppManager/app_util.dart';
import 'package:knowmed_flutter/AppManager/user_data.dart';
import 'package:get/get.dart';
import 'dart:developer';
import 'package:knowmed_flutter/AppManager/progress_dialogue.dart';
import 'package:knowmed_flutter/Modal/questionListKnowledgeBank.dart';
import 'package:knowmed_flutter/Pages/KnowledgeBank/knowledgeBankDetail_view.dart';
import 'package:knowmed_flutter/Pages/KnowledgeBank/knowledgeBank_controller.dart';

class KnowledgeBankModal{
  KnowledgeBankController controller=Get.put(KnowledgeBankController());
  App app=App();
  UserData user=Get.put(UserData());
  getSubjectList(context) async{
    controller.updateShowNoData=false;
    // ProgressDialogue().show(context, loadingText: 'Please wait...');
    var body={
      'userId': user.getUserId.toString(),
      "subjectId":"0",
      "topicId":"0",
    };
    var data=await app.api('otGetAllSubjectList', body, context);
    // controller.updateShowNoData=true;
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
        controller.updateKnowledgeBankSubjectList(data['responseValue']);
        // app.replaceNavigate(context, const ForgetPwdview());
      }
    }
  }
  getSubjectWiseTopicList(context) async{
    controller.updateShowNoData=false;
    // ProgressDialogue().show(context, loadingText: 'Please wait...');
    var body={
      'userId': user.getUserId.toString(),
      "subjectId":"31",
    };
    var data=await app.api('otGetAllTopicListBySubjectId', body, context);
    // controller.updateShowNoData=true;
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
        controller.updateKnowledgeBankSubjectList(data['responseValue']);
        // app.replaceNavigate(context, const ForgetPwdview());
      }
    }
  }
  getQuestionList(context,  int subject, int topic) async{
    controller.updateShowNoData=false;
    // ProgressDialogue().show(context, loadingText: 'Please wait...');
    var body={
      'userId': user.getUserId.toString(),
      "subjectId":"0",
      "topicId":"0",
    };
    var data=await app.api('otGetQuestionList', body, context);
    // controller.updateShowNoData=true;
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
        controller.updateKnowledgeBankQuestionList(data['responseValue']);
      }
    }
  }
  onPressQuestion(context, ResponseValue1 que) async{
    app.navigate(context, KnowledgeBankDetailView(que));
  }
}