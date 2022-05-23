
import 'package:get/get.dart';
import 'package:knowmed_flutter/Modal/imageBankList.dart';
import 'package:knowmed_flutter/Modal/questionListKnowledgeBank.dart';
import 'package:knowmed_flutter/Modal/questionListKnowledgeBank.dart';
import 'package:knowmed_flutter/Modal/questionListKnowledgeBank.dart';
import 'package:knowmed_flutter/Modal/topicListKnowledgeBank.dart';
import 'package:knowmed_flutter/Modal/subjectListKnowledgeBank.dart';

class ImageBankController extends GetxController{

  RxBool showNoData=false.obs;
  bool get getShowNoData=>showNoData.value;
  set updateShowNoData(bool val){
    showNoData.value=val;
    update();
  }
  List imageList=[].obs;
  List subjectList=[].obs;
  List topicList=[].obs;
  List<ResponseValue3> get getSubjectList=>List<ResponseValue3>.from(
      subjectList.map((element) => ResponseValue3.fromJson(element))
  );
  List<ResponseValue2> get getTopicList=>List<ResponseValue2>.from(
      topicList.map((element) => ResponseValue2.fromJson(element))
  );
  List<ImageList> get getImageList=>List<ImageList>.from(
      imageList.map((element) => ImageList.fromJson(element))
  );
  updateImageBankSubjectList(List data){
    subjectList=data;
    update();
  }
  updateImageBankTopicList(List data){
    topicList=data;
    update();
  }
  updateImageBankQuestionList(List data){
    imageList=data;
    update();
  }
}