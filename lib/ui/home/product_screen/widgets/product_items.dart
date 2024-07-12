import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:like_button/like_button.dart';

import 'dart:math';

import '../../../utils/app_colors.dart';

class ProductItems extends StatelessWidget {


  ProductItems({super.key});

  final randomColor =
      Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(.35);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 191.w,
      height: 237.h,
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(
          color: AppColors.primaryColor,
          width: 1,
        ),
      ),
      child: SingleChildScrollView(

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15.r),
                      topRight: Radius.circular(15.r)),
                  child: Container(
                    color: randomColor,
                    child:Image.network(
                      "",
                      fit: BoxFit.fill,
                      width: double.infinity,
                      height: 115.h,
                    ),
                  ),
                ),
                Positioned(
                  top: 5.h,
                  right: 1.w,
                  child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 20.r,
                      child: Center(
                        child: LikeButton(
                          circleColor: const CircleColor(
                              start: Colors.red, end: Colors.blue),
                          bubblesColor: const BubblesColor(
                            dotPrimaryColor: Colors.pink,
                            dotSecondaryColor: Colors.white,
                          ),
                          likeBuilder: (bool isLiked) {
                            return isLiked
                                ? Icon(
                                    size: 30.sp,
                                    Icons.favorite_rounded,
                                    color: AppColors.primaryColor,
                                  )
                                : const Icon(
                                    Icons.favorite_border_rounded,
                                    color: AppColors.primaryColor,
                                  );
                          },
                        ),
                      )),
                )
              ],
            ),
            SizedBox(
              height: 7.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.w),
              child: Text(
                'title',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      fontSize: 15.sp,
                      color: AppColors.blackColor,
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ),
            SizedBox(
              height: 7.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.w),
              child: Text(
                "EGP price",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      fontSize: 14.sp,
                      color: AppColors.blackColor,
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ),
            SizedBox(
              height: 7.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.0.w, right: 8.w),
              child: Row(
                children: [
                  Text(
                    "Review (rating)",
                    maxLines: 1,
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          fontSize: 14.sp,
                          color: AppColors.blackColor,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  SizedBox(
                    width: 7.w,
                  ),
                  Icon(
                    Icons.star,
                    size: 20.w,
                    color: AppColors.yellowColor,
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  InkWell(
                    onTap: () {
                      //todo: add to cart

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
                  )
                ],
              ),
            )
            // GridViewCardItemBody(
            //   productEntity: productEntity,
            // )
          ],
        ),
      ),
    );
  }
}
