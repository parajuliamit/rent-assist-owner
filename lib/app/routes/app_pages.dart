import 'package:get/get.dart';

import '../modules/account/change_password/bindings/change_password_binding.dart';
import '../modules/account/change_password/views/change_password_view.dart';
import '../modules/account/edit_profile/bindings/edit_profile_binding.dart';
import '../modules/account/edit_profile/views/edit_profile_view.dart';
import '../modules/add_tenant/bindings/add_tenant_binding.dart';
import '../modules/add_tenant/views/add_tenant_view.dart';
import '../modules/authentication/login/bindings/login_binding.dart';
import '../modules/authentication/login/views/login_view.dart';
import '../modules/authentication/register/bindings/register_binding.dart';
import '../modules/authentication/register/views/register_view.dart';
import '../modules/balance_viewpage/bindings/balance_viewpage_binding.dart';
import '../modules/balance_viewpage/views/balance_viewpage_view.dart';
import '../modules/complaint/views/complaint_view.dart';
import '../modules/complaint_detail/bindings/complaint_detail_binding.dart';
import '../modules/complaint_detail/views/complaint_detail_view.dart';
import '../modules/messages/chat/bindings/chat_binding.dart';
import '../modules/messages/chat/views/chat_view.dart';
import '../modules/navigation/bindings/navigation_binding.dart';
import '../modules/navigation/views/navigation_view.dart';
import '../modules/notification/views/notification_view.dart';
import '../modules/rent_viewpage/bindings/rent_viewpage_binding.dart';
import '../modules/rent_viewpage/views/rent_viewpage_view.dart';
import '../modules/splash_screen/bindings/splash_screen_binding.dart';
import '../modules/splash_screen/views/splash_screen_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH_SCREEN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => NavigationView(),
      binding: NavigationBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH_SCREEN,
      page: () => SplashScreenView(),
      binding: SplashScreenBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.NOTIFICATION,
      page: () => NotificationView(),
    ),
    GetPage(
      name: _Paths.COMPLAINT,
      page: () => ComplaintView(),
    ),
    GetPage(
      name: _Paths.CHANGE_PASSWORD,
      page: () => ChangePasswordView(),
      binding: ChangePasswordBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_PROFILE,
      page: () => EditProfileView(),
      binding: EditProfileBinding(),
    ),
    GetPage(
      name: _Paths.RENT_VIEWPAGE,
      page: () => RentViewpageView(),
      binding: RentViewpageBinding(),
    ),
    GetPage(
      name: _Paths.BALANCE_VIEWPAGE,
      page: () => BalanceViewpageView(),
      binding: BalanceViewpageBinding(),
    ),
    GetPage(
      name: _Paths.ADD_TENANT,
      page: () => AddTenantView(),
      binding: AddTenantBinding(),
    ),
    GetPage(
      name: _Paths.COMPLAINT_DETAIL,
      page: () => ComplaintDetailView(),
      binding: ComplaintDetailBinding(),
    ),
    GetPage(
      name: _Paths.CHAT,
      page: () => ChatView(),
      binding: ChatBinding(),
    ),
  ];
}
