import 'package:ParkA/components/menu-item/parka_menu_item.dart';
import 'package:ParkA/controllers/user_controller.dart';
import 'package:ParkA/pages/chats/chats_page.dart';
import 'package:ParkA/pages/edit-profile/edit_profile_page.dart';
import 'package:ParkA/pages/parkings/parking_page.dart';
import 'package:ParkA/pages/pending-reservations/pending_reservation_page.dart';

import 'package:ParkA/pages/profile/components/profile_personal_information_widget.dart';
import 'package:ParkA/pages/profile/profile_page.dart';
import 'package:ParkA/pages/login/login_screen.dart';
import 'package:ParkA/pages/reservation-as-owner/reservation_as_owner.dart';
import 'package:ParkA/pages/reservations-as-client/reservation_as_client.dart';
import 'package:ParkA/pages/search/search_panel.dart';
import 'package:ParkA/pages/user-payments/user_registered_payment_methods_screen.dart';
import 'package:ParkA/pages/vehicles/vehicle_page.dart';
import 'package:ParkA/styles/parka_colors.dart';
import 'package:ParkA/styles/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PrivateDrawer extends StatelessWidget {
  final int reservationsAsCLientCount;
  final int reservationsAsOwnerCount;

  PrivateDrawer({
    Key key,
    this.reservationsAsCLientCount,
    this.reservationsAsOwnerCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 2,
              child: Container(
                color: ParkaColors.parkaGreen,
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: Column(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                              context, EditProfilePage.routeName);
                        },
                        child: ProfilePersonalInformationWidget(
                          color: Colors.white,
                          showLocation: false,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24.0, vertical: 8.0),
                      child: Divider(
                        thickness: 1.0,
                        color: Color(0xFF949494),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 24.0, vertical: 8.0),
                        child: Column(
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  Get.toNamed(
                                      ReservationAsClientPage.routeName);
                                },
                                child: ParkaUserReservationInfoWidget(
                                  value:
                                      this.reservationsAsCLientCount.toString(),
                                  label: "Reservaciones como cliente",
                                ),
                              ),
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  Get.toNamed(ReservationAsOwnerPage.routeName);
                                },
                                child: ParkaUserReservationInfoWidget(
                                  value:
                                      this.reservationsAsOwnerCount.toString(),
                                  label: "Reservaciones como anfitrion",
                                ),
                              ),
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  Get.toNamed(
                                      PendingReservationsPage.routeName);
                                },
                                child: ParkaUserReservationInfoWidget(
                                  value: null,
                                  label: "Reservas pendientes",
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: EdgeInsets.only(left: 24.0),
                child: Column(
                  children: [
                    Expanded(
                      child: ParkAMenuItem(
                        label: "Mis Vehiculos",
                        itemStyle: kParkaInputDefaultStyleBlue,
                        onTapHandler: () {
                          Get.toNamed(VehiclePage.routeName);
                        },
                      ),
                    ),
                    Expanded(
                      child: ParkAMenuItem(
                        label: "Mis Parqueos",
                        itemStyle: kParkaInputDefaultStyleBlue,
                        onTapHandler: () {
                          Get.toNamed(ParkingPage.routeName);
                        },
                      ),
                    ),
                    Expanded(
                      child: ParkAMenuItem(
                        label: "Metodos de pago",
                        itemStyle: kParkaInputDefaultStyleBlue,
                        onTapHandler: () {
                          Get.toNamed(UserPaymentMethodsScreen.routeName);
                        },
                      ),
                    ),
                    Expanded(
                      child: ParkAMenuItem(
                        label: "Chats",
                        itemStyle: kParkaInputDefaultStyleBlue,
                        onTapHandler: () => Get.toNamed(ChatsPage.routeName),
                      ),
                    ),
                    Expanded(
                      child: ParkAMenuItem(
                        label: "Buscar Parqueo",
                        itemStyle: kParkaInputDefaultStyleBlue,
                        onTapHandler: () => Get.toNamed(SearchPanel.routeName),
                      ),
                    ),
                    Expanded(
                      child: ParkAMenuItem(
                        label: "Configuracion",
                        itemStyle: kParkaInputDefaultStyleBlue,
                        onTapHandler: () =>
                            Get.toNamed(EditProfilePage.routeName),
                      ),
                    ),
                    Expanded(
                      child: ParkAMenuItem(
                        label: "Ayuda",
                        itemStyle: kParkaInputDefaultStyleBlue,
                      ),
                    ),
                    Expanded(
                      child: ParkAMenuItem(
                        label: "Salir",
                        itemStyle: kParkaInputDefaultStyleBlue,
                        onTapHandler: () {
                          Get.find<UserController>().logout();
                          Get.offAllNamed(LoginScreen.routeName);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 0,
              child: Container(
                margin: EdgeInsets.only(bottom: 10, left: 16.0),
                child: Text(
                  "Terminos y condiciones legales",
                  textAlign: TextAlign.left,
                  style: kParkaInputDefaultStyleBlue.copyWith(
                      fontWeight: FontWeight.normal, fontSize: 14),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ParkaUserReservationInfoWidget extends StatelessWidget {
  final String label;
  final String value;

  const ParkaUserReservationInfoWidget({
    Key key,
    this.label,
    this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 0,
          child: Padding(
            padding: EdgeInsets.only(right: 24.0),
            child: Text(
              this.value ?? "0",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24.0,
                fontWeight: FontWeight.w600,
                fontFamily: "Montserrat",
              ),
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Text(
            this.label,
            style: TextStyle(
              color: Colors.white,
              fontSize: 14.0,
              fontWeight: FontWeight.normal,
              fontFamily: "Montserrat",
            ),
          ),
        ),
      ],
    );
  }
}
