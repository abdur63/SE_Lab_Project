import 'package:flutter/material.dart';
import 'package:discordcloneapp/presentation/front_page_screen/front_page_screen.dart';
import 'package:discordcloneapp/presentation/register_page_tab_container_screen/register_page_tab_container_screen.dart';
import 'package:discordcloneapp/presentation/app_navigation_screen/app_navigation_screen.dart';

class AppRoutes {
  static const String frontPageScreen = '/front_page_screen';

  static const String registerPage = '/register_page';

  static const String registerPageTabContainerScreen =
      '/register_page_tab_container_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static Map<String, WidgetBuilder> routes = {
    frontPageScreen: (context) => FrontPageScreen(),
    registerPageTabContainerScreen: (context) =>
        RegisterPageTabContainerScreen(),
    appNavigationScreen: (context) => AppNavigationScreen()
  };
}
