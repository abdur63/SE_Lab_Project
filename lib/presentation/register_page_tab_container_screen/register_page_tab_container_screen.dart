import 'package:discordcloneapp/core/app_export.dart';
import 'package:discordcloneapp/presentation/register_page/register_page.dart';
import 'package:flutter/material.dart';

class RegisterPageTabContainerScreen extends StatefulWidget {
  const RegisterPageTabContainerScreen({Key? key})
      : super(
          key: key,
        );

  @override
  RegisterPageTabContainerScreenState createState() =>
      RegisterPageTabContainerScreenState();
}

class RegisterPageTabContainerScreenState
    extends State<RegisterPageTabContainerScreen>
    with TickerProviderStateMixin {
  late TabController tabviewController;

  @override
  void initState() {
    super.initState();
    tabviewController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            children: [
              CustomImageView(
                svgPath: ImageConstant.imgArrow1,
                height: 2.v,
                width: 20.h,
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(
                  left: 23.h,
                  top: 89.v,
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 86.h,
                    top: 28.v,
                  ),
                  child: Text(
                    "Enter phone or email",
                    style: theme.textTheme.headlineSmall,
                  ),
                ),
              ),
              SizedBox(height: 27.v),
              Container(
                height: 40.v,
                width: 392.h,
                decoration: BoxDecoration(
                  color: appTheme.blueGray100,
                  borderRadius: BorderRadius.circular(
                    5.h,
                  ),
                ),
                child: TabBar(
                  controller: tabviewController,
                  labelPadding: EdgeInsets.zero,
                  labelColor: appTheme.black900,
                  labelStyle: TextStyle(
                    fontSize: 16.fSize,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                  ),
                  unselectedLabelColor: appTheme.gray700,
                  unselectedLabelStyle: TextStyle(
                    fontSize: 16.fSize,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                  ),
                  indicatorPadding: EdgeInsets.all(
                    4.0.h,
                  ),
                  indicator: BoxDecoration(
                    color: theme.colorScheme.onPrimary,
                    borderRadius: BorderRadius.circular(
                      5.h,
                    ),
                  ),
                  tabs: [
                    Tab(
                      child: Text(
                        "Phone",
                      ),
                    ),
                    Tab(
                      child: Text(
                        "Email",
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 709.v,
                child: TabBarView(
                  controller: tabviewController,
                  children: [
                    RegisterPage(),
                    RegisterPage(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
