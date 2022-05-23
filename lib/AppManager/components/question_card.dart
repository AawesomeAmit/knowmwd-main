import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:knowmed_flutter/AppManager/app_color.dart';
import 'package:knowmed_flutter/Modal/question.dart';
import 'package:knowmed_flutter/Pages/QuizBank/quizController.dart';
import 'option.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({
    Key? key,
    // it means we have to pass this
    @required this.question,
  }) : super(key: key);

  final Question? question;

  @override
  Widget build(BuildContext context) {
    QuizController _controller = Get.put(QuizController());
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        children: [
          Text(
            question!.responseValue!.optionList!.elementAt(1).question.toString(),
            style: Theme.of(context)
                .textTheme
                .headline6
                ?.copyWith(color: AppColor.black),
          ),
          SizedBox(height: 20 / 2),
          ...List.generate(
            question!.responseValue!.optionList!.length,
            (index) => Option(
              index: index,
              text: question!.responseValue!.optionList![index].sNo.toString(),
              // press: () => _controller.checkAns(question, index),
            ),
          ),
        ],
      ),
    );
  }
}
