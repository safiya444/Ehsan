import 'package:empty_code/ui/shared/colors.dart';
import 'package:empty_code/ui/shared/utils.dart';
import 'package:flutter/material.dart';

class BeforScreen extends StatelessWidget {
  final double width;
  final double height;
  const BeforScreen({super.key, required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        height: height,

        //width: screenWidth(1.1),
        //height: screenWidth(1.7),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(spreadRadius: 1, blurRadius: 1, offset: Offset(1, 1))
          ],
        ));
  }
}
