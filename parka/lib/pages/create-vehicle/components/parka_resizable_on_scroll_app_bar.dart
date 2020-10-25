import 'package:ParkA/components/headers/parka_header.dart';
import 'package:ParkA/styles/parkaIcons.dart';
import 'package:ParkA/styles/parka_colors.dart';
import 'package:auto_size_text/auto_size_text.dart';
import "package:flutter/material.dart";

class ParkaResizableOnScrollAppBar extends StatelessWidget {
  const ParkaResizableOnScrollAppBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      backgroundColor: ParkaColors.parkaGreen,
      expandedHeight: 256.0,
      leading: Container(),
      // title: Text("Agrega un Vehiculo"),
      flexibleSpace: LayoutBuilder(
        builder: (BuildContext contex, cons) {
          // print(cons.maxHeight);

          return ConstrainedBox(
            constraints: cons,
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 0,
                    child: Container(
                      padding: EdgeInsets.only(
                        bottom: (cons.maxHeight - 56.0 - 70.0) > 0 ? 16.0 : 0,
                      ),
                      child: ParkaHeader(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Icon(
                      ParkaIcons.parkaCar,
                      color: Color.fromRGBO(
                          255,
                          255,
                          255,
                          (cons.maxHeight - 56.0 - 70.0) / 130 == 1
                              ? 1
                              : ((cons.maxHeight - 56.0 - 70.0) > 0
                                      ? (cons.maxHeight - 56.0 - 70.0)
                                      : 0) /
                                  390
                          // (((cons.maxHeight - 56.0 - 70.0))) > 0.4
                          //     ? (cons.maxHeight - 56.0 - 70.0) / 130
                          //     : ((cons.maxHeight - 56.0 - 70.0) > 0
                          //             ? (cons.maxHeight - 56.0 - 70.0)
                          //             : 0) /
                          //         260,
                          ),
                      size: (cons.maxHeight - 56.0 - 70.0) > 0
                          ? (cons.maxHeight - 56.0 - 70.0)
                          : 0,
                    ),
                  ),
                  Expanded(
                      child: Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: LayoutBuilder(
                        builder: (ctx, constr) {
                          // print(constr.maxHeight);
                          return AutoSizeText(
                            "Agrega tu vehiculo",
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: constr.maxHeight * 0.5,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Montserrat",
                            ),
                          );
                        },
                      ),
                    ),
                  ))
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
