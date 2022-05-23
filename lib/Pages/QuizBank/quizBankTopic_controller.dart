import 'package:get/get.dart';
import 'package:knowmed_flutter/Modal/quizBankListModal.dart';

class QuizBankTopicController extends GetxController{

  RxBool showNoData=false.obs;
  bool get getShowNoData=>showNoData.value;
  set updateShowNoData(bool val){
    showNoData.value=val;
    update();
    }
/*  updateQuizBankList(Map data){
    topicDetailList=data['topicList']['topicDetails'];
    update();
  }*/
}