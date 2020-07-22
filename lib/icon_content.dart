import 'package:flutter/material.dart';
import 'constant.dart';
class IconContent extends StatelessWidget {
    final String textIcon;
    final IconData icon;
    IconContent({@required this.textIcon,this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 90.0,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          textIcon,
          style:
            styleTextLabel,
        )
      ],
    );
  }
}
