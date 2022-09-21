import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kitchen/utlits/app_constant.dart';

class ToggleButton extends StatefulWidget {
  const ToggleButton({Key? key, required this.isSelected, required this.text})
      : super(key: key);

  final bool isSelected;
  final String text;

  @override
  State<ToggleButton> createState() => _ToggleButtonState();
}

class _ToggleButtonState extends State<ToggleButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 37.w,
      padding: const EdgeInsets.all(10),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: widget.isSelected ? AppColors.yellow : Colors.transparent,
          borderRadius: BorderRadius.circular(16.r)),
      child: Text(widget.text,
          style: TextStyle(
              color: widget.isSelected ? Colors.black : AppColors.greyFont)),
    );
  }
}
