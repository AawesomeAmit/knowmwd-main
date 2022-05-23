

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class LoginController extends GetxController{


  Rx<TextEditingController> userIdC=TextEditingController().obs;
  Rx<TextEditingController> passwordC=TextEditingController().obs;
  Rx<TextEditingController> mobileOREmail=TextEditingController().obs;


}