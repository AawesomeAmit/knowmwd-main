 import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:knowmed_flutter/AppManager/app_color.dart';
import 'package:knowmed_flutter/AppManager/app_util.dart';
import 'package:knowmed_flutter/AppManager/my_text_theme.dart';
import 'package:knowmed_flutter/AppManager/widgets/my_button.dart';


class SettingView extends StatefulWidget {
  const SettingView({Key? key}) : super(key: key);

  @override
  _SettingViewState createState() => _SettingViewState();
}

class _SettingViewState extends State<SettingView> {

  int oximetryBtn=1;
  int bPBtn=1;
  @override
  Widget build(BuildContext context) {
    return Container(
        color: AppColor.primaryColor,
        child: SafeArea(
            child: Scaffold(
              body: SingleChildScrollView(
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  color: AppColor.white,
                  child:Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          width: MediaQuery.of(context).size.width,
                          color: AppColor.greyLight,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('BP And Oximeter Device Selection',
                              textAlign: TextAlign.center,style: MyTextTheme().mediumPCB,),
                          )),
                      const SizedBox(height: 20,),
                       Row(
                         children: [
                           const SizedBox(width: 10,),
                           Text('Set Oximetry Device Type',style: MyTextTheme().mediumPCB,),
                         ],
                       ),
                      const SizedBox(height: 5,),
                      const Divider(height: 1, ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Radio(
                            materialTapTargetSize:MaterialTapTargetSize.shrinkWrap,
                              focusColor: Colors.red,
                              value: 1,
                              groupValue: oximetryBtn,
                              activeColor: AppColor.primaryColor,
                              onChanged: (_){
                                setState(() {
                                  oximetryBtn=1;
                                });
                              }),
                          const Text('Control D'),
                          const SizedBox(width: 100,),
                          Radio(
                              materialTapTargetSize:MaterialTapTargetSize.shrinkWrap,
                              value: 2,
                              groupValue: oximetryBtn,
                              activeColor: AppColor.primaryColor,
                              onChanged: (_){
                                setState(() {
                                  oximetryBtn=2;
                                });
                              }),
                          const Text('Via'),
                        ],
                      ),
                      const Divider(height: 1, ),

                      const SizedBox(height: 20,),
                       Row(
                         children: [
                           const SizedBox(width: 10,),
                           Text('Set BP Device Type',style: MyTextTheme().mediumPCB,),
                         ],
                       ),
                      const SizedBox(height: 5,),
                      const Divider(height: 1, ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Radio(
                              materialTapTargetSize:MaterialTapTargetSize.shrinkWrap,
                              focusColor: Colors.red,
                              value: 1,
                              groupValue: bPBtn,
                              activeColor: AppColor.primaryColor,
                              onChanged: (_){
                                setState(() {
                                  bPBtn=1;
                                });
                              }),
                          const Text('Medcheck'),
                          const SizedBox(width: 40,),
                          Radio(
                              materialTapTargetSize:MaterialTapTargetSize.shrinkWrap,
                              focusColor: Colors.red,
                              value: 2,
                              groupValue: bPBtn,
                              activeColor: AppColor.primaryColor,
                              onChanged: (_){
                                setState(() {
                                  bPBtn=2;
                                });
                              }),
                          const Text('Omron'),
                          const SizedBox(width: 40,),
                          Radio(
                              materialTapTargetSize:MaterialTapTargetSize.shrinkWrap,
                              value: 3,
                              groupValue: bPBtn,
                              activeColor: AppColor.primaryColor,
                              onChanged: (_){
                                setState(() {
                                  bPBtn=3;
                                });
                              }),
                          const Text('Meditive'),
                        ],
                      ),
                      const Divider(height: 1, ),

                      const SizedBox(height: 40,),
                      MyButton(title: 'Back',color: AppColor.orangeButtonColor,onPress: (){

                      },)
                    ],
                  ),
                ),
              ),
            )

        ));
  }

}

