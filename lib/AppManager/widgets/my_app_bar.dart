

import 'package:flutter_svg/svg.dart';
import 'package:knowmed_flutter/AppManager/app_util.dart';
import 'package:knowmed_flutter/AppManager/user_data.dart';
import 'package:flutter/material.dart';
import 'package:knowmed_flutter/AppManager/my_text_theme.dart';
import 'package:knowmed_flutter/AppManager/app_color.dart';
import 'package:knowmed_flutter/Pages/common_widgets.dart';
import 'package:get/get.dart';




class MyWidget {

  UserData user=Get.put(UserData());

  myAppBar(
      context,
      {
        elevation,
        leadingIcon,
        subtitle,
        bool? hideLeadingIcon,
        title,
        List<Widget>? action,
       Color? bgColor,
      }){
    return AppBar(
      elevation: elevation??0,
      automaticallyImplyLeading: false,
      leading: (hideLeadingIcon?? false)? null:leadingIcon?? CommonWidgets().backButton(context),
      centerTitle: false,
      title:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title.toString(),
            style: MyTextTheme().largeWCB,),
          Visibility(
            visible: subtitle!=null,
            child: Text(subtitle.toString(),
              style: MyTextTheme().smallWCN,),
          ),
        ],
      ),
      backgroundColor: Colors.transparent,
      actions: action,
      flexibleSpace:  Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0,0,0,1),
          child: Stack(
            children: [
              Container(
                height: 60,
                color: bgColor??AppColor.primaryColor,
                child: Row(
                  children: [
                    Container(
                      width: 100,
                      decoration: const BoxDecoration(
                          color: Colors.white12,
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(2000)
                          )

                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      // flexibleSpace: SizedBox(
      //   height: 80,
      //   child: SvgPicture.asset(
      //       'assets/appBarBG.svg',
      //       semanticsLabel: 'Acme Logo',
      //     fit: BoxFit.cover,
      //   ),
      // ),
    );
  }



  myAppBarWithBG(
      context,
      {
        elevation,
        leadingIcon,
        title,
        List<Widget>? action,
      }){
    return AppBar(
      elevation: elevation??0,
      automaticallyImplyLeading: false,
      leading: leadingIcon?? CommonWidgets().backButton(context),
      centerTitle: true,
      title:  Text(title.toString(),
        style: MyTextTheme().largeWCN,),
      backgroundColor:  AppColor.primaryColor,
      actions: action,
    );
  }

}