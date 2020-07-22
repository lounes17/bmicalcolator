import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_card.dart';
import 'icon_content.dart';
import 'constant.dart';
import 'resultat_page.dart';
import 'buttom_bar.dart';
import 'bmi_calculate.dart';

// ignore: non_constant_identifier_names
int Height = 180;
int Weight = 60;
int age = 21;

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

enum Gender {
  MALE,
  FEMALE,
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI Calculator')),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        //updateColor(Gender.MALE);
                        selectedGender = Gender.MALE;
                      });
                    },
                    child: ReusableCard(
                      colour: selectedGender == Gender.MALE
                          ? activeColor
                          : inActiveColor,
                      cardChild: IconContent(
                        textIcon: 'MALE',
                        icon: FontAwesomeIcons.mars,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        //updateColor(Gender.FEMALE);
                        selectedGender = Gender.FEMALE;
                      });
                    },
                    child: ReusableCard(
                      colour: selectedGender == Gender.FEMALE
                          ? activeColor
                          : inActiveColor,
                      cardChild: IconContent(
                        textIcon: 'FEMALE',
                        icon: FontAwesomeIcons.venus,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              colour: activeColor,
              cardChild: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'HEIGHT',
                    style: styleTextLabel,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    textBaseline: TextBaseline.alphabetic,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    children: [
                      Text(
                        Height.toString(),
                        style: styleTextLabelInteger,
                      ),
                      Text(
                        'cm',
                        style: styleTextLabel,
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbColor: Colors.red,
                      activeTrackColor: Color(0xFFEB1555),
                    ),
                    child: Slider(
                        value: Height.toDouble(),
                        min: 120.0,
                        max: 220.0,
                        inactiveColor: Color(0xFF8D8E98),
                        onChanged: (double newValue) {
                          setState(() {
                            Height = newValue.round();
                          });
                        }),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    colour: activeColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: styleTextLabel,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: <Widget>[
                            Text(
                              Weight.toString(),
                              style: styleTextLabelInteger,
                            ),
                            Text(
                              'Kg',
                              style: styleTextLabel,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            ButtonIcon(
                              iconss: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  Weight--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            ButtonIcon(
                              iconss: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  Weight++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: activeColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style: styleTextLabel,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              age.toString(),
                              style: styleTextLabelInteger,
                            ),
                            Text(
                              'Years',
                              style: styleTextLabel,
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ButtonIcon(
                                iconss: FontAwesomeIcons.minus,
                                onPressed: () {
                                  setState(() {
                                    age--;
                                  });
                                }),
                            SizedBox(
                              width: 10,
                            ),
                            ButtonIcon(
                                iconss: FontAwesomeIcons.plus,
                                onPressed: () {
                                  setState(() {
                                    age++;
                                  });
                                }),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          buttom_bar(
              textButtom: 'CALCULATE',
              onTap: () {
                Calculate cal = Calculate(height: Height.toInt(), weight: Weight.toInt());
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ResultPage(
                            bmiResult: cal.calculateBmi(),
                            advicesResult: cal.getInterpretation(),
                            textResult: cal.getResult(),
                          )),
                );
              })
        ],
      ),
    );
  }
}

class ButtonIcon extends StatelessWidget {
  final IconData iconss;
  final Function onPressed;
  ButtonIcon({@required this.iconss, @required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: null,
      onPressed: onPressed,
      backgroundColor: Color(0xFF4c4f5e),
      child: Icon(iconss, color: Colors.white),
    );
  }
}
