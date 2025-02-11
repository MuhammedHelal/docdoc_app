import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class ValidationRow extends StatelessWidget {
  const ValidationRow({super.key, required this.title, required this.isValid});
  final String title;
  final bool isValid;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          isValid ? Icons.check : Icons.close,
          color: isValid ? Colors.green : Colors.red,
        ),
        Gap(5.h),
        Text(
          title,
          style: TextStyle(
            fontSize: 13.sp,
            overflow: TextOverflow.ellipsis,
            decoration:
                isValid ? TextDecoration.lineThrough : TextDecoration.none,
            decorationStyle: TextDecorationStyle.solid,
            decorationThickness: 1,
            decorationColor: Colors.grey,
            color: isValid ? Colors.green : Colors.red,
          ),
        ),
      ],
    );
  }
}
