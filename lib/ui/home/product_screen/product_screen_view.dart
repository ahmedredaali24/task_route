import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:task_route/ui/home/product_screen/widgets/product_items.dart';

import '../../utils/app_colors.dart';
import '../../utils/custom_text_field_search.dart';

class ProductScreenView extends StatelessWidget {
  static const String routeName = "ProductScreenView";

  ProductScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 17.w),
          child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10.h,
                ),
                Text("route",
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: AppColors.blueColor, fontFamily: "route_font")),
                SizedBox(
                  height: 18.h,
                ),
                Row(children: [
                  const Expanded(
                    child: CustomTextFieldSearch(),
                  ),
                  SizedBox(
                    width: 24.w,
                  ),
                  InkWell(
                      onTap: () {},
                      child: Icon(
                        Icons.shopping_cart_outlined,
                        color: AppColors.primaryColor,
                        size: 28.sp,
                      )),
                ]),
                SizedBox(
                  height: 24.h,
                ),
                Expanded(
                  child: GridView.builder(
                    itemCount: 10,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: (2 / 2.4),
                        crossAxisSpacing: 16.w,
                        mainAxisSpacing: 16.h),
                    itemBuilder: (context, index) {
                      return InkWell(
                        splashColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () {},
                        child: ProductItems(),
                      );
                    },
                  ),
                )
              ]),
        ),
      ),
    );
  }
}
