import 'dart:convert';

import 'package:knowmed_flutter/AppManager/alert_dialogue.dart';
import 'package:knowmed_flutter/AppManager/app_util.dart';
import 'package:knowmed_flutter/AppManager/user_data.dart';
import 'package:get/get.dart';
import 'dart:developer';
import 'package:knowmed_flutter/AppManager/progress_dialogue.dart';
import 'package:knowmed_flutter/Modal/imageBankList.dart';
import 'package:knowmed_flutter/Modal/questionListKnowledgeBank.dart';
import 'package:knowmed_flutter/Pages/ImageBank/ImageBankDetail_view.dart';
import 'package:knowmed_flutter/Pages/KnowledgeBank/knowledgeBankDetail_view.dart';
import 'package:knowmed_flutter/Pages/KnowledgeBank/knowledgeBank_controller.dart';

import 'ImageBank_controller.dart';

class ImageBankModal{
  ImageBankController controller=Get.put(ImageBankController());
  App app=App();
  UserData user=Get.put(UserData());
  List topicDetailList=[];
  String correctImg='';
  String correctOpt='';
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
        controller.updateImageBankSubjectList(data['responseValue']);
        // app.replaceNavigate(context, const ForgetPwdview());
      }
    }
  }
  getSubjectWiseTopicList(context, String id) async{
    controller.updateShowNoData=false;
    // ProgressDialogue().show(context, loadingText: 'Please wait...');
    var body={
      'userId': user.getUserId.toString(),
      "subjectId":id,
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
        controller.updateImageBankTopicList(data['responseValue']);
        // app.replaceNavigate(context, const ForgetPwdview());
      }
    }
  }
  getQuestionList(context,  String subject, String topic) async{
    controller.updateShowNoData=false;
    // ProgressDialogue().show(context, loadingText: 'Please wait...');
    var body={
      'userId': user.getUserId.toString(),
      "subjectId":subject,
      "topicId":topic,
    };
    var data=await app.api('otGetImageQuestionList', body, context);
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
        controller.updateImageBankQuestionList(data['responseValue']);
      }
    }
  }
  onPressQuestion(context, ImageList que,) async{
    topicDetailList = jsonDecode(que.optionList!);
    print(topicDetailList[0]['optionName']);
    for(int i=0;i<topicDetailList.length;i++){
      if(topicDetailList[i]['isCorrect']) {
        correctImg=topicDetailList[i]['optionFilePath'];
        correctOpt=topicDetailList[i]['optionName'];
      }
    }
    app.navigate(context, ImageBankDetailView(que, topicDetailList, correctImg, correctOpt));
  }
}