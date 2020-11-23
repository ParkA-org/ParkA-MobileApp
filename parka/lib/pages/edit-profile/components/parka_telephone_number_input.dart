import 'package:ParkA/styles/inputs.dart';
import 'package:ParkA/styles/text.dart';
import 'package:flutter/material.dart';

class ParkaTelephoneNumberInput extends StatelessWidget {
  final Function telephoneNumberHandler;

  const ParkaTelephoneNumberInput({
    Key key,
    this.telephoneNumberHandler,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 0,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.phone,
                    color: Colors.white,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Numero de Telefono",
                    style: kParkaBigButtonTextStyle,
                  ),
                ),
              )
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(3.0, 10.0),
                            color: Colors.black38,
                            blurRadius: 5.0,
                          ),
                        ]),
                    child: TextField(
                      maxLength: 3,
                      decoration: kInputStyleSlim,
                      onChanged: (String text) {
                        this.telephoneNumberHandler(text, true);
                      },
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(3.0, 10.0),
                            color: Colors.black38,
                            blurRadius: 5.0,
                          ),
                        ]),
                    child: TextField(
                      maxLength: 10,
                      decoration: kInputStyleSlim,
                      onChanged: (String text) {
                        this.telephoneNumberHandler(text, false);
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
