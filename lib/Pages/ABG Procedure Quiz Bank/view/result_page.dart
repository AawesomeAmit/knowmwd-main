import 'dart:ui';

import 'package:knowmed_flutter/Services/hex_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Dashboard/dashboard_view.dart';
import '../Structure/controller/knowmed_controller.dart';
import '../Structure/model/knowmed_model.dart';
class ResultPage extends StatefulWidget {
  const ResultPage({Key? key}) : super(key: key);

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {


  KnowMed_Model model = KnowMed_Model();
  KnowMed_Controller controller = Get.put(KnowMed_Controller());


  Future getResultData() async {
    await model.getResultData(context);
  }

  @override
  void initState() {
    super.initState();
   getResultData();
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: GetBuilder(
          init: KnowMed_Controller(),
          builder: (_){
            return SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20,20,0,0),
                      child: Row(
                        children: [
                          InkWell(onTap: ()async {
                             Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const DashboardView()));
                          },child: Icon(Icons.arrow_back_ios,color: Colors.white,size: 36,)),
                          SizedBox(width: 10,),
                          Text("Result",style: TextStyle(color: Colors.white,fontSize: 20),),
                        ],
                      ),
                    ),
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.2,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(50),
                          bottomRight: Radius.circular(50)),
                      color: Colors.blue.shade900,
                    ),
                  ),
                  SizedBox(height: 100,),
                  Row(
                    children: [
                      Row(
                        children: [
                          SizedBox(width: MediaQuery.of(context).size.width * 0.13,),
                          AnimatedContainer(height: 14,width:controller.incorrectWidth.value,color: controller.getColorsData[1].color_code!.toColor(), duration: Duration(seconds: 2),),
                          AnimatedContainer(height: 14,width:controller.correctWidth.value,color: controller.getColorsData[0].color_code!.toColor(),duration: Duration(seconds: 2)),
                          AnimatedContainer(height: 14,width:controller.notVisitedWidth.value,color: controller.getColorsData[2].color_code!.toColor(),duration: Duration(seconds: 2)),
                        ],
                      ),
                      SizedBox(width: 15,),
                      controller.getResultsData.isEmpty?Text(""):
                      Text("${ controller.getResultsData[0].totalCorrectPercentage}/100",style: TextStyle(color: Colors.indigo,fontWeight: FontWeight.bold),),
                    ],
                  ),
                  SizedBox(height: 30,),
                  controller.getResultsData.isEmpty?SizedBox():Row(
                    children: [
                      Expanded(flex: 1,child: Text(''),),
                      Expanded(
                        flex: 2,
                        child: RichText(
                          text: TextSpan(
                            children: [
                              WidgetSpan(
                                child: Icon(Icons.circle,color: controller.getColorsData[0].color_code!.toColor(),size: 18,),
                              ),
                              TextSpan(
                                  text: " Right",
                                  style: TextStyle(fontSize:MediaQuery.of(context).size.height * 0.019,color: Colors.black)
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: RichText(
                          text: TextSpan(
                            children: [
                              WidgetSpan(
                                child: Icon(Icons.circle,color: controller.getColorsData[1].color_code!.toColor(),size: 18,),
                              ),
                              TextSpan(
                                  text: " Wrong",
                                  style: TextStyle(fontSize:MediaQuery.of(context).size.height * 0.019,color: Colors.black)
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: RichText(
                          text: TextSpan(
                            children: [
                              WidgetSpan(
                                child: Icon(Icons.circle,color: controller.getColorsData[2].color_code!.toColor(),size: 18,),
                              ),
                              TextSpan(
                                  text: " Not Visited",
                                  style: TextStyle(fontSize:MediaQuery.of(context).size.height * 0.019,color: Colors.black)
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(flex: 1,child: Text(''),),
                    ],
                  ),
                  SizedBox(height: 30,),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0,0,0,20),
                    child: InkWell(onTap: ()async{
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const DashboardView()));
                    },child: Container(decoration: BoxDecoration(color: Colors.orangeAccent,borderRadius: BorderRadius.circular(20 )),width: MediaQuery.of(context).size.width *0.8,height:MediaQuery.of(context).size.height* 0.05,child: Padding(
                      padding:  EdgeInsets.fromLTRB(0,MediaQuery.of(context).size.height * 0.013, 0, 0),
                      child: Text("Go to dashboard",style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.022,fontWeight: FontWeight.w600),textAlign: TextAlign.center,),
                    ),),),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
