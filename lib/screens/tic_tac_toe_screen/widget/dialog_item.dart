import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DialogItem extends StatelessWidget {
  const DialogItem({super.key, required this.image, required this.text, required this.onTap});
  final String image;
  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return  Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          text,
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: 24.sp),
        ),
        SizedBox(
          height: 10.h,
        ),
        Image.asset(image,
            width: 130.w, fit: BoxFit.cover),
        SizedBox(
          height: 20.h,
        ),
        SizedBox(
          width: double.infinity,
          child: TextButton(
            style: TextButton.styleFrom(
                backgroundColor: Colors.white
            ),
            onPressed: onTap,
            child: Text(
              "Play more",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500),
            ),
          ),
        )
      ],
    );
  }
}
