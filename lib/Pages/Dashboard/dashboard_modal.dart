
import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:knowmed_flutter/AppManager/progress_dialogue.dart';
import 'package:knowmed_flutter/AppManager/alert_dialogue.dart';
import 'package:knowmed_flutter/AppManager/app_util.dart';
import 'package:knowmed_flutter/AppManager/user_data.dart';
import 'package:knowmed_flutter/Modal/DashboardModal.dart';
import 'package:knowmed_flutter/Pages/Bookmark/Bookmark_pageView.dart';
import 'package:knowmed_flutter/Pages/ChangePwd/change_pwd_view.dart';
import 'package:knowmed_flutter/Pages/Dashboard/Options/change_password_module.dart';
import 'package:knowmed_flutter/Pages/Dashboard/dashboard_controller.dart';
import 'package:knowmed_flutter/Pages/ImageBank/ImageBank_pageView.dart';
import 'package:knowmed_flutter/Pages/KnowledgeBank/knowledgeBank_pageView.dart';
import 'package:knowmed_flutter/Pages/LoginPage/login_page_view.dart';
import 'package:knowmed_flutter/Pages/MockTest/mockTestSubject_view.dart';
import 'package:knowmed_flutter/Pages/QuizBank/quizBankSubject_view.dart';
import 'package:knowmed_flutter/Pages/Result/result_view.dart';
import 'package:knowmed_flutter/Pages/Video/videoList_view.dart';
import 'package:knowmed_flutter/Pages/Video/videoPlayerScreen.dart';

import '../../AppManager/quizBankTopicDetails.dart';
import '../../Modal/quizBankListModal.dart';
import '../QuizBank/quizBankTopic_view.dart';

class DashboardModal {
  DashboardController controller = Get.put(DashboardController());
  App app = App();
  UserData user = UserData();
  QuizBankTopicData quizBankTopicData=QuizBankTopicData();
  void onPressOptions(context, int val) {
    if (val == 1) {
      // alertToast(context, 'Feature will available soon');
    } else if (val == 2) {
      // QuizBankSubjectModal mm = QuizBankSubjectModal();
      // mm.getQuizList(context);
      app.navigate(context, const QuizBankSubjectView());
    } else if (val == 3) {
      app.navigate(context, const MockTestSubjectView());
    } else if (val == 4) {
      // app.navigate(context, const MockTestSubjectView());
    } else if (val == 5) {
      app.navigate(context, const KnowledgeBankView());
    }  else if (val == 6) {
      app.navigate(context, const ImageBankView());
    } else if (val == 7) {
      app.navigate(context, const BookmarkView());
    } else if (val == 8) {
      app.navigate(context, const VideoListView());
    } else if (val == 9) {
      // app.navigate(context, const BookmarkView());
    } else if (val == 10) {
      app.navigate(context, const ResultView());
    } else if (val == 11) {
      // user.removeUserData();
      app.navigate(context, const ChangePwdView());
    } else if (val == 12) {
      user.removeUserData();
      app.replaceNavigate(context, const LoginPageView());
    }
    else {
      // alertToast(context, 'Feature will available soon');
    }
  }

  onLoad(context) async{
    // ProgressDialogue().show(context, loadingText: 'Please wait...');
    var body={
      'userId': user.getUserId.toString(),
    };

    var data=await app.api('prepDashboardNew', body, context);
    // controller.updateShowNoData=true;
    // log(data.toString());
    ProgressDialogue().hide();
    if(data['status']==0){
      alertToast(context,data['message']);
      // print(data['message']);
    }
    else{
      if(data['responseCode']==0){
        alertToast(context,data['responseMessage']);
      } else {
        // var a=jsonDecode(data['responseValue']);
        controller.updateDashboardList(data);
      }
    }
  }
  onPressVideo(context, String link, String title) async{
    log(link);
    Navigator.of(context).push(MaterialPageRoute(builder:(context)=>VideoPlayerScreen(link, title)));
    // app.navigate(context, VideoPlayerScreen(link, title));
  }
  onPressSubject(context, List<TopicDetail> topicDetails, String sId){

    List<TopicDetail> topicList = topicDetails;
    quizBankTopicData.addTopicAssigned(topicList);

    log(quizBankTopicData.getAssignedQuizBankTopic[0].topicName.toString());
    log(topicList.length.toString());
    app.navigate(context, QuizBankTopicView(sId));
  }
  changePassword(context, {oldPassword, newPassword, who}) async {
    var body = {
      'oldPassword': oldPassword.toString(),
      'newPassword': newPassword.toString(),
      'who': user.getUserId.toString(),
    };
    var data = await app.api('/Dashboard/ChangePassword', body, context);
    if (data['responseCode'] == 200) {

    }
    else {

    }
  }

  void onPressMockTest(BuildContext context, int) {

  }
}