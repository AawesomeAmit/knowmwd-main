import 'dart:convert';
import 'dart:developer';

import 'package:knowmed_flutter/AppManager/alert_dialogue.dart';
import 'package:knowmed_flutter/AppManager/progress_dialogue.dart';

import '../../../../AppManager/app_util.dart';
import '../../../../AppManager/user_data.dart';
import '../controller/knowmed_controller.dart';
import '../../AppManager/raw_api.dart';
import 'package:get/get.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';


class KnowMed_Model {
  List x = [];
  List data_list = [];
  App app = App();
  UserData user = UserData();

  KnowMed_Controller controller = Get.put(KnowMed_Controller());

  getQuizData(context, String tid,String sid) async {
    controller.updateShowNoData = false;
    var body = {
      "remainingTime": "0",
      "subjectId": sid,
      "testType": "Quiz Bank",
      "topicId": tid,
      "userId": user.getUserId.toString(),
    };

    var data = await RawDataa().api(
      'Knowmed/otQuizBankOptionList',
      body,
      context,
    );
    controller.updateShowNoData = true;
    print('----------------------' + data.toString());
    if (data['responseCode'] == 1) {
      for (int i = 0; i < data['responseValue']['optionList'].length; i++) {
        var additionalData = {"isSelected": false};
        data_list =
            jsonDecode(data['responseValue']['optionList'][i]['optionDetails']);
        for (int j = 0; j < data_list.length; j++) {
          data_list[j].addAll(additionalData);
        }
        data['responseValue']['optionList'][i]['optionDetails'] =
            jsonEncode(data_list);
      }
      log('nnnnnnnnnmnnnnnn' + data.toString());
      controller.updateQuestionsData = data['responseValue'];
      // print("EXAM BOARD DATA: " + controller.examDashboardList.toString());
      controller.update();
    }
  }

  getOptionData(context) async {
    ProgressDialogue().show(context, loadingText: 'Analysing...');
    var body = {
      "optionId": controller.optionTap.toString(),
      "questionId": controller.questionId.toString(),
      "subjectId": "31",
      "testType": "Quiz Bank",
      "topicId": "61",
      "userId": "120"
    };

    var data = await RawDataa().api('Knowmed/otInsertExamPaper', body, context);
    ProgressDialogue().hide();
    if (data['responseCode'] == 1) {
      controller.updateExamDashboardList =
          data['responseValue']['examDashboardList'];
      log('nnnnnnnnnmnnnnnn---------------- SECOND API : ' + data.toString());
    }
  }

  getFeeback_KnowMedData(context) async {
    var body = {
      "subjectId": "31",
      "testType": "Quiz Bank",
      "topicId": "61",
      "userId": "120"
    };
    var data = await RawDataa().api('Knowmed/otStopExam', body, context);
    print("data: " + data.toString());
    controller.examId.value = data['responseValue'][0]['examId'].toString();
    print("exam id:  " + controller.examId.toString());
    // for(int i =65;i<=90;i++){
    //   print(String.fromCharCode(i));
    // }
  }

  getResultData(context) async {
    var body = {
      "examId": controller.examId.toString(),
      "rating": controller.ratingFeedback.toString(),
      "remark": controller.feedbackWritten.toString(),
      "remarkTitle": controller.feedbackOptionSelect.toString(),
      "testType": "Quiz Bank".toString(),
      "userId": "120".toString()
    };
    print("remark Title: " + controller.feedbackOptionSelect.toString());
    print("rating: " +controller.ratingFeedback.toString());
    var data =
        await RawDataa().api('Knowmed/otInsertQuizBankFeedback', body, context);
   controller.updateResultList = data['responseValue'];
   controller.correctWidth.value = controller.getResultsData[0].totalCorrectPercentage !* controller.multiple;
   controller.incorrectWidth.value = controller.getResultsData[0].totalIncorrectPercentage !* controller.multiple;
   controller.notVisitedWidth.value = controller.getResultsData[0].totalNotAnsweredPercentage !* controller.multiple;
    print("correct width: " + controller.correctWidth.toString() );
    print("incorrect width: " +controller.incorrectWidth.toString());
    print("not visited width: " + controller.notVisitedWidth.toString());
    // print("data: "+ data.toString());
  }

  onPressedOption(
    int currentIndex,
    int optionIndex,
  ) {
    print("current index: " + currentIndex.toString());
    print("option index: " + optionIndex.toString());
    List optionData =
        jsonDecode(controller.options_data[currentIndex]["optionDetails"]);
    optionData[optionIndex]['isSelected'] = true;
    print("-------------" + optionData[optionIndex].toString());
    controller.options_data[currentIndex]["optionDetails"] =
        jsonEncode(optionData);
    controller.update();
  }

  onOptionTap(context) async {
    await getOptionData(context);
    controller.update();
  }
}
