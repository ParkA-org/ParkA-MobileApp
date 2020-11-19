import 'package:ParkA/styles/parka_colors.dart';
import 'package:flutter/material.dart';

final kParkaTextBaseStyle = TextStyle(
  color: ParkaColors.parkaGreen,
  fontFamily: "Montserrat",
);

final kParkaTextBaseStyleWhite = TextStyle(
  color: Colors.white,
  fontFamily: "Montserrat",
);

final kParkaTextBaseStyleBold = TextStyle(
  color: ParkaColors.parkaGreen,
  fontFamily: "Montserrat",
  fontWeight: FontWeight.bold,
);

final kParkaInputDefaultSyle = kParkaTextBaseStyleBold.copyWith(
  fontSize: 16,
  color: Colors.white,
);

final kParkaInputTextStyle = kParkaTextBaseStyleBold.copyWith(
  fontSize: 16,
  color: Colors.black,
);

final kParkaInputTextStyleGrey = kParkaTextBaseStyle.copyWith(
  color: ParkaColors.parkaGrey,
);

final kParkaButtonTextStyle = kParkaTextBaseStyleBold.copyWith(
  fontSize: 20.0,
);

final kParkaTextStyleBoldWhite20 = kParkaTextBaseStyleBold.copyWith(
  fontSize: 20.0,
  color: Colors.white,
);

final kParkaTextStyleBoldWhite24 = kParkaTextBaseStyleBold.copyWith(
  fontSize: 24.0,
  color: Colors.white,
);

final kParkaTextStyleWhite20 = kParkaTextBaseStyle.copyWith(
  fontSize: 20.0,
  color: Colors.white,
);

final kParkaTextStyleGrey = kParkaTextBaseStyle.copyWith(
  color: ParkaColors.parkaGreen,
  fontSize: 20.0,
);

final kParkaBigButtonTextStyle = kParkaTextBaseStyleBold.copyWith(
  color: Colors.white,
  fontSize: 22.0,
);

final kParkaBigButtonTextStyleGreen22 =
    kParkaBigButtonTextStyle.copyWith(color: ParkaColors.parkaGreen);

final kParkaPageTitleTextStyle = kParkaTextBaseStyleBold.copyWith(
  fontSize: 32.0,
);

final kParkaBigTitleTextStyle = kParkaTextBaseStyleBold.copyWith(
  fontSize: 48.0,
);

final kParkaPaymentFormStyle = kParkaTextBaseStyleBold.copyWith(
  fontSize: 18.0,
);

final kParkaInputDefaultStyleBlue = kParkaTextBaseStyleBold.copyWith(
  fontSize: 16,
  color: ParkaColors.parkaGreen,
);
