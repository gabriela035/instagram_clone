import 'package:flutter/material.dart';
import '../../../consts.dart';

class ButtonContainerWidget extends StatelessWidget {
  final Color? color;
  final String? text;
  final VoidCallback? onTapListener;
  const ButtonContainerWidget(
      {Key? key,
      this.color,
      this.text,
      this.onTapListener,
      required Null Function() onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapListener,
      child: Container(
        width: double.infinity,
        height: 40,
        decoration:
            BoxDecoration(color: color, borderRadius: BorderRadius.circular(8)),
        child: Center(
          child: Text(
            "$text",
            style: TextStyle(color: primaryColor, fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
