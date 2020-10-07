import 'package:ParkA/components/Utils/styles/parka_colors.dart';
import 'package:ParkA/components/Utils/styles/text.dart';
import 'package:flutter/material.dart';

class ParkaServiceHistoryWidget extends StatelessWidget {
  const ParkaServiceHistoryWidget({
    Key key,
  }) : super(key: key);

  // TODO: Create dynamicity and props to accept data
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final double tileHeight = constraints.maxWidth / 2.5;

      return Container(
        height: tileHeight,
        child: Column(
          children: [
            Expanded(
              flex: 0,
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Se estaciono en",
                  style: kParkaTextBaseStyleBold,
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    flex: 0,
                    child: Center(
                      child: Container(
                        margin: EdgeInsets.fromLTRB(0, 8.0, 16.0, 8.0),
                        height: 100.0,
                        width: 100.0,
                        child: Image.asset("resources/images/small_map.png"),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: Text(
                            "Alma Rosa I",
                            style: kParkaBigButtonTextStyle.copyWith(
                              color: ParkaColors.parkaGreen,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Fecha", style: kParkaTextBaseStyleBold),
                              Text(
                                "Ago 16,2020",
                                style: kParkaTextBaseStyleBold.copyWith(
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Vehiculo", style: kParkaTextBaseStyleBold),
                              Text(
                                "Tesla Model 3",
                                style: kParkaTextBaseStyleBold.copyWith(
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Tiempo", style: kParkaTextBaseStyleBold),
                              Text(
                                "3 Horas",
                                style: kParkaTextBaseStyleBold.copyWith(
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 0,
                    child: GestureDetector(
                      onTap: () {},
                      child: Icon(
                        Icons.arrow_forward_ios,
                        size: tileHeight / 3,
                        color: ParkaColors.parkaGreen,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 0,
              child: Divider(
                thickness: 1.0,
                color: Color(0xFF949494),
              ),
            )
          ],
        ),
      );
    });
  }
}
