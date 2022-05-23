import 'package:knowmed_flutter/AppManager/alert_dialogue.dart';
import 'package:knowmed_flutter/Pages/ABG Procedure Quiz Bank/view/result_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:knowmed_flutter/Pages/ABG Procedure Quiz Bank/Structure/controller/feedback_controller.dart';
import 'package:get/get.dart';

import 'package:knowmed_flutter/AppManager/app_util.dart';
import 'package:knowmed_flutter/Pages/ABG Procedure Quiz Bank/AppManager/app_util.dart';
import '../../Dashboard/dashboard_view.dart';
import '../Structure/controller/knowmed_controller.dart';
import '../Structure/data_model/knowmed_feedback.dart';
import '../Structure/model/knowmed_model.dart';

class FeedbackAbgProcedure extends StatefulWidget {
  const FeedbackAbgProcedure({Key? key}) : super(key: key);

  @override
  State<FeedbackAbgProcedure> createState() => _FeedbackAbgProcedureState();
}

class _FeedbackAbgProcedureState extends State<FeedbackAbgProcedure> {

  late final _ratingController;
  late int _rating;


  int val = -1;
  double _initialRating = 0.0;
  bool _isRTLMode = false;
  bool _isVertical = false;
  bool isReverse = false;
  IconData? _selectedIcon;
  String feedback = "";
  TextEditingController textController = TextEditingController();

  FeedbackController controller = Get.put(FeedbackController());
  KnowMed_Controller controller2 = Get.put(KnowMed_Controller());
  KnowMed_Model model = KnowMed_Model();


  @override
  Widget build(BuildContext context) {
    return WillPopScope(

      onWillPop: () async {
     return await Navigator.push(
         context,
         MaterialPageRoute(builder: (context) => const DashboardView()));
      },
      child: Scaffold(
        body: GetBuilder(
          init: FeedbackController(),
          builder: (_){
            return Container(
              width: double.infinity,
              child: SingleChildScrollView(
                reverse: isReverse,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 50,),
                    Text("Module Completed", style: TextStyle(
                        color: Colors.blueGrey.shade900,
                        fontSize: 18,
                        fontWeight: FontWeight.w700),),
                    Text("Please Rate Us", style: TextStyle(
                        color: Colors.blueGrey.shade900,
                        fontSize: 18,
                        fontWeight: FontWeight.w700)),
                    SizedBox(height: 10,),
                    RatingBar.builder(
                      initialRating: _initialRating,
                      minRating: 0,
                      direction: _isVertical ? Axis.vertical : Axis.horizontal,
                      allowHalfRating: false,
                      unratedColor: Colors.blueGrey.shade100,
                      itemCount: 5,
                      itemSize: 30.0,
                      itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                      itemBuilder: (context, _) =>
                          Icon(
                            _selectedIcon ?? Icons.star,
                            color: Colors.amber,
                          ),
                      onRatingUpdate: (rating) {
                        setState(() {
                          _rating = rating.toInt();
                        });
                      },
                      updateOnDrag: true,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20,20,0,0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("What went wrong?",textAlign: TextAlign.start,style: TextStyle(fontWeight: FontWeight.w700,fontSize: 18,color: Colors.blueGrey.shade900),),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20,0,0,0),
                      child: ListView.separated(physics: NeverScrollableScrollPhysics(),shrinkWrap: true,itemBuilder: (BuildContext context, int index){
                        FeedbackDataModel data = controller.feedback_data[index];
                        bool isSelected=feedback==data.feedbackName.toString();
                        return Container(
                            child: InkWell(
                              splashColor: Colors.transparent,
                              onTap: (){
                                feedback=data.feedbackName.toString();
                                setState(() {

                                });
                              },
                              child: Row(
                                children: [
                                  isSelected?Icon(Icons.radio_button_checked,color: Colors.blue,):Icon(Icons.radio_button_off),
                                  SizedBox(width: 10,),
                                  Text(data.feedbackName.toString(),style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400),),
                                ],
                              ),
                            )
                        );
                      },
                          separatorBuilder: (BuildContext context,int index)=>SizedBox(height:10),
                          itemCount: controller.feedback_data.length),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0,20,0,20),
                      child: Text("Tell us what we missed? ",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18,color: Colors.blueGrey.shade900),),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20,0,20,20),
                      child: Container(
                        child: TextField(
                          onTap: (){
                            isReverse = true;
                          },
                          controller: textController,
                          minLines:6,
                          maxLines: 10,
                          decoration: InputDecoration(
                            hintText: "Write here...",
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey.shade600,width: 1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey.shade600,width: 1),
                              borderRadius: BorderRadius.circular(10),
                            )
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0,0,0,20),
                      child: InkWell(onTap: ()async{
                       controller2.multiple = MediaQuery.of(context).size.width * 0.006;
                       controller2.ratingFeedback.value = _rating.toString();
                       controller2.feedbackWritten.value = textController.value.text.toString();
                       controller2.feedbackOptionSelect.value = feedback.toString();
                        model.getResultData(context);
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const ResultPage()));
                      },child: Container(decoration: BoxDecoration(color: Colors.orangeAccent,borderRadius: BorderRadius.circular(20 )),width: MediaQuery.of(context).size.width * 0.8,height:MediaQuery.of(context).size.height * 0.05,child: Padding(
                        padding:  EdgeInsets.fromLTRB(0, MediaQuery.of(context).size.height * 0.014, 0, 0),
                        child: Text("Submit",style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.023,fontWeight: FontWeight.w600),textAlign: TextAlign.center,),
                      ),),),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}