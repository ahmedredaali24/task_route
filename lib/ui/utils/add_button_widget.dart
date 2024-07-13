import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_colors.dart';
class AddButtonWidget extends StatelessWidget {
  const AddButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            action: SnackBarAction(
              onPressed: () {},
              label: "close",
              textColor: Colors.white,
              // backgroundColor: AppColors.whiteColor,
            ),
            behavior: SnackBarBehavior.floating,
            backgroundColor:
            AppColors.primaryColor.withOpacity(.9),
            elevation: 0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.r)),
            duration: const Duration(milliseconds: 1000),
            content: const Center(child: Text('Add to Cart'))));
      },
      splashColor: Colors.transparent,
      child: Icon(
        Icons.add_circle,
        size: 32.sp,
        color: AppColors.primaryColor,
      ),
    );
  }
}
