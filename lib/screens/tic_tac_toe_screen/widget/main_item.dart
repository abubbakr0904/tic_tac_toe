import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tic_tac_toe/utils/colors/app_colors.dart';

class MainItem extends StatelessWidget {
  const MainItem({super.key, required this.board});
  final String board;


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.w),
      decoration: BoxDecoration(
          color: AppColors.cF5F5F5F,
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(
              color: board == ""
                  ? Colors.white.withOpacity(0.0)
                  : AppColors.c5D5FEF,
              width: 3)),
      child: Center(
        child: board != ""
            ? Container(
          padding: EdgeInsets.all(10.w),
          decoration: BoxDecoration(
              color: Colors.purpleAccent.withOpacity(0.8),
              borderRadius: BorderRadius.circular(50.r)),
          child: Icon(
            board == "X"
                ? Icons.close
                : Icons.circle_outlined,
            color: Colors.white,
            size: 40.sp,
          ),
        )
            : const SizedBox(),
      ),
    );
  }
}
