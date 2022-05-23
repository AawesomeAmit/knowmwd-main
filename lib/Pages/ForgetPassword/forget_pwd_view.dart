import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:knowmed_flutter/AppManager/app_color.dart';
import 'package:knowmed_flutter/AppManager/my_text_theme.dart';
import 'package:knowmed_flutter/AppManager/widgets/my_button.dart';
import 'package:knowmed_flutter/AppManager/widgets/my_text_field_2.dart';
import 'package:knowmed_flutter/Pages/ForgetPassword/forget_pwd_modal.dart';
import 'package:knowmed_flutter/Services/tab_responsive.dart';

class ForgetPwdview extends StatefulWidget{
  const ForgetPwdview({Key? key}) : super(key: key);
  _ForgetPwdViewState createState()=>_ForgetPwdViewState();
}

class _ForgetPwdViewState extends State<ForgetPwdview> {
  ForgetPwdModal modal=ForgetPwdModal();
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.26,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50)),
            color: Colors.blue.shade900,
          ),
        ),
        Padding(
            padding: const EdgeInsets.fromLTRB(0,0,0,0),
        child: Scrollbar(
            isAlwaysShown: true,
            child:
      Container(
      color: AppColor.white,
      child: SafeArea(
        child: Stack(
          children: [
            // Container(
            //   decoration: CommonWidgets().bgDecoration(),
            // ),
            Scaffold(
                backgroundColor: Colors.transparent,
                body: Center(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        TabResponsive().wrapInTab(
                          context: context,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(20,0,20,0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: AppColor.white,
                                borderRadius: const BorderRadius.all(Radius.circular(10)),
                                // border: Border.all(color: AppColor.greyLight)
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Form(
                                  key: modal.controller.formKey.value,
                                  autovalidateMode: AutovalidateMode.onUserInteraction,
                                  child: Container(
                                    alignment: Alignment.center,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        const SizedBox(
                                            height: 100,
                                            child: Image(image: AssetImage('assets/logo.png'),)),


                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(Radius.circular(10)),
                                            border: Border.all(color: Colors.grey)
                                          ),
                                          child: Column(
                                            children: [
                                              const SizedBox(height: 20,),
                                              MyTextField2(
                                                controller: modal.controller.otp.value,
                                                hintText: 'OTP',
                                                // keyboardType: TextInputType.number,

                                                validator: (value){
                                                  if(value!.isEmpty)
                                                  {
                                                    return 'OTP must not be empty';
                                                  }
                                                  else{
                                                    return null;
                                                  }
                                                },

                                              ),
                                              const SizedBox(height: 15,),
                                              MyTextField2(
                                                isPasswordField: true,
                                                controller: modal.controller.password.value,
                                                hintText: 'New Password',

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
                                              const SizedBox(height: 15,),
                                              MyTextField2(
                                                isPasswordField: true,
                                                controller: modal.controller.confirmPassword.value,
                                                hintText: 'Confirm Password',

                                                validator: (value){
                                                  if(value!.isEmpty)
                                                  {
                                                    return 'Confirm password must not be empty';
                                                  }
                                                  else{
                                                    return null;
                                                  }
                                                },

                                              ),
                                              const SizedBox(height: 40,),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  MyButton(
                                                    width: 130,
                                                    title: 'Cancel',
                                                    color: Colors.yellow,
                                                    onPress: (){
                                                      modal.onBackPress(context);
                                                    },
                                                  ),
                                                  MyButton(
                                                    width: 130,
                                                    title: 'Submit',
                                                    color: Colors.blue,
                                                    onPress: (){
                                                      modal.onForgetPwd(context);
                                                    },
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),


                                        const SizedBox(height: 40,),
                                        // Text('We Provide\nHealth & Medical\nServices for you.\n',
                                        //   textAlign: TextAlign.center,
                                        //   style: MyTextTheme().smallBCN.copyWith(
                                        //       color: AppColor.greyDark
                                        //   ),),
                                        Text('We Provide',
                                          textAlign: TextAlign.center,
                                          style: MyTextTheme().orangeHeading,),
                                        Text('Health & Medical\nServices',
                                          textAlign: TextAlign.center,
                                          style: MyTextTheme().largePCB,),
                                        Text('for you.',
                                          style: MyTextTheme().orangeHeading,),
                                        const SizedBox(height: 20,),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
            ),
          ],
        ),
      ),
    ),
    ),
    ),
    ],
    );
  }

}