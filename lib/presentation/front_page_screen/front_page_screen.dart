import 'package:discordcloneapp/core/app_export.dart';
import 'package:discordcloneapp/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import '/presentation/register_page/register_page.dart';

class FrontPageScreen extends StatelessWidget {
  const FrontPageScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(
            horizontal: 18.h,
            vertical: 31.v,
          ),
          child: Column(
            children: [
              SizedBox(height: 41.v),
              CustomImageView(
                svgPath: ImageConstant.imgDiscordlogolarge,
                height: 69.v,
                width: 307.h,
              ),
              Spacer(),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 66.h),
                  child: Text(
                    "Welcome to Discord",
                    style: theme.textTheme.headlineSmall,
                  ),
                ),
              ),
              Container(
                width: 359.h,
                margin: EdgeInsets.only(
                  left: 24.h,
                  top: 17.v,
                  right: 7.h,
                ),
                child: Text(
                  "Join over 100 million people who use Discord to talk with communities and friends.",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: CustomTextStyles.bodyLargeInterBlack900,
                ),
              ),
              SizedBox(height: 92.v),
              CustomElevatedButton(
                  text: "Register",
                  onTap: () {
                    // Navigation.intentWithClearAllRoutes(
                    //     context, AppRoutes.REGISTER_SCREEN);
                  }),
              SizedBox(height: 22.v),
              CustomElevatedButton(
                text: "Log In",
                isDisabled: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
