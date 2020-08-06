import "package:flutter/material.dart";
import "../utils/curves_painter.dart";
import "../components/credit_card.dart";

class PaymentInfoScreen extends StatefulWidget {
  @override
  _PaymentInfoScreenState createState() => _PaymentInfoScreenState();
}

class _PaymentInfoScreenState extends State<PaymentInfoScreen> {
  String fullName = "Nombre del titular";
  String creditCardNumber1 = "----";
  String creditCardNumber2 = "----";
  String creditCardNumber3 = "----";
  String creditCardNumber4 = "----";
  String creditCardMonth = "--";
  String creditCardYear = "--";
  String creditCardCvv;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Color(0xFF0B768C),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
                flex: 7,
                child: WavyHeaderImage(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 50.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          TransparentButtonWithIcon(
                            label: "Atras",
                            color: Color(0xFF0B768C),
                          ),
                          Text(
                            "Metodo de pago",
                            style: TextStyle(
                                color: Color(0xFF0B768C),
                                fontSize: 32.0,
                                fontWeight: FontWeight.bold),
                          ),
                          CreditCardWidget(
                            fullName: this.fullName,
                            creditCardNumber1: this.creditCardNumber1,
                            creditCardNumber2: this.creditCardNumber2,
                            creditCardNumber3: this.creditCardNumber3,
                            creditCardNumber4: this.creditCardNumber4,
                            creditCardMonth: this.creditCardMonth,
                            creditCardYear: this.creditCardYear,
                          ),
                          Text(
                            "Numero Tarjeta",
                            style: TextStyle(
                              color: Color(0xFF0B768C),
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextField(
                                    decoration: kInputStyle,
                                    keyboardType: TextInputType.number,
                                    onChanged: (value) {
                                      setState(() {
                                        this.creditCardNumber1 = value;
                                      });
                                    },
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextField(
                                    decoration: kInputStyle,
                                    keyboardType: TextInputType.number,
                                    onChanged: (value) {
                                      setState(() {
                                        this.creditCardNumber2 = value;
                                      });
                                    },
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextField(
                                    decoration: kInputStyle,
                                    keyboardType: TextInputType.number,
                                    onChanged: (value) {
                                      setState(() {
                                        this.creditCardNumber3 = value;
                                      });
                                    },
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextField(
                                    decoration: kInputStyle,
                                    keyboardType: TextInputType.number,
                                    onChanged: (value) {
                                      setState(() {
                                        this.creditCardNumber4 = value;
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Text(
                            "Nombre del titular",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Color(0xFF0B768C),
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextField(
                            decoration: kInputStyle,
                            onChanged: (value) {
                              setState(() {
                                this.fullName = value;
                              });
                            },
                          ),
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: <Widget>[
                                    Text(
                                      "Valido Hasta",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        color: Color(0xFF0B768C),
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: TextField(
                                              decoration: kInputStyle,
                                              keyboardType:
                                                  TextInputType.number,
                                              onChanged: (value) {
                                                setState(() {
                                                  this.creditCardMonth = value;
                                                });
                                              },
                                            ),
                                          ),
                                        ),
                                        Text(
                                          "/",
                                          style: TextStyle(
                                            color: Color(0xFF0B768C),
                                            fontSize: 25.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: TextField(
                                              decoration: kInputStyle,
                                              keyboardType:
                                                  TextInputType.number,
                                              onChanged: (value) {
                                                setState(() {
                                                  this.creditCardYear = value;
                                                });
                                              },
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: <Widget>[
                                    Text(
                                      "CVV",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        color: Color(0xFF0B768C),
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: TextField(
                                        decoration: kInputStyle,
                                        keyboardType: TextInputType.number,
                                        onChanged: (value) {
                                          setState(() {
                                            this.creditCardCvv = value;
                                          });
                                          print(this.creditCardCvv);
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                )),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  TransparentButtonWithRightIcon(
                    label: "Continuar",
                    color: Colors.white,
                    icon: Icons.arrow_forward_ios,
                  ),
                  TransparentButtonWithRightIcon(
                    label: "Omitir",
                    color: Color(0xFFB3E8FF),
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

class TransparentButtonWithIcon extends StatelessWidget {
  final String label;
  final Color color;

  const TransparentButtonWithIcon({Key key, this.label, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Icon(
          Icons.arrow_forward_ios,
          textDirection: TextDirection.rtl,
          color: this.color,
        ),
        Text(
          this.label,
          style: TextStyle(
            color: this.color,
          ),
        ),
      ],
    );
  }
}

class TransparentButtonWithRightIcon extends StatelessWidget {
  final String label;
  final Color color;
  final IconData icon;

  const TransparentButtonWithRightIcon(
      {Key key, this.label, this.color, this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          this.label,
          style: TextStyle(
            fontSize: 20.0,
            color: this.color,
          ),
        ),
        Icon(
          this.icon,
          size: this.icon != null ? 24.0 : 0,
          color: this.color,
        ),
      ],
    );
  }
}

const kInputStyle = InputDecoration(
  hintText: '',
  hintStyle: TextStyle(color: Colors.grey),
  filled: true,
  fillColor: Color(0xFFD7D2D2),
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(15.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.lightBlueAccent, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(15.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(15.0)),
  ),
);
