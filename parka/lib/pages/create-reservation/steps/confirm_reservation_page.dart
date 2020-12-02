import 'package:ParkA/components/buttons/reservation_form_payment_selector.dart';
import 'package:ParkA/components/buttons/reservation_form_vehicle_selector.dart';
import 'package:ParkA/components/buttons/round_button.dart';
import 'package:ParkA/components/info/info_label.dart';
import 'package:ParkA/components/price/price_tab_widget.dart';
import 'package:ParkA/components/user/other_user_personal_information_widget.dart';
import 'package:ParkA/controllers/create-reservation-form/create_reservation_controller.dart';
import 'package:ParkA/pages/create-reservation/steps/select_payment_method_page.dart';
import 'package:ParkA/pages/create-reservation/steps/select_vehile_page.dart';
import 'package:ParkA/pages/map/maps_page.dart';
import 'package:ParkA/pages/pending-reservations/pending_reservation_page.dart';
import 'package:ParkA/styles/parka_colors.dart';
import 'package:ParkA/styles/text.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConfirmReservationPage extends StatelessWidget {
  static String routeName = "confirm-reservation-page";

  final CreateReservationFormController _formController =
      Get.find<CreateReservationFormController>();

  String _formatDate(String _date) {
    // if (_date == null) return "";

    final List<String> months = [
      "Enero",
      "Febrero",
      "Marzo",
      "Abril",
      "Mayo",
      "Junio",
      "Julio",
      "Agosto",
      "Septiembre",
      "Octubre",
      "Noviembre",
      "Diciembre",
    ];

    List<String> split = _date.split("T");

    List<String> spitteDate = split[0].split("-");
    List<String> splittedTime = split[1].split(":");

    final int monthIndex = int.tryParse(spitteDate[1]) - 1;
    final month = months[monthIndex + 1];

    return "${spitteDate[2]} de $month ${spitteDate[0]} a las ${splittedTime[0]}:${splittedTime[1]}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              expandedHeight: 250.0,
              backgroundColor: ParkaColors.parkaGreen,
              flexibleSpace: FlexibleSpaceBar(
                title: Container(
                  margin: EdgeInsets.only(right: 8.0),
                  padding: EdgeInsets.all(4.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: AutoSizeText(
                          this
                              ._formController
                              .createReservationDto
                              .parking
                              .parkingName,
                          maxLines: 1,
                          style: kParkaTextStyleBold16,
                        ),
                      ),
                      Expanded(
                        flex: 0,
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 2.0),
                          child: Row(
                            children: [
                              AutoSizeText(
                                '${this._formController.createReservationDto.parking.rating.toPrecision(2)}',
                                maxLines: 1,
                                style: kParkaTextStyleBold16,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Icon(
                                  Icons.star,
                                  color: Colors.white,
                                  size: 16.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                background: Stack(
                  alignment: Alignment.center,
                  fit: StackFit.expand,
                  children: [
                    Image(
                      fit: BoxFit.cover,
                      image: NetworkImage(this
                          ._formController
                          .createReservationDto
                          .parking
                          .mainPicture),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 190.0),
                            color: Colors.black54,
                            blurRadius: 18.0,
                            spreadRadius: 15.0,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(
                      24.0,
                      0,
                      24.0,
                      24.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          color: Colors.white,
                          padding: const EdgeInsets.only(
                            top: 8.0,
                          ),
                          child: Text(
                            "Resumen de Reserva",
                            style: kParkaTextStyleBoldGreen22,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: Text(
                                "Propietario",
                                style: kParkaTextStyleBoldGreen18,
                              ),
                            ),
                            Obx(
                              () => OtherUserProfilePersonalInformationWidget(
                                user: this
                                    ._formController
                                    .createReservationDto
                                    .parking
                                    .user,
                              ),
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: Text(
                                "Fecha",
                                style: kParkaTextStyleBoldGreen18,
                              ),
                            ),
                            Obx(
                              () => InfoLabelWidget(
                                label: "Desde:",
                                labelStyle: kParkaTextStyleBoldBlack16,
                                valueStyle: kParkaTextStyleBlack16,
                                value: _formatDate(this
                                    ._formController
                                    .createReservationDto
                                    .checkInDate),
                              ),
                            ),
                            Obx(
                              () => InfoLabelWidget(
                                label: "Hasta:",
                                labelStyle: kParkaTextStyleBoldBlack16,
                                valueStyle: kParkaTextStyleBlack16,
                                value: _formatDate(this
                                    ._formController
                                    .createReservationDto
                                    .checkOutDate),
                              ),
                            ),
                            ParkingPriceWidgetTab(
                              label: "Precio por hora",
                              value:
                                  'RD\$ ${this._formController.createReservationDto.parking.perHourPrice}',
                              valueStyle: kParkaTextStyleBoldBlack16,
                            ),
                            Divider(
                              thickness: 1.0,
                              color: Color(0xFF949494),
                            ),
                          ],
                        ),
                        Obx(
                          () => PaymentMethodSelectorWidget(
                            payment: this
                                ._formController
                                .createReservationDto
                                .paymentInfo,
                            onTapHandler: () {
                              Get.to(
                                SelectPaymentMethodPage(),
                              );
                            },
                          ),
                        ),
                        Divider(
                          thickness: 1.0,
                          color: Color(0xFF949494),
                        ),
                        Obx(
                          () => VehicleSelectorWidget(
                            vehicle: this
                                ._formController
                                .createReservationDto
                                .vehicle,
                            onTapHandler: () {
                              Get.to(
                                SelectVehiclePage(),
                              );
                            },
                          ),
                        ),
                        Obx(
                          () => InfoLabelWidget(
                            label: "Total a pagar:",
                            value:
                                "\$${this._formController.createReservationDto.total ?? 0} RD",
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: RoundedButton(
                            hasShadow: false,
                            hasIcon: false,
                            label: "Confirmar reserva",
                            color: ParkaColors.parkaGreen,
                            onTapHandler: () async {
                              final result = await this
                                  ._formController
                                  .createReservation();

                              if (result) {
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                      builder: (ctx) =>
                                          PendingReservationsPage(),
                                    ),
                                    ModalRoute.withName(MapPage.routeName));
                              }
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
