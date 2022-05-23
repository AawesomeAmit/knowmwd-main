import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:knowmed_flutter/AppManager/app_color.dart';
import 'package:knowmed_flutter/AppManager/expansion_title.dart';
import 'package:knowmed_flutter/AppManager/my_text_theme.dart';
import 'package:knowmed_flutter/AppManager/widgets/my_text_field.dart';
import 'package:knowmed_flutter/AppManager/widgets/my_text_field_2.dart';
import 'package:knowmed_flutter/Pages/Drawer/menu_modal.dart';
MenuModal modal=MenuModal();
late Color pageColor;

class MenuDrawer extends StatelessWidget {
  final BuildContext context;

  const MenuDrawer({Key? key, required this.context}) : super(key: key);

  @override
  Widget build(BuildContext context) {



    pageColor=AppColor.red;
    // patient=modal.ipdC.selectedPatient.value;
    return Drawer(
      child: Column(
        children:  [
           const SizedBox(
              height: 120,
              child: Image(image: AssetImage('assets/loginLogo.png'),)),
          const SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: MyTextField2(
              controller: modal.dashC.searchC.value,
              hintText: 'Search Here...',
              textAlign: TextAlign.center,
              onChanged: (val){
                modal.dashC.update();
              },

            ),
          ),

        ],
      ),
    );
  }

}
