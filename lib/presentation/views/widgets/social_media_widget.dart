import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:qr_recipes/app/functions.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../services/dependencies.dart';
import '../../resources/colors_manager.dart';
import '../../resources/strings_manager.dart';
import '../../resources/styles_manager.dart';

class SocialMediaWidget extends StatelessWidget {
  final String platform;
  final String username;
  final String target;

  const SocialMediaWidget({
    super.key,
    required this.platform,
    required this.username,
    required this.target,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          if (platform == 'phone') {
            AppFunctions.callPhoneNumber(target);
          } else if (platform == 'whatsapp') {
            AppFunctions.openWhatsapp(target);
          } else {
            AppFunctions.launchURL(target);
          }
        },
        child: Padding(
          padding: EdgeInsets.all(16.sp),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                getPlatformIcon(platform),
                color: AppColors.mainColor[DependenciesService.getAppStyle()]!,
                size: 22.sp,
              ),
              SizedBox(width: 14.sp),
              Padding(
                padding: EdgeInsets.only(top: 6.sp),
                child: Text(
                  getPlatformName(platform),
                  style: getMediumStyle(
                      fontSize: 17.sp,
                      color: AppColors
                          .mainColor[DependenciesService.getAppStyle()]!),
                ),
              ),
              const Expanded(child: SizedBox(width: 0)),
              Padding(
                padding: EdgeInsets.only(top: 6.sp),
                child: Text(
                  username,
                  style: getMediumStyle(
                      fontSize: 15.sp,
                      color: AppColors
                          .mainColor[DependenciesService.getAppStyle()]!
                          .withOpacity(0.5)),
                  textDirection: TextDirection.ltr,
                ),
              ),
              SizedBox(width: 10.sp),
              Icon(
                Icons.arrow_forward_ios,
                color: AppColors.mainColor[DependenciesService.getAppStyle()]!,
                size: 16.sp,
              ),
            ],
          ),
        ),
      ),
    );
  }

  String getPlatformName(String platform) {
    switch (platform) {
      case 'facebook':
        return AppStrings.facebook[DependenciesService.getLanguageIso()]!;
      case 'instagram':
        return AppStrings.instagram[DependenciesService.getLanguageIso()]!;
      case 'youtube':
        return AppStrings.youtube[DependenciesService.getLanguageIso()]!;
      case 'tiktok':
        return AppStrings.tiktok[DependenciesService.getLanguageIso()]!;
      case 'x':
        return AppStrings.x[DependenciesService.getLanguageIso()]!;
      case 'snapchat':
        return AppStrings.snapchat[DependenciesService.getLanguageIso()]!;
      case 'whatsapp':
        return AppStrings.whatsapp[DependenciesService.getLanguageIso()]!;
      case 'website':
        return AppStrings.website[DependenciesService.getLanguageIso()]!;
      case 'googleplay':
        return AppStrings.googleplay[DependenciesService.getLanguageIso()]!;
      case 'appstore':
        return AppStrings.appstore[DependenciesService.getLanguageIso()]!;
      case 'phone':
        return AppStrings.phone[DependenciesService.getLanguageIso()]!;
      default:
        return AppStrings.more[DependenciesService.getLanguageIso()]!;
    }
  }

  IconData getPlatformIcon(String platform) {
    switch (platform) {
      case 'facebook':
        return FontAwesomeIcons.facebook;
      case 'instagram':
        return FontAwesomeIcons.instagram;
      case 'youtube':
        return FontAwesomeIcons.youtube;
      case 'tiktok':
        return FontAwesomeIcons.tiktok;
      case 'x':
        return FontAwesomeIcons.x;
      case 'snapchat':
        return FontAwesomeIcons.snapchat;
      case 'whatsapp':
        return FontAwesomeIcons.whatsapp;
      case 'website':
        return FontAwesomeIcons.globe;
      case 'googleplay':
        return FontAwesomeIcons.googlePlay;
      case 'appstore':
        return FontAwesomeIcons.appStore;
      case 'phone':
        return FontAwesomeIcons.phone;
      default:
        return Icons.more_horiz;
    }
  }
}
