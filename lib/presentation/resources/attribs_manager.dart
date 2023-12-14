import 'dart:ui';

import 'package:responsive_sizer/responsive_sizer.dart';

import '../../services/dependencies.dart';
import 'colors_manager.dart';

class ImageSkeletonAttributes {
  static Color baseColor =
      AppColors.mainColor[DependenciesService.getAppStyle()]!.withOpacity(0.25);
  static Color highlightColor =
      AppColors.mainColor[DependenciesService.getAppStyle()]!.withOpacity(0.50);
}

class TimelineCardAttributes {
  static Color backgroundColor =
      AppColors.cardBackgroundColor[DependenciesService.getAppStyle()]!;
  static double elevation = 2;
  static double padding = 18.sp;
}

class TimelineAvatarAttributes {
  static double width = 28.sp;
  static double height = 28.sp;
  static double borderDistance = 9.sp;
  static double borderWidth = 4.sp;
  static Color borderColor =
      AppColors.mainColor[DependenciesService.getAppStyle()]!;
  static double imageRadius = 100.sp;
  static double borderRadius = 100.sp;
}
