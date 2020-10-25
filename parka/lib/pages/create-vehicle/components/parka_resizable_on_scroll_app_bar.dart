import 'package:ParkA/components/headers/parka_header.dart';
import 'package:ParkA/styles/parkaIcons.dart';
import 'package:ParkA/styles/parka_colors.dart';
import 'package:auto_size_text/auto_size_text.dart';
import "package:flutter/material.dart";

class ParkaResizableOnScrollAppBar extends StatelessWidget {
  final appBarHeight;
  final headerHeight = 28.0;
  final minAppBarHeight = 56.0;

  const ParkaResizableOnScrollAppBar({
    Key key,
    this.appBarHeight = 256.0,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      backgroundColor: ParkaColors.parkaGreen,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(16.0),
        ),
      ),
      expandedHeight: this.appBarHeight,
      leading: Container(),
      flexibleSpace: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 0,
              child: Container(
                height: this.headerHeight,
                child: ParkaHeader(
                  color: Colors.white,
                ),
              ),
            ),
            Expanded(
              child: LayoutBuilder(
                builder: (ctx, constraints) {
                  final childrenSpace = constraints.maxHeight / 2;
                  final carProportion = childrenSpace /
                      ((this.appBarHeight - this.headerHeight) / 2);
                  final resizableSpace = (minAppBarHeight - headerHeight) / 2;

                  return Column(
                    children: [
                      Expanded(
                        flex: childrenSpace > resizableSpace ? 1 : 0,
                        child: Container(
                          alignment: Alignment.centerLeft,
                          height: childrenSpace > resizableSpace
                              ? childrenSpace
                              : 0.0,
                          child: Icon(
                            ParkaIcons.parkaCar,
                            size: childrenSpace > resizableSpace
                                ? childrenSpace
                                : 0.0,
                            color: Color.fromRGBO(255, 255, 255,
                                carProportion == 1 ? 1 : carProportion / 2),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: childrenSpace > resizableSpace ? 1 : 0,
                        child: Center(
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: AutoSizeText(
                              "Agrega tu vehiculo",
                              textAlign: TextAlign.center,
                              maxLines: 1,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: constraints.maxHeight * 0.8,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Montserrat",
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
