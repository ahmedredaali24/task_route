import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app_colors.dart';

class LikeButtonWidget extends StatefulWidget {
  final int productId;

  const LikeButtonWidget({super.key, required this.productId});

  @override
  State<LikeButtonWidget> createState() => _LikeButtonWidgetState();
}

class _LikeButtonWidgetState extends State<LikeButtonWidget> {
  bool _isLiked = false;

  Future<void> _loadLikeStatus() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _isLiked = prefs.getBool(widget.productId.toString()) ?? false;
    });
  }

  Future<void> _saveLikeStatus(bool isLiked) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(widget.productId.toString(), isLiked);
  }

  @override
  void initState() {
    super.initState();
    _loadLikeStatus();
  }

  @override
  Widget build(BuildContext context) {
    return LikeButton(
      isLiked: _isLiked,
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
      onTap: (bool isLiked) async {
        final newStatus = !isLiked;
        await _saveLikeStatus(newStatus);
        setState(() {
          _isLiked = newStatus;
        });
        return newStatus;
      },
    );
  }
}
