import 'package:flutter/material.dart';

import '../common.dart';

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

  static TextStyle productClassicTagTextStyle(BuildContext context) {
    return Theme.of(context).textTheme.bodyText1!.copyWith(
      fontSize: AppSizes.extra_small_text_size,
      color: AppColors.white,
      fontWeight: FontWeight.w400,
      fontFamily: "Inter",
    );
  }

  static TextStyle productCardDiscountTextStyle(BuildContext context) {
    return Theme.of(context).textTheme.headline6!.copyWith(
      fontSize: AppSizes.h6_text_size,
      color: AppColors.white,
      fontWeight: FontWeight.w400,
      fontFamily: "Inter",
    );
  }

  static TextStyle productCurrentPriceTextStyle(BuildContext context){
    return Theme.of(context).textTheme.headline3!.copyWith(
      fontSize: AppSizes.h3_text_size,
      color: AppColors.black,
      fontWeight: FontWeight.w500,
      fontFamily: "Inter",
    );
  }

  static TextStyle productDiscountPriceTextStyle(BuildContext context){
    return Theme.of(context).textTheme.headline3!.copyWith(
      fontSize: AppSizes.extra_extra_small_size,
      color: AppColors.color_dark_gray,
      fontWeight: FontWeight.w400,
      decoration: TextDecoration.lineThrough,
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

  static TextStyle generalFilterTitleTextStyle(BuildContext context){
    return Theme.of(context).textTheme.headline3!.copyWith(
      fontSize: AppSizes.large_text_size,
      color: AppColors.color_dark_black,
      fontWeight: FontWeight.w600,
      fontFamily: "Inter",
    );
  }

  static TextStyle productDiscoverButtonTextStyle(BuildContext context){
    return Theme.of(context).textTheme.headline5!.copyWith(
      fontSize: AppSizes.small_text_size,
      color: AppColors.color_dark_black,
      fontWeight: FontWeight.w600,
      fontFamily: "Inter",
    );
  }

  static TextStyle productMostSoldCardTextStyle(BuildContext context){
    return Theme.of(context).textTheme.headline5!.copyWith(
      fontSize: AppSizes.medium_text_size,
      color: AppColors.color_dark_black,
      fontWeight: FontWeight.w500,
      fontFamily: "Inter",
    );
  }
}