import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum CreditCardTypes { visa, mastercard, unknown }

extension CreditCard on CreditCardTypes {
  static const Map cards = {
    CreditCardTypes.mastercard: {
      "icon": FontAwesomeIcons.ccMastercard,
      "color": [
        Color(0xFF042843),
        Color(0xFF726E9E),
      ]
    },
    CreditCardTypes.visa: {
      "icon": FontAwesomeIcons.ccVisa,
      "color": [
        Color(0xFF52B6FE),
        Color(0xFF6154FE),
      ]
    },
    CreditCardTypes.unknown: {
      "icon": FontAwesomeIcons.ccAmazonPay,
      "color": [
        Color(0xFF3D79A2),
        Color(0xFF215787),
      ]
    }
  };

  Map<String, dynamic> get gradient => cards[this];
}
