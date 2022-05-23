
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:knowmed_flutter/Services/hex_color.dart';
import 'package:get/get.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:knowmed_flutter/AppManager/alert_dialogue.dart';
import 'package:knowmed_flutter/AppManager/app_color.dart';
import 'package:knowmed_flutter/AppManager/my_text_theme.dart';
import 'package:knowmed_flutter/AppManager/widgets/my_app_bar.dart';
import 'package:knowmed_flutter/AppManager/widgets/my_text_field.dart';
import 'package:knowmed_flutter/Modal/quizBankListModal.dart';
import 'package:knowmed_flutter/Pages/Dashboard/Options/change_password_module.dart';
import 'package:knowmed_flutter/Pages/QuizBank/quizBankSubject_controller.dart';
import 'package:knowmed_flutter/Pages/QuizBank/quizBankSubject_modal.dart';
import 'package:knowmed_flutter/Services/tab_responsive.dart';

import '../common_widgets.dart';

class MockTestSubjectView extends StatefulWidget {
  const MockTestSubjectView({Key? key}) : super(key: key);

  @override
  _MockTestSubjectViewState createState() => _MockTestSubjectViewState();
}

class _MockTestSubjectViewState extends State<MockTestSubjectView> {
  getColor(String colors) async{
    Color color=HexColor(colors);
    return color;
  }
  QuizBankSubjectModal modal=QuizBankSubjectModal();
  @override
  void initState() {
    super.initState();
  }


  @override
  void dispose(){
    // Don't forget to dispose the ScrollController.
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    modal.getQuizList(context);
    return Container(
      color: AppColor.white,
      child: SafeArea(
        child: Scaffold(
          appBar: MyWidget().myAppBar(context,
            title: 'Mock Test',
            bgColor: AppColor.primaryColorDark,
            // subtitle: modal.dashC.selectedDepartment.value.subDepartmentName,
          ),
          body: GetBuilder(
              init: QuizBankSubjectController(),
              builder: (_) {
                return Column(
                  children: [
                    CommonWidgets().showNoData(
                        color: AppColor.white,
                        title: 'Data Not Found',
                        show: modal.controller.getShowNoData,
                        child:   Expanded(
                      child: StaggeredGridView.countBuilder(
                        crossAxisCount: 4,
                        itemBuilder: (context,index) {
                          SubjectList subjectList = modal.controller
                              .getSubjectList.isEmpty ?
                          SubjectList(
                              id: 0,
                              subjectName: '',
                              imagePath: '',
                              topicDetails: '',
                              topicCount: 0,
                              attempted: 0,
                              completedPercentage: 0,
                              completedPercentageColor: ''
                          ) :
                          modal.controller.getSubjectList[index];
                          return Padding(
                            padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                            child: Container(
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(10))
                              ),
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(5, 5, 5, 10),
                                child: Column(
                                  children: [
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment
                                          .start,
                                      children: [
                                        const SizedBox(width: 8,),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment
                                                .start,
                                            mainAxisAlignment: MainAxisAlignment
                                                .start,
                                            children: [
                                              Wrap(
                                                crossAxisAlignment: WrapCrossAlignment
                                                    .center,
                                                children: [
                                                  Card(
                                                    child: Padding(
                                                      padding: const EdgeInsets
                                                          .all(5.0),
                                                      child: Image.network(
                                                        subjectList.imagePath
                                                            .toString(),
                                                        fit: BoxFit.cover,
                                                        height: 45, width: 45,
                                                        errorBuilder: (context, error, stackTrace) {
                                                          return Image(image: AssetImage('assets/noimage.png'),
                                                            fit: BoxFit.cover,
                                                          height: 45,
                                                          width: 45,);
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                                  Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        TextButton(
                                                          style: TextButton
                                                              .styleFrom(
                                                              primary: Colors
                                                                  .black,
                                                              padding: const EdgeInsets
                                                                  .fromLTRB(
                                                                  8, 8, 8, 8),
                                                              minimumSize: const Size(
                                                                  0, 0),
                                                              tapTargetSize: MaterialTapTargetSize
                                                                  .shrinkWrap
                                                          ),
                                                          onPressed: () {
                                                            modal
                                                                .onPressSubject(
                                                                context,
                                                                subjectList.id!
                                                                    .toInt());
                                                          }, child: Text(
                                                            subjectList
                                                                .subjectName
                                                                .toString()),),
                                                        Container(
                                                            margin: const EdgeInsets
                                                                .all(5),
                                                            padding: const EdgeInsets
                                                                .symmetric(
                                                                horizontal: 2,
                                                                vertical: 2),
                                                            width: 200,
                                                            decoration: BoxDecoration(
                                                                border: Border
                                                                    .all(
                                                                    color: AppColor
                                                                        .greyLight,
                                                                    width: 1),
                                                                borderRadius: BorderRadius
                                                                    .circular(
                                                                    20)
                                                            ),
                                                            child: Row(
                                                              children: [
                                                                AnimatedContainer(height: 3, alignment: Alignment.centerLeft,width:subjectList.completedPercentage!.toInt()*1.94,color: subjectList.completedPercentageColor!.toColor(), duration: Duration(seconds: 2), curve: Curves.linear,),
                                                              ],
                                                            ),
                                                        ),
                                                        const SizedBox(
                                                          height: 2,),
                                                        Text(subjectList
                                                            .attempted
                                                            .toString() + '/' +
                                                            subjectList
                                                                .topicCount
                                                                .toString() +
                                                            ' completed',
                                                          style: MyTextTheme()
                                                              .smallGCN,),
                                                      ]
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              // ),
                            ),
                          );
                        },

                        staggeredTileBuilder: (int index) =>
                            StaggeredTile.fit(
                                TabResponsive().isTab(context)? 2:4
                            ),
                        mainAxisSpacing: 0.0,
                        crossAxisSpacing: 0.0,),
                    ))

                  ],
                );
              }
          ),
        ),
      ),
    );
  }

}
