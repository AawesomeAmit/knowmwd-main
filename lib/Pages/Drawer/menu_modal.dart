


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:knowmed_flutter/Pages/ChangePwd/change_pwd_view.dart';
import 'package:knowmed_flutter/Pages/Dashboard/dashboard_controller.dart';
import 'package:knowmed_flutter/Pages/Dashboard/dashboard_view.dart';
import 'package:knowmed_flutter/Pages/LoginPage/login_page_view.dart';
import 'package:knowmed_flutter/Pages/Profile/profile_view.dart';

class MenuModal {

  final DashboardController dashC=Get.put(DashboardController());
  // final IPDController ipdC=Get.put(IPDController());



  Widget pages(){
    switch("hb"){
      case 'Personal Dashboard':
        return const LoginPageView(
        );
      case 'Dashboard':
        return const DashboardView(
        );
      case 'Profile':
        return const ProfileView(
        );

      // case 'Help':
      //   return const HelpView(
      //   );
      //
      case 'Change Password':
        return const ChangePwdView(
        );

      case 'Logout':
        return const LoginPageView(
        );
      default:
        return const DashboardView(

        );
    }
  }







}