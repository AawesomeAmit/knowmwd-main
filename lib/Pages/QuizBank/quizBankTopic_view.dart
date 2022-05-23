
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:knowmed_flutter/AppManager/alert_dialogue.dart';
import 'package:knowmed_flutter/AppManager/app_color.dart';
import 'package:knowmed_flutter/AppManager/my_text_theme.dart';
import 'package:knowmed_flutter/AppManager/quizBankTopicDetails.dart';
import 'package:knowmed_flutter/AppManager/widgets/my_app_bar.dart';
import 'package:knowmed_flutter/AppManager/widgets/my_button.dart';
import 'package:knowmed_flutter/AppManager/widgets/my_text_field.dart';
import 'package:knowmed_flutter/Modal/assignedQuizBankTopic.dart';
import 'package:knowmed_flutter/Modal/quizBankListModal.dart';
import 'package:knowmed_flutter/Pages/Dashboard/Options/change_password_module.dart';
import 'package:knowmed_flutter/Pages/QuizBank/quizBankTopic_modal.dart';
import 'package:knowmed_flutter/Pages/QuizBank/quizBankSubject_controller.dart';
import 'package:knowmed_flutter/Pages/QuizBank/quizBankSubject_modal.dart';
import 'package:knowmed_flutter/Services/tab_responsive.dart';

import '../common_widgets.dart';

class QuizBankTopicView extends StatefulWidget {
  final String sId;
  const QuizBankTopicView(this.sId, {Key? key}) : super(key: key);

  @override
  _QuizBankTopicViewState createState() => _QuizBankTopicViewState();
}

class _QuizBankTopicViewState extends State<QuizBankTopicView> {
  QuizBankTopicData topicData=QuizBankTopicData();
  QuizBankTopicModal modal=QuizBankTopicModal();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }


  @override
  void dispose(){
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.white,
      child: SafeArea(
        child: Scaffold(
          appBar: MyWidget().myAppBar(context,
            title: '',
            bgColor: AppColor.primaryColorDark,
          ),

          body: GetBuilder(
              init: QuizBankSubjectController(),
              builder: (_) {
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
                  Column(
                  children: [
                    CommonWidgets().showNoData(
                        color: AppColor.white,
                        title: 'Data Not Found',
                        show: modal.controller.getShowNoData,
                        child:   Expanded(
                      child: StaggeredGridView.countBuilder(
                        crossAxisCount: 4,
                        itemCount:
                        topicData.getAssignedQuizBankTopic.length==0?
                        alertToast(context, 'No data found!')
                            :
                        // modal.controller.getPatientList.length,
                        topicData.getAssignedQuizBankTopic.length,
                        itemBuilder: (context,index){
                          topicData.getAssignedQuizBankTopic.isEmpty?
                          AssignedQuizBankTopic(
                              id: 0,
                              topicName: '',
                              imagePath: '',
                              noOfQs: ''
                              ):
                          topicData.getAssignedQuizBankTopic[index];
                          return Padding(
                            padding: const EdgeInsets.fromLTRB(10,5,10,5),
                            child: Container(
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(Radius.circular(5))
                              ),
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(12,12,12,5),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          const SizedBox(width: 8,),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                Wrap(
                                                  // crossAxisAlignment: WrapCrossAlignment.center,
                                                  children: [
                                                    Card(
                                                      child: Padding(
                                                        padding: const EdgeInsets.all(0),
                                                        child: Image.network(topicData.getAssignedQuizBankTopic[index].imagePath.toString(),height: 40, width: 40,
                                                          errorBuilder: (context, error, stackTrace) {
                                                            return Image(image: AssetImage('assets/noimage.png'),
                                                              height: 50,
                                                              width: 50,);
                                                          },),
                                                      ),
                                                    ),
                                                    Column(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        const SizedBox(height: 2,width: 2,),
                                                        Text(topicData.getAssignedQuizBankTopic[index].topicName.toString(),
                                                          style: MyTextTheme().mediumBCB,),
                                                        const SizedBox(height: 2,),
                                                        Text(topicData.getAssignedQuizBankTopic[index].noOfQs.toString()+' Multiple Choice Questions',
                                                          style: MyTextTheme().smallGCN,),
                                                        Container(
                                                            margin: const EdgeInsets
                                                                .all(5),
                                                            padding: const EdgeInsets.symmetric(
                                                                horizontal: 2,
                                                                vertical: 2),
                                                            width: 120,
                                                            decoration: BoxDecoration(
                                                              color: AppColor.orangeButtonColor,
                                                                border: Border
                                                                    .all(
                                                                    color: AppColor
                                                                        .greyLight,
                                                                    width: 1),
                                                                borderRadius: BorderRadius
                                                                    .circular(
                                                                    15)
                                                            ),
                                                            child:TextButton(
                                                              style: TextButton
                                                                  .styleFrom(
                                                                  primary: Colors
                                                                      .black,
                                                                  padding: const EdgeInsets
                                                                      .fromLTRB(
                                                                      5, 5, 5, 5),
                                                                  minimumSize: const Size(
                                                                      0, 0),
                                                                  tapTargetSize: MaterialTapTargetSize
                                                                      .shrinkWrap
                                                              ),
                                                              onPressed: () {
                                                                modal.onPressTopic(context, topicData.getAssignedQuizBankTopic[index].id,widget.sId.toString());
                                                              }, child: Text('Start Module'),
                                                            ),
                                                            /*MyButton(
                                                              height: 10,
                                                              width: 120,
                                                              elevation: 2,
                                                              title: 'Start Module',
                                                              color: AppColor.orangeButtonColor,
                                                              textStyle: MyTextTheme().mediumBCB,
                                                              onPress: (){
                                                                modal.onPressTopic(context, topicData.getAssignedQuizBankTopic[index].id);
                                                              },
                                                            ),*/
                                                        ),

                                                      ]
                                                    )
                                                  ],
                                                ),],
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
                ),
                ),
                ),
                ],
                );
              }
          ),
        ),
      ),
    );
  }

}
