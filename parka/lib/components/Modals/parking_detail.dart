import 'package:ParkA/components/Utils/styles/text.dart';
import 'package:flutter/material.dart';

class ParkingDetailModal extends StatefulWidget {
  ParkingDetailModal({Key key}) : super(key: key);

  @override
  _ParkingDetailModalState createState() => _ParkingDetailModalState();
}

class _ParkingDetailModalState extends State<ParkingDetailModal> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: DraggableScrollableSheet(
        builder: (context, scrollController) => SingleChildScrollView(
          child: Center(
              child: Text(
            "Calle Puerto Rico #175",
            style: kParkaBigTitleTextStyle,
          )),
        ),
      ),
    );
  }
}
