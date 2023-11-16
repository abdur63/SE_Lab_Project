import 'package:discordcloneapp/core/app_export.dart';
import 'package:discordcloneapp/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key})
      : super(
          key: key,
        );

  @override
  RegisterPageState createState() => RegisterPageState();
}

class RegisterPageState extends State<RegisterPage>
    with AutomaticKeepAliveClientMixin<RegisterPage> {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: mediaQueryData.size.width,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: 22.h,
                    top: 42.v,
                    right: 18.h,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "PHONE NUMBER",
                        style: CustomTextStyles.titleSmallOnPrimaryContainer,
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          left: 1.h,
                          top: 12.v,
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 16.h),
                        decoration: AppDecoration.fillBlueGray.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder5,
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                top: 11.v,
                                bottom: 13.v,
                              ),
                              child: Text(
                                "PK +92",
                                style: theme.textTheme.titleLarge,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 18.h),
                              child: SizedBox(
                                height: 49.v,
                                child: VerticalDivider(
                                  width: 2.h,
                                  thickness: 2.v,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: 22.h,
                                top: 11.v,
                                bottom: 16.v,
                              ),
                              child: Text(
                                "PHONE NUMBER",
                                style: theme.textTheme.titleMedium,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 6.h,
                          top: 20.v,
                        ),
                        child: Text(
                          "View our Privacy Policy",
                          style: theme.textTheme.bodyLarge,
                        ),
                      ),
                      CustomElevatedButton(
                        height: 49.v,
                        text: "Next",
                        margin: EdgeInsets.only(
                          left: 1.h,
                          top: 40.v,
                        ),
                        buttonStyle: CustomButtonStyles.fillIndigoATL5,
                        buttonTextStyle: CustomTextStyles.titleLargeBluegray50,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
