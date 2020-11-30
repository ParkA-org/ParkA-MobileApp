import 'package:ParkA/components/buttons/reservation_form_payment_selector.dart';
import 'package:ParkA/components/buttons/reservation_form_vehicle_selector.dart';
import 'package:ParkA/components/floating-action-button/parka_floating_action_button.dart';
import 'package:ParkA/components/info/info_label.dart';
import 'package:ParkA/components/inputs/parka_time_selector_widget/time_selector_pill_widget.dart';
import 'package:ParkA/components/price/price_tab_widget.dart';
import 'package:ParkA/controllers/create-reservation-form/create_reservation_controller.dart';
import 'package:ParkA/data/data-models/calendar/calendar_data_model.dart';
import 'package:ParkA/data/data-models/parking/parking_data_model.dart';
import 'package:ParkA/data/data-models/schedule/per_day_schedule_data_model.dart';
import 'package:ParkA/data/data-models/schedule/schedule_data_model.dart';
import 'package:ParkA/data/use-cases/parking/parking_use_cases.dart';
import 'package:ParkA/pages/create-reservation/steps/confirm_reservation_page.dart';
import 'package:ParkA/pages/create-reservation/steps/select_payment_method_page.dart';
import 'package:ParkA/pages/create-reservation/steps/select_vehile_page.dart';
import 'package:ParkA/styles/parka_colors.dart';
import 'package:ParkA/styles/text.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class CreateParkingReservationPage extends StatefulWidget {
  static String routeName = "create-parking-reservation-page";

  final String parkingId;

  CreateParkingReservationPage({
    @required this.parkingId,
  });

  @override
  _CreateParkingReservationPageState createState() =>
      _CreateParkingReservationPageState();
}

