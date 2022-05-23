
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';
import 'package:knowmed_flutter/Modal/DashboardModal.dart';
import 'package:knowmed_flutter/Modal/assignedQuizBankTopic.dart';



class QuizBankTopicData extends GetxController {
  final quizBankTopicData = GetStorage('quizBankTopic');
  String get getSelectedTopicId => (quizBankTopicData.read('topicId')) ?? '';
  Map<String, dynamic> get getUserData => quizBankTopicData.read('topicDetails') ?? {};
  List<AssignedQuizBankTopic> get getAssignedQuizBankTopic => (
      quizBankTopicData.read('topicDetails')==null?
          []:
      List<AssignedQuizBankTopic>.from(
          quizBankTopicData.read('topicDetails').map((element) => AssignedQuizBankTopic.fromJson((element)))
          // quizBankTopicData.read('topicDetails').map((element) => AssignedQuizBankTopic.fromJson((element as TopicDetail).toJson()))
      )
  );


  String get getTopicId => getUserData.isNotEmpty ? getUserData['id'].toString():'';
  String get getTopicName => getUserData.isNotEmpty ? getUserData['topicName'].toString():'';
  String get getImagePath => getUserData.isNotEmpty ? getUserData['imagePath'].toString():'';
  String get getNoOfQs => getUserData.isNotEmpty ? getUserData['noOfQs'].toString():'';
  // String get getUserImage => '';



/*


  addTopic(String val) async{
    await userData.write('topicDetails', val);
    update();
  }

  addUserData(Map val) async {
    await userData.write('topicDetails', val);
    update();
  }
*/

  setSelectedTopicId(int id) async{
    await quizBankTopicData.write('topicId', id);
    update();
  }
  addTopicAssigned(List val) async {
    await quizBankTopicData.write('topicDetails', val);
    update();
  }

  removeTopicData() async{
    await quizBankTopicData.remove('topicDetails');
  }


}




