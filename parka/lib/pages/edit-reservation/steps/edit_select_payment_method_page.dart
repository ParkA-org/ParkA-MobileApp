import 'package:ParkA/controllers/create-reservation-form/create_reservation_controller.dart';
import 'package:ParkA/controllers/edit-reservation-form/edit_reservation_controller.dart';
import 'package:ParkA/data/use-cases/payment/payment_use_cases.dart';
import 'package:ParkA/pages/user-payments/components/card_preview_widget.dart';
import 'package:ParkA/styles/parka_colors.dart';
import 'package:ParkA/styles/text.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class EditSelectPaymentMethodPage extends StatefulWidget {
  static String routeName = "edit-select-payment-method-page";

  @override
  _EditSelectPaymentMethodPageState createState() =>
      _EditSelectPaymentMethodPageState();
}

class _EditSelectPaymentMethodPageState
    extends State<EditSelectPaymentMethodPage> {
  EditReservationFormController _formController =
      Get.find<EditReservationFormController>();

  bool _loading;

  List userPaymentMethods;

  Future getAllUserPayment() async {
    this.userPaymentMethods = await PaymentUseCases.getAllUserPaymentMethods();

    setState(() {
      this._loading = false;
    });
  }

  List<Widget> buildPaymentView() {
    List<Widget> ret = new List<Widget>();

    this.userPaymentMethods.forEach((element) {
      ret.add(RaisedButton(
        child: CardListTile(
          payment: element,
        ),
        color: Colors.white,
        onPressed: () {
          _formController.setPaymentInfo(element);
          Get.back();
        },
      ));
    });

    return ret;
  }

  @override
  void initState() {
    super.initState();
    this._loading = true;

    this.getAllUserPayment();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                                  this
                                      ._formController
                                      .editReservationDto
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
                                        '${this._formController.editReservationDto.parking.rating.toStringAsPrecision(2)}',
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
                                  .editReservationDto
                                  .parking
                                  .mainPicture),
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
                          Container(
                            color: Colors.white,
                            padding: const EdgeInsets.symmetric(
                              vertical: 8.0,
                              horizontal: 25.0,
                            ),
                            child: Text(
                              "Metodo de pago",
                              style: kParkaTextStyleBoldGreen22,
                            ),
                          ),
                          Column(
                            children: buildPaymentView(),
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