class _CreateParkingReservationPageState
    extends State<CreateParkingReservationPage> {
  CreateReservationFormController _formController =
      Get.put(CreateReservationFormController());

  String _parkingId;
  Parking _parking;
  bool _loading;
  DateTime queryDateTime = new DateTime.now();
  String _lastQueryDate;
  List<PerDaySchedule> parkingAvaliability;

  //CHECKED

  // NOT CHECKED

  Future getParkingAvalibility(DateTime date) async {
    int dateDiff = date.difference(this.queryDateTime).inDays.abs();

    if (dateDiff >= 7 || this.parkingAvaliability == null) {
      this._lastQueryDate = _formatDate(date);
      this.parkingAvaliability = await ParkingUseCases.getParkingAvaliability(
        this._parkingId,
        _lastQueryDate,
      );
    }

    _getParkingAvaliableSchedule(
      date,
      this._parking.calendar,
      this.parkingAvaliability,
    );

    return;
  }

  List<String> dummyTimes() {
    List<String> ret = new List();

    String hour = "0000";
    int pointer = 0;

    while (pointer <= 2400) {
      ret.add(hour);

      String firstPart = hour.substring(0, 2);
      String secondPart = hour.substring(2);

      int sum2 = int.tryParse(secondPart);
      int sum1 = int.tryParse(firstPart);
      sum2 += 30;

      if (sum2 == 60) {
        sum1 += 1;
        secondPart = "00";
      } else {
        secondPart = sum2.toString();
      }

      firstPart = sum1.toString();
      firstPart = firstPart.length == 1 ? "0$firstPart" : firstPart;

      hour = firstPart + secondPart;
      // print(hour);
      pointer = int.tryParse(hour);
    }

    return ret;
  }

  List<Schedule> _getParkingAvaliableSchedule(
    DateTime _date,
    Calendar _parkingCalendar,
    List<PerDaySchedule> _parkingSchedule,
  ) {
    List<Schedule> ret = new List();
    String filterDate = _formatDate(_date);
    List<Schedule> busySchedule = [];

    int idx =
        _parkingSchedule.indexWhere((element) => element.date == filterDate);
    print(idx);
    print(filterDate);

    if (idx != -1) {
      busySchedule = _parkingSchedule[idx].schedules;
    }

    int dayIdx = _date.weekday - 1;

    List<Schedule> _scheduleDay =
        _parkingCalendar.getDaySchedule(weekDays[weekDaysList[dayIdx]]);
    print("LEN IS ${_scheduleDay.length}");
    print("DAY IS ${weekDaysList[dayIdx]}");

    int pointer = 0;

    if (busySchedule.length == 0) {
      ret = _scheduleDay;
    }

    for (var _schedule in _scheduleDay) {
      Schedule curr = _schedule;

      while (pointer != busySchedule.length &&
          curr.finish > busySchedule[pointer].start) {
        if (busySchedule[pointer].start > curr.start &&
            busySchedule[pointer].finish < curr.finish) {
          ret.add(
            Schedule(
              finish: busySchedule[pointer].start,
              start: curr.start,
            ),
          );
          curr = Schedule(
            finish: curr.finish,
            start: busySchedule[pointer].finish,
          );
          pointer++;
        } else if (busySchedule[pointer].start < curr.finish &&
            busySchedule[pointer].finish == curr.finish) {
          ret.add(
            Schedule(
              start: curr.start,
              finish: busySchedule[pointer].start,
            ),
          );
          pointer++;
          break;
        } else if (busySchedule[pointer].start == curr.start &&
            busySchedule[pointer].finish < curr.finish) {
          curr = Schedule(
            start: busySchedule[pointer].finish,
            finish: curr.finish,
          );
          pointer++;
        } else if (curr.finish > busySchedule[pointer].start) {
          pointer++;
          break;
        }
      }
    }

    ret.forEach((element) {
      print("SCHEDULE IS ${element.start} : ${element.finish}");
    });

    return ret;
  }

  void _dummySetTime(DateTime date) async {
    bool check = date.isBefore(DateTime.now());

    date = check ? DateTime.now() : date;

    this._formController.setReservationDate(date);
    await this.getParkingAvalibility(date);
  }

  // SURE

  String _formatDate(DateTime date) {
    int day = date.day;
    int month = date.month;
    int year = date.year;

    return new DateTime(year, month, day).toIso8601String();
  }

  Future getParking() async {
    this._parking = await ParkingUseCases.getParkingById(this._parkingId);

    if (this._parking != null) {
      this._formController.setParkingData(this._parking);
    }
  }

  void _getData() async {
    await getParking();
    await this.getParkingAvalibility(this.queryDateTime);

    setState(() {
      this._loading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    this._loading = true;
    this._parkingId = this.widget.parkingId;

    this._getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: ParkaFloatingActionButton(
        iconData: Icons.edit,
        onPressedHandler: () {
          Get.to(ConfirmReservationPage());
        },
      ),
      body: SafeArea(
        child: ModalProgressHUD(
          color: ParkaColors.parkaGreen,
          inAsyncCall: this._loading,
          child: this._loading
              ? Container(
                  color: ParkaColors.parkaGreen,
                )
              : CustomScrollView(
                  slivers: [
                    SliverAppBar(
                      pinned: true,
                      expandedHeight: 250.0,
                      backgroundColor: ParkaColors.parkaGreen,
                      flexibleSpace: FlexibleSpaceBar(
                        title: Container(
                          margin: EdgeInsets.only(right: 8.0),
                          padding: EdgeInsets.all(4.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: AutoSizeText(
                                  this._parking.parkingName,
                                  maxLines: 1,
                                  style: kParkaTextStyleBold16,
                                ),
                              ),
                              Expanded(
                                flex: 0,
                                child: Container(
                                  margin: EdgeInsets.symmetric(horizontal: 2.0),
                                  child: Row(
                                    children: [
                                      AutoSizeText(
                                        '${this._parking.rating.toPrecision(2)}',
                                        maxLines: 1,
                                        style: kParkaTextStyleBold16,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(2.0),
                                        child: Icon(
                                          Icons.star,
                                          color: Colors.white,
                                          size: 16.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        background: Stack(
                          alignment: Alignment.center,
                          fit: StackFit.expand,
                          children: [
                            Image(
                              fit: BoxFit.cover,
                              image: NetworkImage(_parking.mainPicture),
                            ),
                            Container(
                              decoration: BoxDecoration(boxShadow: [
                                BoxShadow(
                                  offset: Offset(0, 190.0),
                                  color: Colors.black54,
                                  blurRadius: 18.0,
                                  spreadRadius: 15.0,
                                ),
                              ]),
                            )
                          ],
                        ),
                      ),
                    ),
                    SliverList(
                      delegate: SliverChildListDelegate(
                        [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(
                              24.0,
                              0,
                              24.0,
                              24.0,
                            ),
                            child: Column(
                              children: [
                                ParkingPriceWidgetTab(
                                  label: "Precio por hora",
                                  value:
                                      '\$RD ${this._parking.perHourPrice}/Hora',
                                ),
                                Obx(
                                  () => DateTimeReservationPicker(
                                      dateTime: this
                                          ._formController
                                          .createReservationDto
                                          .rentDate,
                                      selectDate: this._dummySetTime,
                                      avaliableTimes: this.dummyTimes()),
                                ),
                                Divider(
                                  thickness: 1.0,
                                  color: Color(0xFF949494),
                                ),
                                Obx(
                                  () => PaymentMethodSelectorWidget(
                                    payment: this
                                        ._formController
                                        .createReservationDto
                                        .paymentInfo,
                                    onTapHandler: () {
                                      Get.to(
                                        SelectPaymentMethodPage(),
                                      );
                                    },
                                  ),
                                ),
                                Divider(
                                  thickness: 1.0,
                                  color: Color(0xFF949494),
                                ),
                                Obx(
                                  () => VehicleSelectorWidget(
                                    vehicle: this
                                        ._formController
                                        .createReservationDto
                                        .vehicle,
                                    onTapHandler: () {
                                      Get.to(
                                        SelectVehiclePage(),
                                      );
                                    },
                                  ),
                                ),
                                Obx(
                                  () => InfoLabelWidget(
                                    label: "Total:",
                                    value:
                                        "\$${this._formController.createReservationDto.total ?? 0} RD",
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
        ),
      ),
    );
  }
}

class DateTimeReservationPicker extends StatelessWidget {
  final DateTime dateTime;
  final Function selectDate;
  final List<String> avaliableTimes;

  const DateTimeReservationPicker({
    Key key,
    this.dateTime,
    this.selectDate,
    this.avaliableTimes,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            "Elige tu fecha de alquiler",
            style: kParkaTextStyleBoldGreen18,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            "Fecha",
            style: kParkaTextStyleGreen18,
          ),
        ),
        Row(
          children: [
            Expanded(
              flex: 2,
              child: DateTimeScheduleSelectorPill(
                hourString: this.dateTime,
                setHourString: (DateTime date, List<int> value) {
                  this.selectDate(date);
                },
              ),
            ),
            Expanded(
              child: Container(),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        "Desde",
                        style: kParkaTextStyleGreen18,
                      ),
                    ),
                    TimeScheduleSelectorPill(
                      pickerOptions: this.avaliableTimes,
                      hourString: "",
                      label: "",
                      setHourString: (int val) {},
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        "Hasta",
                        style: kParkaTextStyleGreen18,
                      ),
                    ),
                    TimeScheduleSelectorPill(
                      pickerOptions: this.avaliableTimes,
                      hourString: "",
                      label: "",
                      setHourString: (int val) {},
                    )
                  ],
                ),
              ),
            )
          ],
        ),
        InfoLabelWidget(
          label: "Horas:",
          value: "6",
        ),
      ],
    );
  }
}

class TimeScheduleSelectorPill extends StatelessWidget {
  final String hourString;
  final Function setHourString;
  final String label;
  final List<String> pickerOptions;

  const TimeScheduleSelectorPill({
    Key key,
    this.label,
    this.hourString,
    this.setHourString,
    this.pickerOptions,
  }) : super(key: key);

  List<Widget> optionsBuilder() {
    List<Widget> ret = new List();

    this.pickerOptions.forEach((String element) {
      ret.add(
        Center(
          child: Text(element),
        ),
      );
    });

    return ret;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          builder: (BuildContext context) => Container(
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.white,
                automaticallyImplyLeading: false,
                elevation: 0,
                title: Text(
                  this.label ?? "",
                  style: TextStyle(
                    fontFamily: "Montserrat",
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0B768C),
                  ),
                ),
                actions: [
                  IconButton(
                    icon: Icon(
                      Icons.check,
                      color: Color(0xFF0B768C),
                      size: 32.0,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  )
                ],
              ),
              body: CupertinoPicker(
                backgroundColor: Colors.white,
                scrollController: FixedExtentScrollController(
                  initialItem: 0,
                ),
                itemExtent: 60,
                onSelectedItemChanged: this.setHourString ?? (int value) {},
                children: optionsBuilder(),
              ),
            ),
          ),
          context: context,
        );
      },
      child: Container(
        child: AutoSizeText(
          this.hourString ?? "",
          maxLines: 1,
        ),
        padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
        decoration: BoxDecoration(
            color: Color(0xFFC4C4C4),
            borderRadius: BorderRadius.circular(16.0)),
      ),
    );
  }
}

class DateTimeScheduleSelectorPill extends StatelessWidget {
  final DateTime hourString;
  final Function setHourString;

  const DateTimeScheduleSelectorPill({
    Key key,
    @required this.hourString,
    this.setHourString,
  }) : super(key: key);

  String _formatDate() {
    final List<String> months = [
      "Enero",
      "Febrero",
      "Marzo",
      "Abril",
      "Mayo",
      "Junio",
      "Julio",
      "Agosto",
      "Septiembre",
      "Octubre",
      "Noviembre",
      "Diciembre",
    ];

    if (this.hourString == null) return "";
    int day = this.hourString.day;
    int year = this.hourString.year;
    int month = this.hourString.month;

    return "$day de ${months[month - 1]} $year";
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showModalBottomSheet(
        context: context,
        builder: (context) => Container(
          child: DatePickerWidget(
            onConfirm: setHourString ??
                (DateTime date, List<int> value) {
                  return;
                },
            dateFormat: 'dd/MM/yyyy',
            initialDateTime: this.hourString,
            onChange: setHourString ??
                (DateTime date, List<int> value) {
                  return;
                },
            minDateTime: DateTime(2020),
            pickerTheme: DateTimePickerTheme(
              itemTextStyle: TextStyle(
                fontFamily: "Montserrat",
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(
                  0xFF0B768C,
                ),
              ),
            ),
          ),
        ),
      ),
      child: Container(
        child: AutoSizeText(
          this._formatDate(),
          maxLines: 1,
        ),
        padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
        decoration: BoxDecoration(
          color: Color(0xFFC4C4C4),
          borderRadius: BorderRadius.circular(16.0),
        ),
      ),
    );
  }
}
