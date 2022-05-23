import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:knowmed_flutter/AppManager/app_color.dart';
import 'package:knowmed_flutter/AppManager/my_text_theme.dart';
import 'package:knowmed_flutter/AppManager/widgets/my_button.dart';
import 'package:knowmed_flutter/AppManager/widgets/my_text_field_2.dart';
import 'package:knowmed_flutter/Pages/ChangePwd/change_pwd_controller.dart';
import 'package:knowmed_flutter/Pages/Profile/profile_controller.dart';
import 'package:knowmed_flutter/Pages/ChangePwd/change_pwd_modal.dart';
import 'package:knowmed_flutter/Services/tab_responsive.dart';

class ChangePwdView extends StatefulWidget{
  const ChangePwdView({Key? key}) : super(key: key);

  @override
  _ChangePwdViewState createState() => _ChangePwdViewState();
}

class _ChangePwdViewState extends State<ChangePwdView> {
  ChangePwdModal modal=ChangePwdModal();

  @override
  void dispose() {
    Get.delete<ChangePwdController>();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.white,
      child: SafeArea(
        child: Stack(
          children: [
            Scaffold(
              backgroundColor: Colors.transparent,
              body: Center(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      TabResponsive().wrapInTab(context: context,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: AppColor.white,
                                borderRadius: const BorderRadius.all(Radius.circular(10)),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Container(
                                  alignment: Alignment.center,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const SizedBox(
                                          height: 100,
                                          child: Image(image: AssetImage('assets/logo.png'),)),

                                      const SizedBox(height: 40,),
                                      Text('Change Password',
                                        textAlign: TextAlign.start,
                                        style: MyTextTheme().smallPCB,),
                                      const SizedBox(height: 10,),
                                      MyTextField2(
                                        controller: modal.controller.passwordOld.value,
                                        hintText: 'Enter Old Password',
                                        // keyboardType: TextInputType.number,

                                        validator: (value){
                                          if(value!.isEmpty)
                                          {
                                            return 'Old password must not be empty';
                                          }
                                          else{
                                            return null;
                                          }
                                        },

                                      ),
                                      const SizedBox(height: 15,),
                                      MyTextField2(
                                        controller: modal.controller.passwordNew.value,
                                        hintText: 'Enter New Password',

                                        validator: (value){
                                          if(value!.isEmpty)
                                          {
                                            return 'New password must not be empty';
                                          }
                                          else{
                                            return null;
                                          }
                                        },

                                      ),
                                      const SizedBox(height: 20,),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          MyButton(
                                            width: 130,
                                            title: 'Cancel',
                                            color: Colors.grey,
                                            onPress: (){
                                              modal.onBackPress(context);
                                            },
                                          ),
                                          MyButton(
                                            width: 130,
                                            title: 'Submit',
                                            color: Colors.blue,
                                            onPress: (){
                                              modal.changePwd(context);
                                            },
                                          ),
                                        ],
                                      ),

                                      const SizedBox(height: 40,),
                                      Text('We Provide',
                                        textAlign: TextAlign.start,
                                        style: MyTextTheme().largePCB,),
                                      Text('Health & Medical',
                                        textAlign: TextAlign.start,
                                        style: MyTextTheme().largePCB,),
                                      Text('Services',
                                        textAlign: TextAlign.start,
                                        style: MyTextTheme().largePCB,),
                                      Text('for you.',
                                        textAlign: TextAlign.start,
                                        style: MyTextTheme().largePCB,),
                                      const SizedBox(height: 20,),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                      ))
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

}