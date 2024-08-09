import 'package:empty_code/ui/shared/colors.dart';
import 'package:flutter/material.dart';

class Nav_Item extends StatelessWidget {
  final IconData icon;
  final bool isSelected;
  final Function onTap;
  const Nav_Item(
      {super.key,
      required this.icon,
      this.isSelected = false,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Container(
          decoration: BoxDecoration(
              border: isSelected
                  ? Border(
                      bottom: BorderSide(
                      color: AppColors.whiteColor,
                      width: 4,
                    ))
                  : null),
          child: Icon(
            icon,
            size: 50,
            color: isSelected ? AppColors.whiteColor : AppColors.GreenApp,
          )),
    );
  }
}
