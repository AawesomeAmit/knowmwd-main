
import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:knowmed_flutter/AppManager/alert_dialogue.dart';
import 'package:knowmed_flutter/AppManager/app_util.dart';
import 'package:knowmed_flutter/AppManager/progress_dialogue.dart';
import 'package:knowmed_flutter/AppManager/quizBankTopicDetails.dart';
import 'package:knowmed_flutter/AppManager/user_data.dart';
import 'package:knowmed_flutter/Modal/quizBankListModal.dart';
import 'package:knowmed_flutter/Pages/QuizBank/quizBankTopic_controller.dart';
import 'package:knowmed_flutter/Pages/QuizBank/quizBankSubject_controller.dart';
import 'package:get/get.dart';
import 'package:knowmed_flutter/Pages/QuizBank/quizView.dart';

import '../ABG Procedure Quiz Bank/view/knowmed_demo.dart';

class QuizBankTopicModal {
  QuizBankTopicController controller = Get.put(QuizBankTopicController());
  App app = App();
  UserData user = UserData();
  QuizBankTopicData topicData=QuizBankTopicData();
  // QuizBankListModal quizBankList=QuizBankListModal();

  onPressTopic(context, int tid,String sid){
    topicData.setSelectedTopicId(tid);
    app.navigate(context, knowMedDemo(tid.toString(), sid));
  }
}