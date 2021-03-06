import 'package:ParkA/components/headers/parka_header.dart';
import 'package:ParkA/styles/parkaIcons.dart';
import 'package:ParkA/styles/parka_colors.dart';
import 'package:auto_size_text/auto_size_text.dart';
import "package:flutter/material.dart";

class ParkaResizableOnScrollAppBar extends StatelessWidget {
  final appBarHeight;
  final headerHeight = 36.0;
  final minAppBarHeight = 140.0;
  final preferredSize;
  final title;
  final pinned;

  const ParkaResizableOnScrollAppBar({
    Key key,
    this.title = "Agrega tu vehiculo",
    this.appBarHeight = 256.0,
    this.pinned = true,
    this.preferredSize = 30,
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
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(preferredSize / 2),
        child: Container(),
      ),
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
                      this.title != "Tus Parqueos"
                          ? Expanded(
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
                                  color: Color.fromRGBO(
                                      255,
                                      255,
                                      255,
                                      carProportion > 0.9
                                          ? 1
                                          : carProportion / 2),
                                ),
                              ),
                            )
                          : Container(),
                      Expanded(
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 16.0,
                            ),
                            child: AutoSizeText(
                              this.title,
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
