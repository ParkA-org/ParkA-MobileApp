import 'package:ParkA/data/data-models/parking/parking_data_model.dart';
import 'package:ParkA/data/use-cases/parking/parking_use_cases.dart';
import 'package:ParkA/styles/parka_colors.dart';
import 'package:ParkA/styles/text.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class ParkingTile extends StatelessWidget {
  const ParkingTile({
    Key key,
    this.parking,
    this.onTapHandler,
    this.screenSize,
  }) : super(key: key);
  final Parking parking;
  final Function onTapHandler;
  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    Future<bool> confirmDelete() async {
      bool _response;
      await showDialog(
          context: context,
          builder: (_) => AlertDialog(
                title: Text("Eliminar parqueo?"),
                content: Text("Esta seguro que desea eliminar este parqueo?"),
                actions: [
                  FlatButton(
                    onPressed: () {
                      _response = true;
                      Navigator.pop(context);
                    },
                    child: Text("Si"),
                  ),
                  FlatButton(
                    onPressed: () {
                      _response = false;
                      Navigator.pop(context);
                    },
                    child: Text(
                      "No",
                      style: TextStyle(color: Colors.red),
                    ),
                  )
                ],
              ));

      return _response ?? false;
    }

    return Dismissible(
      key: UniqueKey(),
      confirmDismiss: (direction) async => await confirmDelete(),
      onDismissed: (direction) async =>
          await ParkingUseCases.deleteParking(this.parking.id),
      direction: DismissDirection.endToStart,
      background: Container(
        alignment: Alignment.centerRight,
        color: Colors.red,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Icon(
            Icons.delete,
            size: 50,
            color: Colors.white,
          ),
        ),
      ),
      child: GestureDetector(
        onTap: this.onTapHandler,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 6.0),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: this.screenSize.height * 0.15,
                      width: this.screenSize.width * 0.50,
                      margin: EdgeInsets.symmetric(vertical: 5.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0.0, 5.0),
                              color: Colors.black38,
                              blurRadius: 5.0,
                            )
                          ],
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage("${parking.mainPicture}"))),
                    ),
                    Container(
                      width: this.screenSize.width * 0.40,
                      height: this.screenSize.height * 0.15,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 8.0, right: 10, top: 3.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AutoSizeText(
                              "Precio:",
                              maxFontSize: 24,
                              minFontSize: 18,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: kParkaTextBaseStyle.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: AutoSizeText(
                                "${this.parking.priceHours}",
                                maxFontSize: 24,
                                minFontSize: 18,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: kParkaTextBaseStyle.copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            AutoSizeText(
                              "Status:",
                              maxFontSize: 24,
                              minFontSize: 18,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: kParkaTextBaseStyle.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            this.parking.isAvailable
                                ? AutoSizeText(
                                    "Disponible",
                                    maxFontSize: 24,
                                    minFontSize: 18,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: kParkaTextBaseStyle.copyWith(
                                      color: Colors.green[600],
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                : AutoSizeText(
                                    "Ocupado",
                                    maxFontSize: 24,
                                    minFontSize: 18,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: kParkaTextBaseStyle.copyWith(
                                      color: Colors.red[600],
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 2.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: AutoSizeText(
                          "${parking.parkingName}",
                          maxFontSize: 24,
                          minFontSize: 22,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: kParkaTextBaseStyle.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Colors.black87),
                        ),
                      ),
                      Expanded(
                        flex: 0,
                        child: Row(
                          children: [
                            Text(
                              "${parking.rating}",
                              style: kParkaTextBaseStyle.copyWith(
                                fontSize: 24,
                              ),
                            ),
                            Icon(
                              Icons.star,
                              color: ParkaColors.parkaGreen,
                              size: 30.0,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Divider(
                    color: Color(0xFFA9A5A5),
                    thickness: 1,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
