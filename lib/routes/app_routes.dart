import 'package:get/get.dart';
import 'package:loanapp/presentation/application_status_one_screen/application_status_one_screen.dart';
import 'package:loanapp/presentation/application_status_one_screen/binding/application_status_one_screen_binding.dart';
import 'package:loanapp/presentation/create_an_account_screen/binding/create_an_account_screen_binding.dart';
import 'package:loanapp/presentation/create_an_account_screen/create_an_account_screen.dart';
import 'package:loanapp/presentation/detail_four_screen/binding/detail_four_screen_binding.dart';
import 'package:loanapp/presentation/detail_four_screen/detail_four_screen.dart';
import 'package:loanapp/presentation/detail_one_screen/binding/detail_one_screen_binding.dart';
import 'package:loanapp/presentation/detail_one_screen/detail_one_screen.dart';
import 'package:loanapp/presentation/detail_three_screen/binding/detail_three_screen_binding.dart';
import 'package:loanapp/presentation/detail_three_screen/detail_three_screen.dart';
import 'package:loanapp/presentation/loan_calculator_screen/binding/loan_calculator_screen_binding.dart';
import 'package:loanapp/presentation/loan_calculator_screen/loan_calculator_screen.dart';
import 'package:loanapp/presentation/offer_screen/binding/offer_screen_binding.dart';
import 'package:loanapp/presentation/offer_screen/offer_screen.dart';
import 'package:loanapp/presentation/otp_screen/binding/otp_screen_binding.dart';
import 'package:loanapp/presentation/otp_screen/otp_screen.dart';
import 'package:loanapp/presentation/password_screen/binding/password_screen_binding.dart';
import 'package:loanapp/presentation/password_screen/password_screen.dart';
import 'package:loanapp/presentation/sign_in_screen/binding/sign_in_screen_binding.dart';
import 'package:loanapp/presentation/sign_in_screen/sign_in_screen.dart';
import 'package:loanapp/presentation/splash_screen/binding/splash_screen_binding.dart';
import 'package:loanapp/presentation/splash_screen/splash_screen.dart';

class AppRoutes {
  static const String splashScreen = '/splash_screen';
  static const String createAnAccountScreen = '/create_an_account_screen';
  static const String otpScreen = '/otp_screen';
  static const String passwordScreen = '/password_screen';
  static const String signInScreen = '/sign_in_screen';
  static const String detailsScreen = '/details_screen';
  static const String detailsOneScreen = '/details_one_screen';
  static const String detailsTwoScreen = '/details_two_screen';
  static const String detailsThreeScreen = '/details_three_screen';
  static const String detailsFourScreen = '/details_four_screen';
  static const String loanCalculatorScreen = '/loan_calculator_screen';
  static const String offerScreen = '/offer_screen';
  static const String applicationStatusOneScreen =
      '/application_status_one_screen';
  static const String appNavigationScreen = '/app_navigation_screen';
  static const String initialRoute = splashScreen;

  static List<GetPage> pages = [
    GetPage(
      name: splashScreen,
      page: () => SplashScreen(),
      binding: SplashScreenBinding(),
    ),
    GetPage(
      name: createAnAccountScreen,
      page: () => CreateAnAccountScreen(),
      binding: CreateAnAccountScreenBinding(),
    ),
    GetPage(
      name: otpScreen,
      page: () => OtpScreen(),
      binding: OtpScreenBinding(),
    ),
    GetPage(
      name: passwordScreen,
      page: () => PasswordScreen(),
      binding: PasswordScreenBinding(),
    ),
    GetPage(
      name: signInScreen,
      page: () => SignInScreen(),
      binding: SignInScreenBinding(),
    ),
    GetPage(
      name: detailsOneScreen,
      page: () => DetailsOneScreen(),
      binding: DetailOneScreenBinding(),
    ),
    GetPage(
      name: detailsThreeScreen,
      page: () => DetailsThreeScreen(),
      binding: DetailThreeScreenBinding(),
    ),
    GetPage(
      name: detailsFourScreen,
      page: () => DetailsFourScreen(),
      binding: DetailFourScreenBinding(),
    ),
    GetPage(
      name: loanCalculatorScreen,
      page: () => LoanCalculatorScreen(),
      binding: LoanCalculatorScreenBinding(),
    ),
    GetPage(
      name: offerScreen,
      page: () => OfferScreen(),
      binding: OfferScreenBinding(),
    ),
    GetPage(
      name: applicationStatusOneScreen,
      page: () => ApplicationStatusOneScreen(),
      binding: ApplicationStatusOneScreenBinding(),
    ),
  ];
}
