import 'package:ParkA/components/filter-result-tile/filter_result_tile.dart';
import 'package:ParkA/components/headers/parka_header.dart';
import 'package:ParkA/controllers/map_controller.dart';
import 'package:ParkA/data/data-models/parking/parking_data_model.dart';
import 'package:ParkA/data/use-cases/parking/parking_use_cases.dart';
import 'package:ParkA/pages/parking-detail/parking_detail_page.dart';

import 'package:ParkA/styles/parka_colors.dart';
import 'package:ParkA/styles/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'components/favorite_place_button.dart';
import 'components/search_section.dart';

class SearchPanel extends StatefulWidget {
  final BuildContext mainContext;

  SearchPanel({
    Key key,
    this.mainContext,
  }) : super(key: key);
  static const String routeName = "/SearchPage";

  @override
  _SearchPanelState createState() => _SearchPanelState();
}

class _SearchPanelState extends State<SearchPanel> {
  final mapController = Get.find<MapController>();

  List<Parking> currentParkings = [];

  void getAllParkings() async {
    // await list();
    // mapController.setCurrentParkings(currentParkings);
    mapController.searchParkings(null);
  }

  Future<List<Parking>> list() async =>
      currentParkings = await ParkingUseCases.getAllParking();

  List<Widget> searchResultBuilder(List<Parking> filteredResults) {
    List<Widget> searchResults = [];
    filteredResults.forEach((parking) {
      searchResults.add(GestureDetector(
        onTap: () {
          Get.to(OwnerParkingDetailPage(
            parkingId: parking.id,
            editable: false,
          ));
        },
        child: FilterResultTile(
          parkingId: parking.id,
          parkingName: parking.parkingName,
          parkingPrice: "${parking.priceHours} RD Por Hora",
          rating: "${parking.rating.toString()}",
        ),
      ));
    });
    return searchResults;
  }

  @override
  void initState() {
    super.initState();
    getAllParkings();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 0,
              child: Container(
                color: ParkaColors.parkaGreen,
                child: Padding(
                  padding: EdgeInsets.only(
                      top: this.widget.mainContext == null
                          ? 0
                          : MediaQuery.of(this.widget.mainContext).padding.top),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ParkaHeader(
                      color: Colors.white,
                      leading: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.arrow_back_ios,
                        ),
                      ),
                      central: Text(
                        'Buscar Parqueo',
                        style: kParkaTextStyleBoldWhite22,
                        textAlign: TextAlign.center,
                      ),
                      trailing: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.transparent,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 0,
              child: SearchSection(),
            ),
            Expanded(
              flex: 0,
              child: FavoritePlaceButton(),
            ),
            Expanded(
              child: GetBuilder<MapController>(
                  init: mapController,
                  builder: (_) => ListView(
                        children:
                            searchResultBuilder(mapController.filteredResults),
                      )),
            ),
          ],
        ),
      ),
    );
  }
}
