import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:knowmed_flutter/AppManager/app_color.dart';
import 'package:knowmed_flutter/AppManager/my_text_theme.dart';
import 'package:knowmed_flutter/AppManager/widgets/my_app_bar.dart';
import 'package:knowmed_flutter/Pages/Dashboard/dashboard_controller.dart';
import 'package:knowmed_flutter/Pages/Drawer/menu_drawer.dart';
import '../common_widgets.dart';


final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

late Color pageColor;
class MenuView extends StatelessWidget {
  const MenuView({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {

    pageColor=Colors.blue;



    return Container(
      color: pageColor,
      child: SafeArea(
        child: GetBuilder(
          init: DashboardController(),
          builder: (_) {
            return Scaffold(
              key: _scaffoldKey,
              appBar: MyWidget().myAppBar(context,
                  leadingIcon:    CommonWidgets().drawerButton(context,onPress: (){
                    modal.dashC.searchC.value.clear();

                    _scaffoldKey.currentState!.openDrawer();
                    // WidgetsBinding.instance!.addPostFrameCallback((_) =>
                    //     modal.dashC.scrollController.value.animateTo(39 *
                    //         double.parse(modal.dashC.getSelectedMenuIndex.toString()),
                    //         duration: const Duration(seconds: 2), curve: Curves.fastOutSlowIn)
                    // );

                  }),
                  bgColor: pageColor,
                  title: "Menu Name",
                 subtitle: "SubMenu",
                 // subtitle: patient.pid,
                action: [
                  TextButton(
                      onPressed: (){
                        Navigator.pop(context);
                      },
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(20))
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(8,4,8,4),
                          child: Text('Back',
                          style: MyTextTheme().mediumWCB.copyWith(
                            color: pageColor
                          ),),
                        ),
                      ))
                ]
              ),
              drawer: MenuDrawer(
                context: context,

              ),
              body: GetBuilder(
                  init: DashboardController(),
                  builder: (_) {
                    return Column(
                      children: [
                        Expanded(child: modal.pages())
                      ],
                    );
                  }
              ),
            );
          }
        ),
      ),
    );


  }

}

