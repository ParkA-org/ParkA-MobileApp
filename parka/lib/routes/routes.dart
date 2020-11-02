import 'package:ParkA/controllers/bindings/graphql_biding.dart';
import 'package:ParkA/controllers/bindings/user_binding.dart';
import 'package:ParkA/pages/confirm-account/confirm_account_page.dart';
import 'package:ParkA/pages/create-parking/create_parking_page.dart';
import 'package:ParkA/pages/create-payment/payment_info.dart';
import 'package:ParkA/pages/create-user-information/ID_page.dart';
import 'package:ParkA/pages/create-vehicle/create_vehicle_page.dart';
import 'package:ParkA/pages/edit-profile/edit_profile_page.dart';
import 'package:ParkA/pages/edit-user-profile/edit_user_profile_page.dart';
import 'package:ParkA/pages/filter/filter_page.dart';
import 'package:ParkA/pages/forgot-password/forgot_password_screen.dart';
import 'package:ParkA/pages/login/email_login.dart';
import 'package:ParkA/pages/login/login_screen.dart';
import 'package:ParkA/pages/map/maps_page.dart';
import 'package:ParkA/pages/parkings/parking_page.dart';
import 'package:ParkA/pages/profile-picture/profile_pic_page.dart';
import 'package:ParkA/pages/profile/profile_page.dart';
import 'package:ParkA/pages/register/register_page.dart';
import 'package:ParkA/pages/reset-password/reset_password_page.dart';
import 'package:ParkA/pages/update-password/update_user_password_screen.dart';
import 'package:ParkA/pages/user-payments/user_registered_payment_methods_screen.dart';
import 'package:ParkA/pages/vehicles/vehicle_page.dart';
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
  GetPage(
    name: ParkingPage.routeName,
    page: () => ParkingPage(),
    bindings: [GraphqlClientBiding()],
  ),
  GetPage(
    name: CreateParkingPage.routeName,
    page: () => CreateParkingPage(),
    bindings: [GraphqlClientBiding()],
  ),
];
