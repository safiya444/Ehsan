import 'dart:io';

import 'package:empty_code/ui/shared/utils.dart';
import 'package:flutter/material.dart';

class ImageDialoge extends StatelessWidget {
  final String path;

  const ImageDialoge({super.key, required this.path});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Image.file(
        File(path),
        width: screenWidth(1),
        height: screenWidth(1),
      ),
    );
  }
}
