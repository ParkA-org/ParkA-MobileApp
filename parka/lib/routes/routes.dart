import 'package:ParkA/controllers/bindings/graphql_biding.dart';
import 'package:ParkA/controllers/bindings/login_binding.dart';
import 'package:ParkA/controllers/bindings/registration_controller_binding.dart';
import 'package:ParkA/controllers/bindings/user_binding.dart';
import 'package:ParkA/pages/chats/chat_user_page.dart';
import 'package:ParkA/pages/chats/chats_page.dart';
import 'package:ParkA/pages/confirm-account/confirm_account_page.dart';
import 'package:ParkA/pages/create-parking/create_parking_page.dart';
import 'package:ParkA/pages/create-parking/steps/parking_calendar_creator_page.dart';
import 'package:ParkA/pages/create-parking/steps/parking_image_selector_page.dart';
import 'package:ParkA/pages/create-parking/steps/parking_position_selector_page.dart';
import 'package:ParkA/pages/create-payment/payment_info.dart';

import 'package:ParkA/pages/create-vehicle/create_vehicle_page.dart';
import 'package:ParkA/pages/edit-payment/edit_payment_page.dart';
import 'package:ParkA/pages/edit-parking/edit_parking_page.dart';
import 'package:ParkA/pages/edit-parking/steps/edit_parking_calendar.dart';
import 'package:ParkA/pages/edit-parking/steps/edit_parking_images_page.dart';
import 'package:ParkA/pages/edit-profile/edit_profile_page.dart';
import 'package:ParkA/pages/edit-user-profile/edit_user_profile_page.dart';
import 'package:ParkA/pages/filter/filter_page.dart';
import 'package:ParkA/pages/forgot-password/forgot_password_screen.dart';
import 'package:ParkA/pages/history/history_page.dart';
import 'package:ParkA/pages/login/email_login.dart';
import 'package:ParkA/pages/login/login_screen.dart';
import 'package:ParkA/pages/map/maps_page.dart';
import 'package:ParkA/pages/parkings/parking_page.dart';
import 'package:ParkA/pages/pending-reservations/pending_reservation_page.dart';
import 'package:ParkA/pages/profile-picture/profile_pic_page.dart';
import 'package:ParkA/pages/profile/profile_page.dart';
import 'package:ParkA/pages/register/register_page.dart';
import 'package:ParkA/pages/register/steps/user_information_page.dart';
import 'package:ParkA/pages/register/steps/profile_pic_page.dart';
import 'package:ParkA/pages/reservation/reservation-as-owner-detail/reservation_as_owner.dart';
import 'package:ParkA/pages/reservation/reservations-as-client-detail/reservation_as_client.dart';
import 'package:ParkA/pages/reset-password/reset_password_page.dart';
import 'package:ParkA/pages/search/search_panel.dart';
import 'package:ParkA/pages/splash-screen/splash_screen.dart';
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
    bindings: [
      UserBinding(),
      GraphqlClientBiding(),
      LoginBinding(),
    ],
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
    name: HistoryPage.routeName,
    page: () => HistoryPage(),
  ),
  GetPage(
    name: RegisterPage.routeName,
    page: () => RegisterPage(),
    binding: RegistrationFormBinding(),
  ),
  GetPage(
    name: ProfilePicturePage.routeName,
    page: () => ProfilePicturePage(),
    binding: RegistrationFormBinding(),
  ),
  GetPage(
    name: UserInformationPage.routeName,
    page: () => UserInformationPage(),
    bindings: [
      GraphqlClientBiding(),
      RegistrationFormBinding(),
      LoginBinding(),
    ],
  ),
  GetPage(
    name: ChatUserPage.routeName,
    page: () => ChatUserPage(),
    bindings: [GraphqlClientBiding()],
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
    bindings: [
      GraphqlClientBiding(),
      LoginBinding(),
    ],
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
  GetPage(
    name: ParkingPositionSelectorPage.routeName,
    page: () => ParkingPositionSelectorPage(),
    bindings: [GraphqlClientBiding()],
  ),
  GetPage(
    name: ParkingCalendarCreatorPage.routeName,
    page: () => ParkingCalendarCreatorPage(),
    bindings: [GraphqlClientBiding()],
  ),
  GetPage(
    name: ParkingImageSelectorPage.routeName,
    page: () => ParkingImageSelectorPage(),
    bindings: [GraphqlClientBiding()],
  ),
  GetPage(
    bindings: [GraphqlClientBiding()],
    name: SplashScreen.routeName,
    page: () => SplashScreen(),
  ),
  GetPage(
    bindings: [GraphqlClientBiding()],
    name: ReservationAsClientPage.routeName,
    page: () => ReservationAsClientPage(
      reservationId: "",
    ),
  ),
  GetPage(
    bindings: [GraphqlClientBiding()],
    name: ReservationAsOwnerPage.routeName,
    page: () => ReservationAsOwnerPage(
      reservationId: "",
    ),
  ),
  GetPage(
    bindings: [GraphqlClientBiding()],
    name: SearchPanel.routeName,
    page: () => SearchPanel(),
  ),
  GetPage(
    bindings: [GraphqlClientBiding()],
    name: ChatsPage.routeName,
    page: () => ChatsPage(),
  ),
  GetPage(
    name: EditPaymentScreen.routeName,
    page: () => EditPaymentScreen(),
  ),
  GetPage(
    name: EditParkingPage.routeName,
    // ignore: missing_required_param
    page: () => EditParkingPage(),
    bindings: [GraphqlClientBiding()],
  ),
  GetPage(
    name: ParkingCalendarEditorPage.routeName,
    page: () => ParkingCalendarEditorPage(),
    bindings: [GraphqlClientBiding()],
  ),
  GetPage(
    name: ParkingImageEditorPage.routeName,
    page: () => ParkingImageEditorPage(),
    bindings: [GraphqlClientBiding()],
  ),
  GetPage(
    name: ChatUserPage.routeName,
    page: () => ChatUserPage(),
    bindings: [GraphqlClientBiding()],
  ),
];
