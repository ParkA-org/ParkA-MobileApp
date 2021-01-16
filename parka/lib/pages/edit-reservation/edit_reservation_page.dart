import 'package:ParkA/components/buttons/reservation_form_payment_selector.dart';
import 'package:ParkA/components/buttons/reservation_form_vehicle_selector.dart';
import 'package:ParkA/components/floating-action-button/parka_floating_action_button.dart';
import 'package:ParkA/components/info/info_label.dart';
import 'package:ParkA/components/price/price_tab_widget.dart';
import 'package:ParkA/components/reservation/date_time_reservation_selector.dart';
import 'package:ParkA/controllers/edit-reservation-form/edit_reservation_controller.dart';
import 'package:ParkA/data/data-models/parking/parking_data_model.dart';
import 'package:ParkA/data/data-models/reservation/reservation_data_model.dart';
import 'package:ParkA/data/data-models/schedule/per_day_schedule_data_model.dart';
import 'package:ParkA/data/use-cases/parking/parking_use_cases.dart';
import 'package:ParkA/data/use-cases/reservation/reservation_use_cases.dart';
import 'package:ParkA/pages/create-reservation/utils/generate_schedule_util.dart';
import 'package:ParkA/pages/edit-reservation/steps/confirm_edit_reservation_page.dart';
import 'package:ParkA/pages/edit-reservation/steps/edit_select_payment_method_page.dart';
import 'package:ParkA/pages/edit-reservation/steps/edit_select_vehicle_page.dart';
import 'package:ParkA/styles/parka_colors.dart';
import 'package:ParkA/styles/text.dart';
import 'package:ParkA/utils/form-validations/edit_reservation_form_validator.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class EditParkingReservationPage extends StatefulWidget {
  static String routeName = "edit-parking-reservation-page";

  final String parkingId;
  final String reservationId;

  EditParkingReservationPage({
    @required this.parkingId,
    @required this.reservationId,
  });

  @override
  _EditParkingReservationPageState createState() =>
      _EditParkingReservationPageState();
}

