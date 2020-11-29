import 'package:ParkA/components/cards/vehicle_mini_list_tile.dart';
import 'package:ParkA/components/floating-action-button/parka_floating_action_button.dart';
import 'package:ParkA/components/inputs/parka_time_selector_widget/time_selector_pill_widget.dart';
import 'package:ParkA/components/price/price_tab_widget.dart';
import 'package:ParkA/data/data-models/parking/parking_data_model.dart';
import 'package:ParkA/data/data-models/payment/payment_data_model.dart';
import 'package:ParkA/data/data-models/vehicle/vehicle_data_model.dart';
import 'package:ParkA/data/use-cases/parking/parking_use_cases.dart';
import 'package:ParkA/pages/create-reservation/steps/select_payment_method_page.dart';
import 'package:ParkA/pages/create-reservation/steps/select_vehile_page.dart';
import 'package:ParkA/pages/edit-parking/edit_parking_page.dart';
import 'package:ParkA/styles/parka_colors.dart';
import 'package:ParkA/styles/text.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class CreateParkingReservationPage extends StatefulWidget {
  static String routeName = "create-parking-reservation-page";

  final String parkingId;

  CreateParkingReservationPage({
    @required this.parkingId,
  });

  @override
  _CreateParkingReservationPageState createState() =>
      _CreateParkingReservationPageState();
}

class _CreateParkingReservationPageState
    extends State<CreateParkingReservationPage> {
  String _parkingId;
  Parking _parking;
  bool _loading;
  BitmapDescriptor _markerIcon;

  @override
  void initState() {
    super.initState();
    this._loading = true;
    this._parkingId = this.widget.parkingId;

    BitmapDescriptor.fromAssetImage(
            ImageConfiguration.empty, 'resources/images/green-parking-icon.png')
        .then((onValue) {
      _markerIcon = onValue;
    });

    getParking();
  }

  Future getParking() async {
    this._parking = await ParkingUseCases.getParkingById(this._parkingId);
    if (this._parking != null) {
      this._loading = false;
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: ParkaFloatingActionButton(
        iconData: Icons.edit,
        onPressedHandler: () {
          Get.to(EditParkingPage(
            parking: this._parking,
          ));
        },
      ),
      body: SafeArea(
        child: ModalProgressHUD(
          color: ParkaColors.parkaGreen,
          inAsyncCall: this._loading,
          child: this._loading
              ? Container(
                  color: ParkaColors.parkaGreen,
                )
              : CustomScrollView(
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
                                  this._parking.parkingName,
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
                                        '${this._parking.rating.toPrecision(2)}',
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
                              image: NetworkImage(_parking.mainPicture),
                            ),
                            Container(
                              decoration: BoxDecoration(boxShadow: [
                                BoxShadow(
                                  offset: Offset(0, 190.0),
                                  color: Colors.black54,
                                  blurRadius: 18.0,
                                  spreadRadius: 15.0,
                                ),
                              ]),
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
                              children: [
                                ParkingPriceWidgetTab(
                                  parking: this._parking,
                                ),
                                DateTimeReservationPicker(),
                                Divider(
                                  thickness: 1.0,
                                  color: Color(0xFF949494),
                                ),
                                PaymentMethodSelectorWidget(
                                  onTapHandler: () {
                                    Get.to(
                                      SelectPaymentMethodPage(
                                        parking: this._parking,
                                      ),
                                    );
                                  },
                                ),
                                Divider(
                                  thickness: 1.0,
                                  color: Color(0xFF949494),
                                ),
                                VehicleSelectorWidget(
                                  onTapHandler: () {
                                    Get.to(SelectVehiclePage(
                                      parking: this._parking,
                                    ));
                                  },
                                ),
                                InfoLabelWidget(
                                  label: "Total:",
                                  value: "\$900 RD",
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
        ),
      ),
    );
  }
}

class InfoLabelWidget extends StatelessWidget {
  final String label;
  final String value;

  const InfoLabelWidget({
    Key key,
    @required this.label,
    @required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8.0,
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Text(
              this.label,
              style: kParkaTextStyleBoldGreen18,
            ),
          ),
          Text(
            this.value ?? "",
            style: kParkaTextStyleBoldBlack18,
          ),
        ],
      ),
    );
  }
}

class VehicleSelectorWidget extends StatelessWidget {
  final Vehicle vehicle;
  final Function onTapHandler;

  const VehicleSelectorWidget({
    Key key,
    this.vehicle,
    this.onTapHandler,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            "Vehicle",
            style: kParkaTextStyleBoldGreen18,
          ),
        ),
        MiniVehicleListTile(
          vehicle: this.vehicle,
          onTapHandler: this.onTapHandler,
        )
      ],
    );
  }
}

class PaymentMethodSelectorWidget extends StatelessWidget {
  final Function onTapHandler;
  final Payment payment;

  const PaymentMethodSelectorWidget({
    Key key,
    this.payment,
    this.onTapHandler,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            "Metodo de pago",
            style: kParkaTextStyleBoldGreen18,
          ),
        ),
        PaymentCardTile(
          payment: payment,
          onTapHandler: this.onTapHandler,
        ),
      ],
    );
  }
}

class PaymentCardTile extends StatelessWidget {
  const PaymentCardTile({
    Key key,
    @required this.payment,
    this.onTapHandler,
  }) : super(key: key);

  final Payment payment;
  final Function onTapHandler;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onTapHandler,
      child: Container(
          height: 60.0,
          child: Row(
            children: [
              Expanded(
                child: this.payment == null
                    ? Container(
                        child: AutoSizeText(
                          "Selecciona un metodo de pago",
                          maxLines: 1,
                          style: kParkaTextStyleGrey18,
                        ),
                      )
                    : Column(
                        children: [
                          Text(this.payment.cardHolder),
                          Text(
                            "• • • •  ${this.payment.digit}",
                          )
                        ],
                      ),
              ),
              Expanded(
                flex: 0,
                child: Icon(
                  Icons.keyboard_arrow_right,
                  color: Color(0xFF949494),
                ),
              )
            ],
          )),
    );
  }
}

class DateTimeReservationPicker extends StatelessWidget {
  const DateTimeReservationPicker({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            "Elige tu fecha de alquiler",
            style: kParkaTextStyleBoldGreen18,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            "Fecha",
            style: kParkaTextStyleGreen18,
          ),
        ),
        Row(
          children: [
            Expanded(
              flex: 2,
              child: TimeSelectorPillWidget(),
            ),
            Expanded(
              child: Container(),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        "Desde",
                        style: kParkaTextStyleGreen18,
                      ),
                    ),
                    TimeSelectorPillWidget()
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        "Hasta",
                        style: kParkaTextStyleGreen18,
                      ),
                    ),
                    TimeSelectorPillWidget(),
                  ],
                ),
              ),
            )
          ],
        ),
        InfoLabelWidget(
          label: "Horas:",
          value: "6",
        ),
      ],
    );
  }
}
