import 'package:ParkA/components/headers/parka_header.dart';
import 'package:ParkA/styles/parka_colors.dart';
import 'package:auto_size_text/auto_size_text.dart';
import "package:flutter/material.dart";

class HistorySliverAppBar extends StatelessWidget {
  final appBarHeight;
  final headerHeight = 36.0;
  final minAppBarHeight = 150.0;
  final title;

  final String typeTitle;

  const HistorySliverAppBar({
    Key key,
    this.title = "Historial",
    this.appBarHeight = 150.0,
    this.typeTitle = "Anfitrión",
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      collapsedHeight: 125.0,
      backgroundColor: ParkaColors.parkaGreen,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(16.0),
        ),
      ),
      expandedHeight: this.appBarHeight,
      centerTitle: true,
      leading: Container(),
      flexibleSpace: Container(
        child: Column(
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
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 16.0,
                          ),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                AutoSizeText(
                                  this.title,
                                  textAlign: TextAlign.center,
                                  maxLines: 1,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: constraints.maxHeight * 0.5,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Montserrat",
                                  ),
                                ),
                                Icon(Icons.history,
                                    size: constraints.maxHeight * 0.45,
                                    color: Colors.white)
                              ]),
                        ),
                      ),
                      Divider(
                        color: Colors.white,
                        thickness: constraints.maxHeight / 100,
                        indent: 15.0,
                        endIndent: 15.0,
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 16.0,
                          ),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                AutoSizeText(
                                  this.typeTitle,
                                  textAlign: TextAlign.center,
                                  maxLines: 1,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: constraints.maxHeight * 0.5,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Montserrat",
                                  ),
                                ),
                              ]),
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