class _EditParkingReservationPageState
    extends State<EditParkingReservationPage> {
  EditReservationFormController _formController =
      Get.put(EditReservationFormController());

  String _parkingId;
  String _reservationId;
  Reservation reservation;
  Parking _parking;
  bool _loading;
  DateTime queryDateTime = new DateTime.now();
  String _lastQueryDate;
  List<PerDaySchedule> parkingAvaliability;
  ReservationScheduleList _scheduleOptions;
  int _startItemIndex;
  int _finishItemIndex;

  //CHECKED

  // NOT CHECKED

  bool _isTimeAfter(String _timeString, String _timeStringToCompare) {
    return getIntTime(_timeString) >= getIntTime(_timeStringToCompare);
  }

  int getIntTime(String _timeString) {
    List _splittedTimeString = _timeString.split(":");

    int ret =
        int.tryParse("${_splittedTimeString[0]}${_splittedTimeString[1]}");

    return ret;
  }

  Future<ReservationScheduleList> getParkingAvalibility(DateTime date) async {
    int dateDiff = date.difference(this.queryDateTime).inDays.abs();

    if (dateDiff >= 7 || this.parkingAvaliability == null) {
      this._lastQueryDate = _formatDate(date);
      this.parkingAvaliability = await ParkingUseCases.getParkingAvaliability(
        this._parkingId,
        _lastQueryDate,
      );
    }

    ReservationScheduleList _parkingAvaiability = getParkingAvaliableSchedule(
      date,
      this._parking.calendar,
      this.parkingAvaliability,
    );

    return _parkingAvaiability;
  }

  void _setStartTime(int idx) {
    ReservationSchedule _start = this._scheduleOptions.start[idx];
    String finish = this._formController.editReservationDto.checkOutDate;
    String _finish =
        this._scheduleOptions.finish[_start.maxRangeValueIdx].value;
    this._startItemIndex = idx;

    if (finish == null || _isTimeAfter(_start.value, _getTime(finish))) {
      this._formController.setStartTime(
            _start.value,
            finishTime: _finish,
          );
      this._finishItemIndex = _start.maxRangeValueIdx;
    } else if (_isTimeAfter(_getTime(finish), _finish)) {
      this._formController.setStartTime(
            _start.value,
            finishTime: _finish,
          );
      this._finishItemIndex = _start.maxRangeValueIdx;
    } else {
      this._formController.setStartTime(_start.value);
    }
  }

  void _setFinishTime(int idx) {
    ReservationSchedule _finish = this._scheduleOptions.finish[idx];
    String start = this._formController.editReservationDto.checkInDate;
    String _start = this._scheduleOptions.start[_finish.minRangeValueIdx].value;
    this._finishItemIndex = idx;

    if (start == null || _isTimeAfter(_getTime(start), _finish.value)) {
      this._formController.setFinishTime(
            _finish.value,
            startTime: _start,
          );
      this._startItemIndex = _finish.minRangeValueIdx;
    } else if (_isTimeAfter(_start, _getTime(start))) {
      this._formController.setFinishTime(
            _finish.value,
            startTime: _start,
          );
      this._startItemIndex = _finish.minRangeValueIdx;
    } else {
      this._formController.setFinishTime(_finish.value);
    }
  }

  void _setReservationDate(DateTime date) async {
    bool check = date.isBefore(DateTime.now());

    date = check ? DateTime.now() : date;

    this._formController.setReservationDate(date);
    this._scheduleOptions = await this.getParkingAvalibility(date);
  }

  // SURE

  String _formatDate(DateTime date) {
    int day = date.day;
    int month = date.month;
    int year = date.year;

    return new DateTime(year, month, day).toIso8601String();
  }

  String _getTime(String _isoDate) {
    if (_isoDate == null) {
      return "";
    }

    String _time = _isoDate.split("T")[1];
    List<String> _splittedTime = _time.split(":");

    return "${_splittedTime[0]}:${_splittedTime[1]}";
  }

  Future getParking() async {
    this._parking = await ParkingUseCases.getParkingById(this._parkingId);

    if (this._parking != null) {
      this._formController.setParkingData(this._parking);
    }
  }

  Future getReservationData() async {
    this.reservation =
        await ReservationUseCases.getReservationById(this._reservationId);
  }

  void _getData() async {
    await getParking();
    await getReservationData();
    this._scheduleOptions =
        await this.getParkingAvalibility(this.queryDateTime);

    this._formController.initReservation(this.reservation);

    setState(() {
      this._loading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    this._loading = true;
    this._parkingId = this.widget.parkingId;
    this._reservationId = this.widget.reservationId;

    this._getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: ParkaFloatingActionButton(
        iconData: Icons.check,
        onPressedHandler: () {
          if (editReservationFormValidator(
              this._formController.editReservationDto)) {
            return Get.to(ConfirmEditReservationPage());
          }

          Get.snackbar(
            "Error",
            "Necesitas llenar todos los campos",
            margin: EdgeInsets.all(8.0),
            backgroundColor: ParkaColors.parkaGoogleRed,
          );
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
                                      '\$RD ${this._parking.priceHours}/Hora',
                                ),
                                Obx(
                                  () => DateTimeReservationPicker(
                                    dateTime: this
                                        ._formController
                                        .editReservationDto
                                        .rentDate,
                                    selectDate: this._setReservationDate,
                                    avaliableTimes: this._scheduleOptions,
                                    startTime: _getTime(this
                                        ._formController
                                        .editReservationDto
                                        .checkInDate),
                                    selectStartHour: this._setStartTime,
                                    finishTIme: _getTime(this
                                        ._formController
                                        .editReservationDto
                                        .checkOutDate),
                                    selectFinishHour: this._setFinishTime,
                                    reservationDuration: this
                                        ._formController
                                        .editReservationDto
                                        .hours,
                                    finishTImeIdx: this._finishItemIndex,
                                    startTimeIdx: this._startItemIndex,
                                  ),
                                ),
                                Divider(
                                  thickness: 1.0,
                                  color: Color(0xFF949494),
                                ),
                                Obx(
                                  () => PaymentMethodSelectorWidget(
                                    payment: this
                                        ._formController
                                        .editReservationDto
                                        .paymentInfo,
                                    onTapHandler: () {
                                      Get.to(
                                        EditSelectPaymentMethodPage(),
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
                                        .editReservationDto
                                        .vehicle,
                                    onTapHandler: () {
                                      Get.to(
                                        EditSelectVehiclePage(),
                                      );
                                    },
                                  ),
                                ),
                                Obx(
                                  () => InfoLabelWidget(
                                    label: "Total:",
                                    value:
                                        "\$${this._formController.editReservationDto.total ?? 0} RD",
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
  final Function selectStartHour;
  final Function selectFinishHour;
  final String startTime;
  final String finishTIme;
  final int startTimeIdx;
  final int finishTImeIdx;
  final double reservationDuration;
  final ReservationScheduleList avaliableTimes;

  const DateTimeReservationPicker({
    Key key,
    this.dateTime,
    this.selectDate,
    this.avaliableTimes,
    this.selectStartHour,
    this.selectFinishHour,
    this.finishTIme,
    this.startTime,
    this.reservationDuration,
    this.finishTImeIdx,
    this.startTimeIdx,
  }) : super(key: key);

  List<String> _formatScheduleList(
    List<ReservationSchedule> _schedule,
  ) {
    List<String> ret = new List();

    _schedule.forEach((element) {
      ret.add(element.value);
    });

    return ret;
  }

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
                      pickerOptions:
                          this._formatScheduleList(this.avaliableTimes.start),
                      hourString: this.startTime ?? "",
                      label: "",
                      initialItemIndex: this.startTimeIdx,
                      setHourString: this.selectStartHour,
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
                      pickerOptions:
                          this._formatScheduleList(this.avaliableTimes.finish),
                      hourString: this.finishTIme ?? "",
                      label: "",
                      initialItemIndex: this.finishTImeIdx,
                      setHourString: this.selectFinishHour,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
        InfoLabelWidget(
          label: "Horas:",
          value: '${this.reservationDuration ?? ""}',
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
  final int initialItemIndex;

  const TimeScheduleSelectorPill({
    Key key,
    this.label,
    this.hourString,
    this.setHourString,
    this.pickerOptions,
    this.initialItemIndex,
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
        if (this.setHourString != null &&
            this.pickerOptions.length > 0 &&
            this.hourString.isEmpty) {
          this.setHourString(0);
        }
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
                  initialItem: this.initialItemIndex ?? 0,
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
