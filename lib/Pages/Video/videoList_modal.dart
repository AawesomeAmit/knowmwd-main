
import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:knowmed_flutter/AppManager/alert_dialogue.dart';
import 'package:knowmed_flutter/AppManager/app_util.dart';
import 'package:knowmed_flutter/AppManager/progress_dialogue.dart';
import 'package:knowmed_flutter/AppManager/quizBankTopicDetails.dart';
import 'package:knowmed_flutter/AppManager/user_data.dart';
import 'package:knowmed_flutter/Modal/assignedQuizBankTopic.dart';
import 'package:knowmed_flutter/Modal/quizBankListModal.dart';
import 'package:knowmed_flutter/Pages/QuizBank/quizBankTopic_view.dart';
import 'package:knowmed_flutter/Pages/QuizBank/quizBankSubject_controller.dart';
import 'package:get/get.dart';
import 'package:knowmed_flutter/Pages/Video/videoList_controller.dart';

class VideoListModal {
  VideoListController controller = Get.put(VideoListController());
  App app = App();
  UserData user = UserData();
  // QuizBankTopicData quizBankTopicData=QuizBankTopicData();
  // QuizBankListModal quizBankList=QuizBankListModal();

  getVideoList(context) async{
    // controller.updateShowNoData=false;
    // ProgressDialogue().show(context, loadingText: 'Please wait...');
    var body={
      'userId': user.getUserId.toString(),
    };
    var data=await app.api('getAllVideoSubjectList', body, context);
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
        controller.updateVideoList(data);

        // app.replaceNavigate(context, const ForgetPwdview());
      }
    }
  }
  /*onPressSubject(context, int id){
    int index=controller.getTopicList.indexWhere((element) => element.subjectId==id);
    TopicList topicList=controller.getTopicList[index];
    // TopicDetails topicDetails=topicList.topicDetails.toString().replaceAll('\\', '');
    List topicDetailList=[];
    // List<TopicDetails> getTopicDetailList=List<TopicDetails>.from(
    //     topicDetailList.map((element) => TopicDetails.fromJson(element))
    // );

    // topicDetailList=topicList.topicDetails.toString().replaceAll('\\', '') as List;
    // List<TopicDetails> getTopicDetailLista=json.decode(topicList.topicDetails.toString().replaceAll('\\', '').toString()).map((data) => TopicDetails.fromJson(data)).toList();
    print(topicList.topicDetails.toString().replaceAll('\\', '').toString());
    // var dd=topicList.topicDetails;
    topicDetailList = jsonDecode(topicList.topicDetails!);
    print(topicDetailList[0]['id'].toString());
    // quizBankTopicData.addTopicAssigned(topicDetailList);
    app.navigate(context, const QuizBankTopicView());
  }*/
}
class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}