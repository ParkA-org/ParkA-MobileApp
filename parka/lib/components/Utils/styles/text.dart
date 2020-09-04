import 'package:ParkA/components/Utils/styles/parka-colors.dart';
import 'package:flutter/material.dart';

final kParkaTextBaseStyle = TextStyle(
  color: ParkaColors.parkaGreen,
  fontFamily: "Montserrat",
  fontWeight: FontWeight.bold,
);

final kParkaInputDefaultSyle = kParkaTextBaseStyle.copyWith(
  fontSize: 16,
  color: Colors.white,
);

final kParkaInputTextStyle = kParkaTextBaseStyle.copyWith(
  fontSize: 16,
  color: Colors.black,
);

final kParkaButtonTextStyle = kParkaTextBaseStyle.copyWith(
  fontSize: 20.0,
);

final kParkaPageTitleTextStyle = kParkaTextBaseStyle.copyWith(
  fontSize: 32.0,
);

final kParkaBigTitleTextStyle = kParkaTextBaseStyle.copyWith(
  fontSize: 48.0,
);
