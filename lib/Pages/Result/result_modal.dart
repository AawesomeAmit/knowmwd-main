import 'dart:convert';
import 'dart:developer';

import 'package:knowmed_flutter/AppManager/app_util.dart';
import 'package:knowmed_flutter/AppManager/user_data.dart';
import 'package:knowmed_flutter/Pages/Result/result_controller.dart';

import '../ABG Procedure Quiz Bank/AppManager/raw_api.dart';

class ResultModal {
  ResultController controller = ResultController();
  UserData user = UserData();
  App app = App();

  getResultData(context) async {
    controller.updateShowNoData = false;
    var body = {
      "userId": user.getUserId.toString(),
    };

    var data = await app.api('otUserStatistics', body, context,);
    controller.updateShowNoData = true;
    controller.updateResultData=data;
    // print(data.toString());

    // log(data.toString());
    controller.update();
  }
}