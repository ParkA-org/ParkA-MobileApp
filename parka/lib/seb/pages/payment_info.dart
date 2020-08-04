import "package:flutter/material.dart";
import "../utils/curves_painter.dart";

class PaymentInfoScreen extends StatefulWidget {
  @override
  _PaymentInfoScreenState createState() => _PaymentInfoScreenState();
}

class _PaymentInfoScreenState extends State<PaymentInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0B768C),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
                flex: 4,
                child: WavyHeaderImage(
                  child: Container(
                    color: Colors.white,
                    child: Column(
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
                        CreditCardWidget()
                      ],
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

class CreditCardWidget extends StatelessWidget {
  const CreditCardWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xFF265c88),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      child: Container(
        height: 190.0,
        width: 350.0,
        padding: EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Icon(Icons.credit_card),
            Text(
              "5333 6666 7777 9999",
              textAlign: TextAlign.left,
              style: TextStyle(color: Colors.white),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  "Silvio Arzeno",
                  style: TextStyle(color: Colors.white),
                ),
                Text(
                  "Valido \n hasta",
                  style: TextStyle(color: Colors.white),
                ),
                Text(
                  "05/24",
                  style: TextStyle(color: Colors.white),
                )
              ],
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
