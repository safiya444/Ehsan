import 'package:empty_code/ui/shared/utils.dart';
import 'package:flutter/material.dart';

class Side_item extends StatelessWidget {
  final IconData icon;
  final String title;
  final Function onTap;
  final bool? needClose;
  final Color iconcolor;
  const Side_item(
      {super.key,
      required this.icon,
      required this.title,
      required this.onTap,
      this.needClose,
      required this.iconcolor});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
        onTap: () {
          onTap();
          if (needClose!) Navigator.pop(context);
        },
        child: Row(
          children: [
            Padding(
              padding: EdgeInsetsDirectional.only(
                  end: size.width / 25, start: size.width / 30),
              child: Icon(
                icon,
                color: iconcolor,
                size: 40,
              ),
            ),
            Text(
              title,
              style: TextStyle(fontSize: screenWidth(15)),
            )
          ],
        ));
  }
}
