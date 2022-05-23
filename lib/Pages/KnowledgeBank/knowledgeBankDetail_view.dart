import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:knowmed_flutter/AppManager/my_text_theme.dart';
import 'package:knowmed_flutter/Modal/questionListKnowledgeBank.dart';

class KnowledgeBankDetailView extends StatelessWidget {
  final ResponseValue1? que;

  const KnowledgeBankDetailView(this.que, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Container(
      color: Colors.lightBlue,
      child: SafeArea(
        child: Scaffold(
          body: Padding(

            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                    children: [
                      Text('Topic: ' + que!.subjectName.toString(),
                        style: MyTextTheme().largeBCB,),
                    ]
                ),

                Row(
                    children: [
                      // Text(que!.question.toString(), style: MyTextTheme().mediumBCB,),
                      Expanded(
                        // crossAxisAlignment: WrapCrossAlignment.start,
                        child: (
                            Wrap(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  // child: Text(questionList.question.toString(),
                                  //   style: MyTextTheme().mediumBCN,),
                                  child: Text(que!.question.toString(),
                                    style: MyTextTheme().mediumBCB,),
                                ),
                              ],
                            )
                        ),
                      ),
                    ]
                ),

                Expanded(
                  // crossAxisAlignment: WrapCrossAlignment.start,
                  child: (
                      Wrap(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            // child: Text(questionList.question.toString(),
                            //   style: MyTextTheme().mediumBCN,),
                            child: Text(que!.question.toString(),
                              style: MyTextTheme().mediumPCN,),
                          ),
                        ],
                      )
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
    throw UnimplementedError();
  }
}
