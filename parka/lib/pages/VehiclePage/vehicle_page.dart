import 'package:ParkA/components/Headers/parka_header.dart';
import 'package:ParkA/components/Utils/styles/parka_colors.dart';
import "package:flutter/material.dart";
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../components/Utils/parkaIcons.dart';

class VehiclePage extends StatefulWidget {
  static const String routeName = "/user-vehicles";

  @override
  __VehiclePageState createState() => __VehiclePageState();
}

class __VehiclePageState extends State<VehiclePage> {
  // final graphqlClient = Get.find<GraphqlClientController>();
  bool vehiclesLoaded;
  List userVehicles;

  Future getAllUserVehicle() async {
    // this.userVehicles = await VehicleUseCases.getAllUserVehicles();
    setState(() {
      this.vehiclesLoaded = true;
    });
  }

  @override
  void initState() {
    super.initState();
    this.vehiclesLoaded = false;
    this.getAllUserVehicle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: FloatingActionButton(
        elevation: 10.0,
        backgroundColor: Color(0xFF086174),
        child: Icon(
          Icons.add,
          size: 40,
        ),
        highlightElevation: 20,
        // TO IMPLEMENT CREATE MY VEHICLE
        onPressed: () {},
        // onPressed: () {
        //   Get.toNamed(PaymentInfoScreen.routeName);
        // },
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                    color: ParkaColors.parkaGreen,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15.0),
                      bottomRight: Radius.circular(15.0),
                    ),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(3.0, 7.0),
                        color: Colors.black38,
                        blurRadius: 5.0,
                      ),
                    ]),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ParkaHeader(
                      color: Colors.white,
                    ),
                    Icon(
                      ParkaIcons.parkaCar,
                      color: Colors.white,
                      size: 145.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30.0),
                      child: Text(
                        'Tus Vehiculos',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 45,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Montserrat"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: this.vehiclesLoaded
                  ? ListView( children: [Container(child: Column(children: [Image.network('https://www.diariomotor.com/imagenes/picscache/1920x1600c/tesla-model-s-p100d_1920x1600c.jpg'), Text('text')],),),],)
                  : Padding(
                      padding: const EdgeInsets.symmetric(vertical: 100.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            "resources/images/QuestionCar.svg",
                            width: 160.0,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                            child: Text(
                              'No tienes vehiculos registrados',
                              style: TextStyle(
                                  color: ParkaColors.parkaGreen,
                                  fontFamily: "Montserrat",
                                  fontSize: 35),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
            )
          ],
        ),
      ),
    );
  }
}
