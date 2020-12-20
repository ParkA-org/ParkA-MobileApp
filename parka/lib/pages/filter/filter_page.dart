import 'package:ParkA/components/floating-action-button/parka_floating_action_button.dart';
import 'package:ParkA/components/headers/parka_header.dart';
import 'package:ParkA/components/tabs/feature_tab.dart';
import 'package:ParkA/controllers/map_controller.dart';
import 'package:ParkA/data/data-models/feature/parking_feature_data_model.dart';
import 'package:ParkA/data/use-cases/feature/feature_use_cases.dart';
import 'package:ParkA/pages/filter/components/featureFilterWidget/feature_filter_widget.dart';
import 'package:ParkA/pages/filter/components/top_bar.dart';
import 'package:ParkA/styles/parka_colors.dart';
import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'components/slider_price_widget.dart';
import 'components/star_rating_widget.dart';

class FilterPage extends StatefulWidget {
  static String routeName = "/parkSearchFilterPage";

  @override
  _FilterPageState createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  MapController _mapController = Get.find<MapController>();

  double minRentPriceFilter = 50.0;
  double maxRentPriceFilter = 2000.0;

  String minHour = '';
  String maxHour = '';

  List<Feature> features;
  bool _loadingData;

  @override
  void initState() {
    super.initState();

    this._loadingData = true;
    getFormData();
  }

  List<Widget> featureListBuilder(
      List<Feature> _features, List<String> _selectedFeatures) {
    List<Widget> ret = new List();

    _features.forEach((element) {
      bool check = _selectedFeatures.indexOf(element.id) != -1;

      ret.add(FeatureTab(
        feature: element,
        selected: check,
        onTapHanlder: (bool _selected) {
          if (!_selected)
            this._mapController.addFeature(element.id);
          else
            this._mapController.removeFeature(element.id);
        },
      ));
    });

    return ret;
  }

  void getFormData() async {
    this.features = await FeatureUseCases.getAllFeatures();

    setState(() {
      this._loadingData = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: ParkaFloatingActionButton(
        iconData: Icons.search,
        onPressedHandler: this._mapController.loadParkings,
      ),
      body: SafeArea(
        child: ModalProgressHUD(
          inAsyncCall: this._loadingData,
          child: this._loadingData
              ? Container()
              : Column(
                  children: [
                    Expanded(
                      flex: 0,
                      child: ParkaHeader(
                        color: ParkaColors.parkaGreen,
                      ),
                    ),
                    Expanded(
                      flex: 0,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20.0,
                        ),
                        child: FilterPageTopBar(
                          onTapHandler: this._mapController.resetFilters,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20.0,
                        ),
                        child: ListView(
                          shrinkWrap: true,
                          children: [
                            Obx(
                              () => StarRatingFilter(
                                rating: this
                                    ._mapController
                                    .parkingFilterDto
                                    .rating
                                    .toInt(),
                                rateHandler: this._mapController.setRating,
                              ),
                            ),
                            Obx(
                              () => PriceSliderWidget(
                                rentPriceFilter: this
                                        ._mapController
                                        .parkingFilterDto
                                        .maxPrice ??
                                    (this.minRentPriceFilter +
                                            this.maxRentPriceFilter) /
                                        2,
                                minSliderValue: this.minRentPriceFilter,
                                maxSliderValue: this.maxRentPriceFilter,
                                sliderChangeHandler:
                                    this._mapController.setMaxPrice,
                              ),
                            ),
                            Obx(
                              () => ExpansionTile(
                                title: Text(
                                  "Caracteristicas",
                                  style: TextStyle(
                                      color: Color(0xFF0B768C),
                                      fontSize: 28.0,
                                      fontWeight: FontWeight.bold),
                                ),
                                children: [
                                  GridView.count(
                                    crossAxisCount: 2,
                                    children: featureListBuilder(
                                        this.features,
                                        this
                                            ._mapController
                                            .parkingFilterDto
                                            .features),
                                    shrinkWrap: true,
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: Text(
                                "Terminos y condiciones legales",
                                style: TextStyle(
                                  color: ParkaColors.parkaGreen,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
        ),
      ),
    );
  }
}
