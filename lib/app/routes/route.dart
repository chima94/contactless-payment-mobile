import 'package:contactless_payment_app/app/bloc/app_state.dart';
import 'package:contactless_payment_app/screens/home/view/home_page.dart';
import 'package:contactless_payment_app/screens/login/view/login_page.dart';
import 'package:contactless_payment_app/screens/splash/splash.dart';
import 'package:flutter/material.dart';

List<Page> onGenerateAppViewPages(AppStatus status, List<Page<dynamic>> pages) {
  switch (status) {
    case AppStatus.unauthenticated:
      return [LoginPage.page()];
    case AppStatus.authenticated:
      return [HomePage.page()];
    case AppStatus.appStarted:
      return [SplashPage.page()];
  }
}
