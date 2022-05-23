import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class ChangePwdController extends GetxController{
  Rx<TextEditingController> passwordOld=TextEditingController().obs;
  Rx<TextEditingController> passwordNew=TextEditingController().obs;
  final formKey = GlobalKey<FormState>().obs;
}