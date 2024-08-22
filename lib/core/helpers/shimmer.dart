import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:corelab_app_challenge/core/config/theme/app_theme.dart';

extension ShimmerHelper on Shimmer {
  static Widget rectangular({
    required double height,
    double width = double.infinity,
    Color highlightColor = Colors.white,
    double borderRadius = 30,
    Widget? child,
  }) {
    return Shimmer.fromColors(
      baseColor: AppTheme.greyColor.withOpacity(0.4),
      highlightColor: highlightColor,
      direction: ShimmerDirection.ltr,
      period: const Duration(milliseconds: 1500),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: AppTheme.greyColor.withOpacity(0.4),
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: child,
      ),
    );
  }

  static Widget circular({
    required double size,
    Color highlightColor = Colors.white,
    Widget? child,
  }) {
    return Shimmer.fromColors(
      baseColor: AppTheme.greyColor.withOpacity(0.4),
      highlightColor: highlightColor,
      direction: ShimmerDirection.ltr,
      period: const Duration(milliseconds: 1500),
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: AppTheme.greyColor.withOpacity(0.4),
          shape: BoxShape.circle,
        ),
        child: child,
      ),
    );
  }
}
