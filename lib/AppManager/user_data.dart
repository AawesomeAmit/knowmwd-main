
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';
import 'package:knowmed_flutter/Modal/assignedQuizBankTopic.dart';



class UserData extends GetxController {
  final userData = GetStorage('user');

  String get getUserToken => (userData.read('userToken')) ?? '';
  Map<String, dynamic> get getUserData => userData.read('userData') ?? {};
  /*List<AssignedHead> get getHeadAssigned => (
      userData.read('headAssigned')==null?
          []:
      List<AssignedHead>.from(
          userData.read('headAssigned').map((element) => AssignedHead.fromJson(element))
      )
  );*/


  String get getUserId => getUserData.isNotEmpty ? getUserData['id'].toString():'';
  String get getUserName => getUserData.isNotEmpty ? getUserData['firstName'].toString():'';
  String get getLastName => getUserData.isNotEmpty ? getUserData['lastName'].toString():'';
  String get getEmailId => getUserData.isNotEmpty ? getUserData['emailId'].toString():'';
  String get getMobileNo => getUserData.isNotEmpty ? getUserData['mobileNo'].toString():'';
  String get getCountry => getUserData.isNotEmpty ? getUserData['country'].toString():'';
  String get getZipCode => getUserData.isNotEmpty ? getUserData['zipCode'].toString():'';
  String get getAge => getUserData.isNotEmpty ? getUserData['age'].toString():'';
  String get getGender => getUserData.isNotEmpty ? getUserData['gender'].toString():'';
  String get getHeightInFeet => getUserData.isNotEmpty ? getUserData['heightInFeet'].toString():'';
  String get getHeightInInch => getUserData.isNotEmpty ? getUserData['heightInInch'].toString():'';
  String get getWeight => getUserData.isNotEmpty ? getUserData['weight'].toString():'';
  String get getPackageName => getUserData.isNotEmpty ? getUserData['packageName'].toString():'';
  String get getMobileOREmail => getUserData.isNotEmpty ? getUserData['mobileOREmail'].toString():'';
  String get getUserImage => '';





  addToken(String val) async{
    await userData.write('userToken', val);
    update();
  }

  addUserData(Map val) async {
    await userData.write('userData', val);
    update();
  }


  addHeadAssigned(List val) async {
    await userData.write('headAssigned', val);
    update();
  }

  removeUserData() async{
    await userData.remove('userData');
    await userData.remove('userToken');
    await userData.remove('headAssigned');
  }


}




