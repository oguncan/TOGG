import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:togg/common/common.dart';
import 'package:togg/components/border_button_with_bg.dart';
import 'package:togg/pages/pages.dart';
import 'package:togg/utils/utils.dart';

class LoginScreen extends GetView<LoginController> {

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(builder: (controller) {
      return WillPopScope(
          onWillPop: () async {
            return false;
          },
          child: SafeArea(
            child: Obx(() => Scaffold(
                resizeToAvoidBottomInset: false,
                body: Form(
                  autovalidateMode: controller.isFirstClicked.value ? AutovalidateMode.always : AutovalidateMode.disabled,
                  key: controller.loginFormKey,
                  child: Padding(
                    padding: const EdgeInsets.all(AppSizes.default_margin_size),
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextFormField(
                            key: Key("userNameField"),
                            keyboardType: TextInputType.text,
                            controller: controller.loginUsernameTextController,
                            validator: (value) => validateNameField(value!),
                            autocorrect: false,
                            minLines: 1,
                            style: CustomTextStyle.smallText(context).copyWith(
                                color: AppColors.black
                            ),
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              labelText: "Username",
                              labelStyle: CustomTextStyle.smallText(context).copyWith(
                                  color: AppColors.gray,
                                  fontSize: 14
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: AppColors.black, width: 1.0),
                              ),
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: AppColors.gray, width: 1.0),
                              ),
                              errorBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: AppColors.black,
                                    width: 1.0),
                              ),
                              focusedErrorBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: AppColors.black,
                                    width: 1.0),
                              ),
                              hintText: 'Username',
                            ),
                          ),
                          const SizedBox(height: AppSizes.default_margin_size),
                          TextFormField(
                            key: Key("passwordField"),
                            keyboardType: TextInputType.text,
                            obscureText: controller.obscured.value,
                            controller: controller.loginPasswordTextController,
                            autocorrect: false,
                            validator: (value) => validatePassword(value!),
                            minLines: 1,
                            style: CustomTextStyle.smallText(context).copyWith(
                                color: AppColors.black
                            ),
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              suffixIcon: Padding(
                                padding: const EdgeInsets.fromLTRB(0, 0, 4, 0),
                                child: GestureDetector(
                                  onTap: controller.setToggleObscured,
                                  child: Icon(
                                    controller.obscured.value
                                        ? Icons.visibility_rounded
                                        : Icons.visibility_off_rounded,
                                    size: 24,
                                  ),
                                ),
                              ),
                              labelText: "Password",
                              labelStyle: CustomTextStyle.smallText(context).copyWith(
                                  color: AppColors.gray,
                                  fontSize: 14
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: AppColors.black, width: 1.0),
                              ),
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: AppColors.gray, width: 1.0),
                              ),
                              errorBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: AppColors.black,
                                    width: 1.0),
                              ),
                              focusedErrorBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: AppColors.black,
                                    width: 1.0),
                              ),
                              hintText: 'Password',
                            ),
                          ),
                          const SizedBox(height: AppSizes.default_margin_size),
                          BorderButtonWithBackgroundColor(
                            key: Key("loginButton"),
                            text: "Login",
                            color: AppColors.toggColor,
                            textColor: AppColors.white,
                            borderColor: AppColors.toggColor,
                            style: CustomTextStyle.mediumText(context),
                            onClickAction: () {
                              controller.routeController.sendFirebaseEventMessage("login_click", null);
                              controller.isFirstClicked.value = true;
                              controller.validateController();
                            },)
                        ],
                      ),
                    ),
                  ),
                )
            )),
          ));
    });
  }
}
