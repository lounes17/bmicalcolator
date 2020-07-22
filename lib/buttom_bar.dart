import 'package:flutter/material.dart';
import 'reusable_card.dart';
class buttom_bar extends StatelessWidget {
  String textButtom;
  Function onTap;
  buttom_bar({@required this.textButtom,@required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          color: Color(0xFFEB1555),
          height: 60,
          child: GestureDetector(
            onTap: onTap,
            child: ReusableCard(
              cardChild: Center(
                child: Text(
                  textButtom,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              colour: Color(0xFFEB1555),
            ),
          )),
    );
  }
}
