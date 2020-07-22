import 'package:bmicalcolator/reusable_card.dart';
import 'package:flutter/material.dart';
import 'constant.dart';
import 'buttom_bar.dart';

class ResultPage extends StatelessWidget {
  String bmiResult;
  String textResult;
  String advicesResult;
  ResultPage({@required this.bmiResult,@required this.textResult,@required this.advicesResult});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Resultat', style: TextStyle(color: Color(0xFFEB1555))),
      ),
      body: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text('YOUR RESULT'
          ,
          style: styleTextLabelInteger,
          ),
        ),
        Expanded(
          child: ReusableCard(
            colour: activeColor,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  textResult,
                  style: TextStyle(fontSize: 25, color: Colors.teal),
                ),
                Text(
                  bmiResult,
                  style: styleTextLabelInteger,
                ),
                Text(
                  advicesResult,
                  style: TextStyle(fontSize: 20, color: Colors.teal,),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          flex: 5,
        ),
        buttom_bar(textButtom: 'RE-CALCULATE', onTap: (){
          Navigator.pop(context);
        })
      ],
    ),
    );
  }
}


