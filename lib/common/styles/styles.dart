import 'package:flutter/material.dart';
import 'package:togg/common/common.dart';


class CustomTextStyle {

  static TextStyle largeText(BuildContext context) {
    return Theme.of(context).textTheme.bodyText1!.copyWith(
      fontSize: AppSizes.large_text_size,
      color: AppColors.color_blue_black,
      fontFamily: "Inter",
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle mediumText(BuildContext context) {
    return Theme.of(context).textTheme.bodyText1!.copyWith(
      fontSize: AppSizes.medium_text_size,
      fontFamily: "Inter",
      color: AppColors.color_blue_black,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle smallText(BuildContext context) {
    return Theme.of(context).textTheme.bodyText1!.copyWith(
      fontSize: AppSizes.small_text_size,
      color: AppColors.color_blue_black,
      fontWeight: FontWeight.w500,
      fontFamily: "Inter",
    );
  }

  static TextStyle extraSmallText(BuildContext context) {
    return Theme.of(context).textTheme.bodyText1!.copyWith(
      fontSize: AppSizes.extra_small_text_size,
      color: AppColors.color_blue_black,
      fontWeight: FontWeight.w400,
      fontFamily: "Inter",
    );
  }

  static TextStyle extraExtraSmallText(BuildContext context) {
    return Theme.of(context).textTheme.bodyText1!.copyWith(
      fontSize: AppSizes.extra_extra_small_size,
      color: AppColors.color_blue_black,
      fontWeight: FontWeight.w400,
      fontFamily: "Inter",
    );
  }

}