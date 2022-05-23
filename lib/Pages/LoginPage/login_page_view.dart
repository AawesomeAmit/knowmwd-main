
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:knowmed_flutter/AppManager/app_color.dart';
import 'package:knowmed_flutter/AppManager/my_text_theme.dart';
import 'package:knowmed_flutter/AppManager/user_data.dart';
import 'package:knowmed_flutter/AppManager/widgets/my_button.dart';
import 'package:knowmed_flutter/AppManager/widgets/my_text_field.dart';
import 'package:knowmed_flutter/AppManager/widgets/my_text_field_2.dart';
import 'package:knowmed_flutter/Pages/LoginPage/login_controller.dart';
import 'package:knowmed_flutter/Pages/LoginPage/login_modal.dart';
import 'package:knowmed_flutter/Pages/common_widgets.dart';
import 'package:knowmed_flutter/Services/tab_responsive.dart';



class   LoginPageView extends StatefulWidget {
  const LoginPageView({Key? key}) : super(key: key);

  @override
  _LoginPageViewState createState() => _LoginPageViewState();
}

class _LoginPageViewState extends State<LoginPageView> {


  LoginModal modal=LoginModal();
  final formKey = GlobalKey<FormState>();


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    Get.delete<LoginController>();
  }





  @override
  Widget build(BuildContext context) {
    return Container(
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
                              // color: AppColor.white,
                              // borderRadius: const BorderRadius.all(Radius.circular(10)),
                              image: DecorationImage(
                                  image: AssetImage("assets/background.jpg"),
                                  fit: BoxFit.cover),
                              // border: Border.all(color: AppColor.greyLight)
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Form(
                                key: formKey,
                                autovalidateMode: AutovalidateMode.onUserInteraction,
                                child: Container(
                                  alignment: Alignment.center,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const SizedBox(
                                          height: 100,
                                          child: Image(image: AssetImage('assets/logo.png'),)),

                                      const SizedBox(height: 20,),
                                      Text('Good Morning!',
                                        textAlign: TextAlign.center,
                                        style: MyTextTheme().orangeHeading,),
                                      const SizedBox(height: 5,),
                                      Text('This day will be great.',
                                        textAlign: TextAlign.center,
                                        style: MyTextTheme().greyHeading,),

                                      const SizedBox(height: 40,),
                                      MyTextField2(
                                        controller: modal.controller.userIdC.value,
                                        hintText: 'User Id',
                                        // keyboardType: TextInputType.number,

                                        validator: (value){
                                          if(value!.isEmpty)
                                          {
                                            return 'User Id must not be empty';
                                          }
                                          else{
                                            return null;
                                          }
                                        },

                                      ),
                                      const SizedBox(height: 15,),
                                      MyTextField2(
                                        isPasswordField: true,
                                        controller: modal.controller.passwordC.value,
                                        hintText: 'Password',

                                        validator: (value){
                                          if(value!.isEmpty)
                                          {
                                            return 'Password must not be empty';
                                          }
                                          else{
                                            return null;
                                          }
                                        },

                                      ),
                                      const SizedBox(height: 10,),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          TextButton(
                                            style: TextButton.styleFrom(
                                                primary: Colors.black,
                                                padding: const EdgeInsets.fromLTRB(8,8,8,8),
                                                minimumSize: const Size(0,0),
                                                tapTargetSize: MaterialTapTargetSize.shrinkWrap
                                            ),
                                            onPressed: () {
                                              showDialog(
                                                  context: context,
                                                  builder: (context) {
                                                    return AlertDialog(
                                                      title: Text('Forget Password'),
                                                      content: MyTextField2(
                                                        isPasswordField: false,
                                                        controller: modal.controller.mobileOREmail.value,
                                                        hintText: 'Email Id/Phone No.',
                                                        validator: (value){
                                                          if(value!.isEmpty) return 'Email Id/Phone No. must not be empty';
                                                          else return null;
                                                        },
                                                      ),
                                                      actions: <Widget>[
                                                        MyButton(
                                                          width: 130,
                                                          title: 'Go',
                                                          color: Colors.blue,
                                                          onPress: (){
                                                            modal.onPressForget(context);
                                                          },
                                                        ),

                                                      ],
                                                    );
                                                  });
                                            },
                                            child: Text('Forget Password ?',
                                              style: MyTextTheme().mediumPCB,),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 40,),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          MyButton(
                                            width: 130,
                                            title: 'Login',
                                            color: AppColor.orangeButtonColor,
                                            onPress: (){
                                              if(formKey.currentState!.validate())
                                              modal.onPressLogin(context);
                                            },
                                          ),
                                          MyButton(
                                            width: 130,
                                            title: 'Register',
                                            color: Colors.blue,
                                            onPress: (){
                                              // if(formKey.currentState!.validate())
                                              // modal.onPressLogin(context);
                                            },
                                          ),
                                        ],
                                      ),

                                      const SizedBox(height: 40,),
                                      // Text('We Provide\nHealth & Medical\nServices for you.\n',
                                      //   textAlign: TextAlign.center,
                                      //   style: MyTextTheme().smallBCN.copyWith(
                                      //       color: AppColor.greyDark
                                      //   ),),
                                      Wrap(
                                        children: [
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text('We Provide',
                                                textAlign: TextAlign.center,
                                                style: MyTextTheme().orangeHeading,),
                                              Text('Health & Medical',
                                                textAlign: TextAlign.center,
                                                style: MyTextTheme().largePCB,),
                                              Text('Services',
                                                textAlign: TextAlign.center,
                                                style: MyTextTheme().largePCB,),
                                              Text('for you.',
                                                style: MyTextTheme().orangeHeading,),
                                            ],
                                          ),
                                        ],
                                      ),

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
    );
  }
}