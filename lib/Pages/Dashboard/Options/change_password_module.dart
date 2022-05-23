

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:knowmed_flutter/AppManager/alert_dialogue.dart';
import 'package:knowmed_flutter/AppManager/app_color.dart';
import 'package:knowmed_flutter/AppManager/my_text_theme.dart';
import 'package:knowmed_flutter/AppManager/widgets/my_button.dart';
import 'package:knowmed_flutter/AppManager/widgets/my_text_field.dart';
import 'package:knowmed_flutter/AppManager/widgets/my_text_field_2.dart';
import 'package:knowmed_flutter/Pages/Dashboard/dashboard_controller.dart';
import 'package:knowmed_flutter/Pages/Dashboard/dashboard_modal.dart';

final _formKey = GlobalKey<FormState>();
TextEditingController oldPasswordC=TextEditingController();
TextEditingController newPasswordC=TextEditingController();
TextEditingController confirmPasswordC=TextEditingController();
DashboardModal modal=DashboardModal();


void showChangePassword(context){




  // AlertDialogue2().show(context, 'alert', 'msg',);
   showGeneralDialog(
      barrierColor: Colors.black.withOpacity(0.5),
      transitionBuilder: (context, a1, a2, widget) {
        return StatefulBuilder(
            builder: (context,setState)
            {
              return Transform.scale(
                scale: a1.value,
                child: Opacity(
                  opacity: a1.value,
                  child: Scaffold(
                    backgroundColor: Colors.transparent,
                    body: Container(
                      height: double.infinity,
                      width: double.infinity,
                      alignment: Alignment.center,
                      child: ListView(
                        shrinkWrap: true,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(40,0,40,0),
                            child: Container(
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(Radius.circular(10))
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                      decoration: BoxDecoration(
                                          color: AppColor.primaryColor,
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            topRight: Radius.circular(10),
                                          )
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(8,0,8,0),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: Text('Change Password',
                                                style: MyTextTheme().mediumWCB,),
                                            ),
                                            IconButton(
                                                splashRadius: 5,
                                                icon: const Icon(Icons.clear,
                                                  color: Colors.white,
                                                  size: 20,),
                                                onPressed: (){
                                                  Navigator.pop(context);
                                                })
                                          ],
                                        ),
                                      )),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Form(
                                      key: _formKey,
                                      autovalidateMode: AutovalidateMode.onUserInteraction,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          const SizedBox(height: 15,),
                                          MyTextField2(
                                            controller: oldPasswordC,
                                            validator: (value){
                                              if(value!.isEmpty)
                                              {
                                                return  'Old Password must not be empty.';
                                              }
                                              else{
                                                return null;
                                              }
                                            },
                                            hintText: 'Enter Old Password',
                                            isPasswordField: true,
                                          ),
                                          const SizedBox(height: 5,),
                                          MyTextField2(
                                            controller: newPasswordC,
                                            validator: (value){
                                              if(value!.isEmpty)
                                              {
                                                return  'Password must not be empty.';
                                              }
                                              else{
                                                return null;
                                              }
                                            },
                                            hintText: 'Enter New Password',
                                            isPasswordField: true,
                                          ),
                                          const SizedBox(height: 5,),
                                          MyTextField2(
                                            controller: confirmPasswordC,
                                            validator: (value){
                                              if(value!.isEmpty)
                                              {
                                                return  'Confirm Password must not be empty.';
                                              }
                                              else if(value.toString()!=newPasswordC.text){
                                                return 'Password does not match.';
                                              }
                                              else{
                                                return null;
                                              }
                                            },
                                            hintText: 'Confirm Password',
                                            isPasswordField: true,
                                          ),
                                          const SizedBox(height: 15,),
                                         MyButton(title: 'Change Password',onPress: (){
                                           onPressedChangePassword(context, setState);
                                         },),
                                          const SizedBox(height: 7,),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            });
      },
      transitionDuration: const Duration(milliseconds: 200),
      barrierDismissible: true,
      barrierLabel: '',
      context: context,
      pageBuilder: (context, animation1, animation2) {
        return Container();
      });
}






onPressedChangePassword(context,setState){
  FocusScope.of(context).unfocus();

  if(_formKey.currentState!.validate())
  {
    onPressedConfirm() async {
      Navigator.pop(context);

      await modal.changePassword(context,oldPassword:oldPasswordC.text,newPassword: newPasswordC.text );
      Navigator.pop(context);
    }

    AlertDialogue().show(context,
        msg: 'Do you want to Change Password?',
        showCancelButton: true,
        firstButtonName: 'Confirm',
        showOkButton: false,
        firstButtonPressEvent: onPressedConfirm
    );
  }



}
