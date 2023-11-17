import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            return Row(
              // mainAxisAlignment: MainAxisAlignment.,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(5),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: data['user_answer'] == data['correct_answer']
                          ? const Color.fromARGB(255, 101, 233, 105)
                          : const Color.fromARGB(255, 240, 105, 96)),
                  child: Text(
                    ((data['question_index'] as int) + 1).toString(),
                  ),
                ),
              const SizedBox(width: 5,),
                Expanded(
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(data['question'] as String,style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold
                      ),),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        data['user_answer'] as String,
                        style: const TextStyle(color: Color.fromARGB(255, 1, 7, 74)),
                      ),
                      Text(
                        data['correct_answer'] as String,
                        style:const  TextStyle(color: Color.fromARGB(255, 1, 66, 3),),
                        
                      ),
                      const SizedBox(height: 5,)
                    ],
                
                  ),
                )
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
