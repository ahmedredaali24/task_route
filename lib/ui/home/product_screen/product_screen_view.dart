import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:task_route/ui/home/product_screen/widgets/product_items.dart';

import '../../../domin/dependency_injection.dart';
import '../../utils/app_colors.dart';
import '../../utils/custom_text_field_search.dart';
import 'cubit/product_screen_states.dart';
import 'cubit/product_screen_view_model.dart';

class ProductScreenView extends StatelessWidget {
  static const String routeName = "ProductScreenView";

  ProductScreenView({super.key});

  final ProductScreenViewModel viewModel =
      ProductScreenViewModel(getProductUseCase: injectGetProductUseCase());

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductScreenViewModel, ProductScreenStates>(
        bloc: viewModel..getProducts(),
        builder: (context, state) {
          return Scaffold(
            body: RefreshIndicator(
              color: AppColors.primaryColor,

              onRefresh:  viewModel.refreshProducts,
              child: SafeArea(
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
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(
                                    color: AppColors.blueColor,
                                    fontFamily: "route_font")),
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
                        state is ProductScreenLoadingState
                            ? Expanded(
                              child: Center(
                                  child: SizedBox(
                                    height:
                                        MediaQuery.of(context).size.height * 0.5,
                                    child: Lottie.asset(
                                      "assets/animation/lodaing.json",
                                      width: 200.w,
                                    ),
                                  ),
                                ),
                            )
                            : state is ProductScreenSuccessState
                                ? Expanded(
                                    child: GridView.builder(
                                      itemCount: viewModel.productList.length,
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
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
                                          child: ProductItems(
                                            productsEntity:
                                                viewModel.productList[index],
                                          ),
                                        );
                                      },
                                    ),
                                  )
                                : state is ProductScreenErrorState
                                    ? Expanded(
                                      child: Center(

                                          child: SizedBox(
                                            height: 500.h,
                                            child: Lottie.asset(
                                              "assets/animation/error.json",
                                              width: 200.w,
                                            ),
                                          ),
                                        ),
                                    )
                                    : Container()
                      ]),
                ),
              ),
            ),
          );
        });
  }
}
