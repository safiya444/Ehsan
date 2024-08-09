import 'package:empty_code/core/enums/bottom_navigation_bar.dart';
import 'package:empty_code/ui/shared/colors.dart';
import 'package:empty_code/ui/views/main/nav_item.dart';
import 'package:flutter/material.dart';

class CustomBottomNvigation extends StatefulWidget {
  final BottomNavigationEnum selectedView;
  final Function(BottomNavigationEnum, int) onTap;
  const CustomBottomNvigation(
      {super.key, required this.selectedView, required this.onTap});

  @override
  State<CustomBottomNvigation> createState() => _CustomBottomNvigationState();
}

class _CustomBottomNvigationState extends State<CustomBottomNvigation> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.GreenLightApp,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Nav_Item(
              icon: Icons.home_outlined,
              isSelected: widget.selectedView == BottomNavigationEnum.Home,
              onTap: () {
                widget.onTap(BottomNavigationEnum.Home, 0);
              }),
          Nav_Item(
              icon: Icons.add,
              isSelected:
                  widget.selectedView == BottomNavigationEnum.POSTTHEREQUEST,
              onTap: () {
                widget.onTap(BottomNavigationEnum.POSTTHEREQUEST, 1);
              }),
          Nav_Item(
              icon: Icons.settings,
              isSelected: widget.selectedView == BottomNavigationEnum.SETTINGS,
              onTap: () {
                widget.onTap(BottomNavigationEnum.SETTINGS, 2);
              }),
        ],
      ),
    );
  }
}
