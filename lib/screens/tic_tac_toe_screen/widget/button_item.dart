import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tic_tac_toe/utils/colors/app_colors.dart';

class ButtonItem extends StatelessWidget {
  const ButtonItem({super.key, required this.icon});
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.w),
      padding: EdgeInsets.all(10.w),
      decoration: BoxDecoration(
          color: AppColors.cF5F5F5F,
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(color: AppColors.c5D5FEF, width: 3)),
      child: Center(
        child: Container(
          padding: EdgeInsets.all(10.w),
          decoration: BoxDecoration(
              color: Colors.purpleAccent.withOpacity(0.8),
              borderRadius: BorderRadius.circular(50.r)),
          child: icon
        ),
      ),
    );
  }
}
