import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

import 'app_colors.dart';

class LikeButtonWidget extends StatelessWidget {
  const LikeButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return LikeButton(
      // size: 50,
      circleColor: const CircleColor(start: Colors.red, end: Colors.blue),
      bubblesColor: const BubblesColor(
        dotPrimaryColor: Colors.pink,
        dotSecondaryColor: Colors.white,
      ),
      likeBuilder: (bool isLiked) {
        return isLiked
            ? const Icon(
                size: 30,
                Icons.favorite_rounded,
                color: AppColors.primaryColor,
              )
            : const Icon(
                Icons.favorite_border_rounded,
                color: AppColors.primaryColor,
              );
      },
    );
  }
}
