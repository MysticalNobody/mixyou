import 'package:flutter/material.dart';
import 'package:mexyou/res/res.dart';

class MYButton extends StatelessWidget {
  const MYButton({Key key, @required this.text, this.width, this.onTap}) : super(key: key);

  final String text;
  final double width;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap == null ? () => {} : onTap,
      child: Container(
        height: 55,
        width: width,
        color: MYColors.whiteBg,
        child: Center(
          child: Text(text),
        ),
      ),
    );
  }
}
