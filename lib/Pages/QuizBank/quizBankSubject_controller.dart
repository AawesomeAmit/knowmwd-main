import 'package:get/get.dart';
import 'package:knowmed_flutter/Modal/quizBankListModal.dart';

class QuizBankSubjectController extends GetxController{

  RxBool showNoData=false.obs;
  bool get getShowNoData=>showNoData.value;
  set updateShowNoData(bool val){
    showNoData.value=val;
    update();
    }

  List subjectList=[].obs;
  List<SubjectList> get getSubjectList=>List<SubjectList>.from(
      subjectList.map((element) => SubjectList.fromJson(element))
  );
  List topicList=[].obs;
  List<TopicList> get getTopicList=>List<TopicList>.from(
      topicList.map((element) => TopicList.fromJson(element))
  );
  // List topicDetailList=[].obs;

  updateQuizBankList(Map data){
    subjectList=data['subjectList'];
    topicList=data['topicList'];
    subjectList.isEmpty?updateShowNoData=true:updateShowNoData=false;
    // topicDetailList=data['topicList']['topicDetails'];
    update();
  }
}