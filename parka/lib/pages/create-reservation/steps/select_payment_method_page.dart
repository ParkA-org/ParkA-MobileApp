import 'package:ParkA/components/floating-action-button/parka_floating_action_button.dart';
import 'package:ParkA/data/data-models/parking/parking_data_model.dart';
import 'package:ParkA/data/use-cases/payment/payment_use_cases.dart';
import 'package:ParkA/pages/user-payments/components/card_preview_widget.dart';
import 'package:ParkA/styles/parka_colors.dart';
import 'package:ParkA/styles/text.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class SelectPaymentMethodPage extends StatefulWidget {
  static String routeName = "select-payment-method-page";

  final Parking parking;

  SelectPaymentMethodPage({
    @required this.parking,
  });

  @override
  _SelectPaymentMethodPageState createState() =>
      _SelectPaymentMethodPageState();
}

class _SelectPaymentMethodPageState extends State<SelectPaymentMethodPage> {
  Parking _parking;
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
        onPressed: () => {},
      ));
    });

    return ret;
  }

  @override
  void initState() {
    super.initState();
    this._loading = true;
    this._parking = this.widget.parking;
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
                                        '${this._parking.rating.toStringAsPrecision(2)}',
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
