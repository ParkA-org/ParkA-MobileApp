import 'package:ParkA/components/buttons/round_button.dart';
import 'package:ParkA/components/buttons/transparent_button.dart';
import 'package:ParkA/components/headers/parka_header.dart';
import 'package:ParkA/components/images/parka_add_images_carousel.dart';
import 'package:ParkA/components/images/parka_image_card_widget.dart';
import 'package:ParkA/controllers/create-parking-form/create_parking_form_controller.dart';
import 'package:ParkA/data/enums/parking_place_holder_type.dart';
import 'package:ParkA/data/use-cases/parking/parking_use_cases.dart';
import 'package:ParkA/pages/create-vehicle/create_vehicle_page.dart';

import 'package:ParkA/pages/parking-detail/parking_detail_page.dart';
import 'package:ParkA/pages/parkings/parking_page.dart';
import 'package:ParkA/styles/parka_colors.dart';
import 'package:ParkA/styles/text.dart';
import 'package:ParkA/utils/form-validations/create_parking_form_validation.dart';
import 'package:ParkA/utils/functions/pick_image.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ParkingImageSelectorPage extends StatelessWidget {
  static String routeName = 'parking-image-selector-page';

  final createParkingFormController = Get.find<CreateParkingFormController>();

  Future removeVehicle(int index) {
    return Get.dialog(RemoveCarImageAlert(
      removeImage: () {
        print(index);

        createParkingFormController.removeSecondaryPicture(index);

        Get.back();
      },
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 0,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: ParkaHeader(
                  color: Colors.white,
                  leading: TransparentButton(
                    label: "Atras",
                    buttonTextStyle: kParkaInputDefaultSyle,
                    color: Colors.white,
                    leadingIconData: Icons.keyboard_arrow_left,
                    onTapHandler: () {
                      Get.find<CreateParkingFormController>().decrement();
                      Get.back();
                    },
                  ),
                ),
                decoration: BoxDecoration(
                  color: ParkaColors.parkaGreen,
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(12.0),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
                    child: AutoSizeText(
                      "Muestranos tu parqueo",
                      maxLines: 1,
                      style: kParkaPageTitleTextStyle,
                    ),
                  ),
                  Expanded(
                    flex: 0,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Foto principal",
                        style: kParkaTextBaseStyle.copyWith(fontSize: 16.0),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Obx(
                      () => ParkaImageCardWidget(
                        image: createParkingFormController
                            .createPArkingDto.value.mainPicture,
                        type: PlaceHolderType.Parking,
                        carouselType: CarouselType.Form,
                        onTapHandler: () async {
                          String imagePath = await getImageFunction();
                          if (imagePath != null) {
                            createParkingFormController
                                .setMainPicture(imagePath);
                          }
                        },
                        onLongPressHandler: this.removeVehicle,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 0,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Fotos adicionales",
                        style: kParkaTextBaseStyle.copyWith(fontSize: 16.0),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Obx(
                      () => ParkaAddImagesCarousel(
                        carouselType: CarouselType.Form,
                        pictures: createParkingFormController
                            .createPArkingDto.value.pictures,
                        placeholderType: PlaceHolderType.Parking,
                        onTapHandler: () async {
                          String imagePath = await getImageFunction();
                          if (imagePath != null) {
                            createParkingFormController
                                .addSecondaryPicture(imagePath);
                          }
                        },
                        onLongPressHandler: this.removeVehicle,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 0,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: RoundedButton(
                  label: "Guardar",
                  color: ParkaColors.parkaGreen,
                  hasIcon: false,
                  hasShadow: false,
                  onTapHandler: () async {
                    final formCheck = createParkingFormValidator(
                        createParkingFormController.createPArkingDto.value);

                    if (!formCheck) {
                      Get.snackbar(
                        "Error",
                        "Necesitas llenar todos los campos del formulario",
                        backgroundColor: ParkaColors.parkaLightRed,
                      );
                      return;
                    }

                    final createdCheck = await ParkingUseCases.createParking(
                        createParkingFormController.createPArkingDto.value);

                    if (createdCheck == null) {
                      Get.snackbar(
                        "Error",
                        "Ocurrio un error creando tu parqueo",
                        backgroundColor: ParkaColors.parkaLightRed,
                      );
                      return;
                    }

                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (ctx) => OwnerParkingDetailPage(
                            parkingId: createdCheck,
                          ),
                        ),
                        ModalRoute.withName(ParkingPage.routeName));
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
