import 'package:flutter/cupertino.dart';

class ButtonBold extends StatefulWidget {
  final String title;
  final Color color;
  final TextAlign align;
  final FontWeight fontWeight;
  const ButtonBold(
      {super.key,
      required this.title,
      required this.color,
      required this.align,
      required this.fontWeight});
  @override
  State<ButtonBold> createState() => _ButtonBold();
}

class _ButtonBold extends State<ButtonBold> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.title,
      textAlign: widget.align,
      style: TextStyle(
          color: widget.color,
          fontWeight: widget.fontWeight,
          fontFamily: 'Montserrat',
          fontSize: 17,
          height: 1.5),
    );
  }
}
