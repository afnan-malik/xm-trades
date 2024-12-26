import 'package:get/get.dart';

import '../presentations/Authentication/signin/bindings/signin_binding.dart';
import '../presentations/Authentication/signin/views/signin_view.dart';
import '../presentations/Authentication/signup/bindings/signup_binding.dart';
import '../presentations/Authentication/signup/views/signup_view.dart';
import '../presentations/Drawer/Deposit/bindings/deposit_binding.dart';
import '../presentations/Drawer/Deposit/views/deposit_view.dart';
import '../presentations/Drawer/Profile_setting/bindings/profile_setting_binding.dart';
import '../presentations/Drawer/Profile_setting/views/profile_setting_view.dart';
import '../presentations/Drawer/Referrals/bindings/referrals_binding.dart';
import '../presentations/Drawer/Referrals/views/referrals_view.dart';
import '../presentations/Drawer/Support_ticket/bindings/support_ticket_binding.dart';
import '../presentations/Drawer/Support_ticket/views/support_ticket_view.dart';
import '../presentations/Drawer/Transactions/bindings/transactions_binding.dart';
import '../presentations/Drawer/Transactions/views/transactions_view.dart';
import '../presentations/Drawer/WithDraw/bindings/with_draw_binding.dart';
import '../presentations/Drawer/WithDraw/views/with_draw_view.dart';
import '../presentations/Drawer/change_password/bindings/change_password_binding.dart';
import '../presentations/Drawer/change_password/views/change_password_view.dart';
import '../presentations/Drawer/investment/bindings/investment_binding.dart';
import '../presentations/Drawer/investment/views/investment_view.dart';
import '../presentations/home/bindings/home_binding.dart';
import '../presentations/home/views/home_view.dart';
import '../presentations/splash/bindings/splash_screen_binding.dart';
import '../presentations/splash/views/splash_screen_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH_SCREEN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SIGNUP,
      page: () => const SignupView(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: _Paths.SIGNIN,
      page: () => const SigninView(),
      binding: SigninBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH_SCREEN,
      page: () => const SplashScreenView(),
      binding: SplashScreenBinding(),
    ),
    GetPage(
      name: _Paths.INVESTMENT,
      page: () => const InvestmentView(),
      binding: InvestmentBinding(),
    ),
    GetPage(
      name: _Paths.DEPOSIT,
      page: () => const DepositView(),
      binding: DepositBinding(),
    ),
    GetPage(
      name: _Paths.WITH_DRAW,
      page: () => const WithDrawView(),
      binding: WithDrawBinding(),
    ),
    GetPage(
      name: _Paths.CHANGE_PASSWORD,
      page: () => const ChangePasswordView(),
      binding: ChangePasswordBinding(),
    ),
    GetPage(
      name: _Paths.TRANSACTIONS,
      page: () => const TransactionsView(),
      binding: TransactionsBinding(),
    ),
    GetPage(
      name: _Paths.REFERRALS,
      page: () => const ReferralsView(),
      binding: ReferralsBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE_SETTING,
      page: () => const ProfileSettingView(),
      binding: ProfileSettingBinding(),
    ),
    GetPage(
      name: _Paths.SUPPORT_TICKET,
      page: () => const SupportTicketView(),
      binding: SupportTicketBinding(),
    ),
  ];
}
