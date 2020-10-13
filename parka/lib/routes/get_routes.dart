import 'package:ParkA/controllers/bindings/graphql_biding.dart';
import 'package:ParkA/controllers/bindings/user_binding.dart';
import 'package:ParkA/pages/ConfirmAccountPage/confirm_account_page.dart';
import 'package:ParkA/pages/CreateVehiclePage/create_vehicle_page.dart';
import 'package:ParkA/pages/EditProfilePage/edit_profile_page.dart';
import 'package:ParkA/pages/EditUserProfilePage/edit_user_profile_page.dart';
import 'package:ParkA/pages/FilterPage/filter_page.dart';
import 'package:ParkA/pages/ID/ID_page.dart';
import 'package:ParkA/pages/ForgotPassword/forgot_password_screen.dart';
import 'package:ParkA/pages/Login/email_login.dart';
import 'package:ParkA/pages/Login/login_screen.dart';
import 'package:ParkA/pages/MapPage/maps_page.dart';
import 'package:ParkA/pages/ProfilePage/profile_page.dart';
import 'package:ParkA/pages/ProfilePic/profile_pic_page.dart';
import 'package:ParkA/pages/PaymentInfo/payment_info.dart';
import 'package:ParkA/pages/Register/register_page.dart';
import 'package:ParkA/pages/GraphQlTest/graphql_test_page.dart';
import 'package:ParkA/pages/ResetPasswordPage/reset_password_page.dart';
import 'package:ParkA/pages/UpdatePasswordScreen/update_user_password_screen.dart';
import 'package:ParkA/pages/UserPaymentMethodPage/user_registered_payment_methods_screen.dart';
import 'package:ParkA/pages/VehiclePage/vehicle_page.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

List<GetPage> getRoutePages = [
  GetPage(
    name: LoginScreen.routeName,
    page: () => LoginScreen(),
  ),
  GetPage(
    name: EmailLogin.routeName,
    page: () => EmailLogin(),
    binding: UserBinding(),
  ),
  GetPage(
    name: IDPage.routeName,
    page: () => IDPage(),
  ),
  GetPage(
    name: ProfilePicPage.routeName,
    page: () => ProfilePicPage(),
  ),
  GetPage(
    name: PaymentInfoScreen.routeName,
    page: () => PaymentInfoScreen(),
  ),
  GetPage(
    name: ForgotPasswordScreen.routeName,
    page: () => ForgotPasswordScreen(),
  ),
  GetPage(
    name: RegisterPage.routeName,
    page: () => RegisterPage(),
  ),
  GetPage(
    name: MapPage.routeName,
    page: () => MapPage(),
    bindings: [UserBinding(), GraphqlClientBiding()],
  ),
  GetPage(
    name: GraphqlTestScreen.routeName,
    page: () => GraphqlTestScreen(),
  ),
  GetPage(
    name: FilterPage.routeName,
    page: () => FilterPage(),
  ),
  GetPage(
    name: ProfileScreen.routeName,
    page: () => ProfileScreen(),
  ),
  GetPage(
    name: ConfirmAccountPage.routeName,
    page: () => ConfirmAccountPage(),
  ),
  GetPage(
    name: ResetPasswordPage.routeName,
    page: () => ResetPasswordPage(),
    bindings: [GraphqlClientBiding()],
  ),
  GetPage(
    name: UserPaymentMethodsScreen.routeName,
    page: () => UserPaymentMethodsScreen(),
    bindings: [GraphqlClientBiding()],
  ),
  GetPage(
    name: EditProfilePage.routeName,
    page: () => EditProfilePage(),
    bindings: [GraphqlClientBiding()],
  ),
  GetPage(
    name: UpdateUserPasswordPage.routeName,
    page: () => UpdateUserPasswordPage(),
    bindings: [GraphqlClientBiding()],
  ),
  GetPage(
    name: EditUserProfileInformationPage.routeName,
    page: () => EditUserProfileInformationPage(),
    bindings: [GraphqlClientBiding()],
  ),
  GetPage(
    name: VehiclePage.routeName,
    page: () => VehiclePage(),
    bindings: [GraphqlClientBiding()],
  ),
  GetPage(
    name: CreateVehiclePage.routeName,
    page: () => CreateVehiclePage(),
    bindings: [GraphqlClientBiding()],
  ),
];
