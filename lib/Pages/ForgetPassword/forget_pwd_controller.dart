import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class ForgetPwdController extends GetxController{
  Rx<TextEditingController> otp=TextEditingController().obs;
  Rx<TextEditingController> password=TextEditingController().obs;
  Rx<TextEditingController> confirmPassword=TextEditingController().obs;
  final formKey = GlobalKey<FormState>().obs;
}