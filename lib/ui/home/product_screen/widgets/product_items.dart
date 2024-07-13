import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:like_button/like_button.dart';

import 'dart:math';

import '../../../../domin/entity/ProductResponseEntity.dart';
import '../../../utils/add_button_widget.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/like_button.dart';

class ProductItems extends StatelessWidget {
  final ProductsEntity productsEntity;

  ProductItems({super.key, required this.productsEntity});

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
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15.r),
                        topRight: Radius.circular(15.r)),
                    child: Container(
                      color: randomColor,
                      child: CachedNetworkImage(
                        imageUrl: "${productsEntity.thumbnail}",
                        fit: BoxFit.fill,
                        width: 191.w,
                        height: MediaQuery.of(context).size.height * 0.13,
                        placeholder: (context, url) => const Center(
                            child: CircularProgressIndicator(
                          backgroundColor: AppColors.primaryColor,
                        )),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                    ),
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height * .005,
                    right: MediaQuery.of(context).size.width * .005,
                    child:  CircleAvatar(
                        backgroundColor: Colors.white,
                        // radius: MediaQuery.of(context).size.aspectRatio * 30,
                        child: Center(
                          child: LikeButtonWidget(),
                        )),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 7.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.w),
              child: Text(
                "${productsEntity.title}",
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
                "EGP ${productsEntity.price}",
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
                    "Review (${productsEntity.rating?.toStringAsFixed(1)})",
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
                  const AddButtonWidget(),
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
