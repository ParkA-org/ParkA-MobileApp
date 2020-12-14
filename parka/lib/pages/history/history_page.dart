import 'package:ParkA/data/data-models/reservation/reservation_data_model.dart';
import 'package:ParkA/data/use-cases/reservation/reservation_use_cases.dart';
import 'package:ParkA/pages/create-vehicle/components/parka_resizable_on_scroll_app_bar.dart';
import 'package:ParkA/pages/history/Components/reservation_placeholder.dart';
import 'package:ParkA/pages/history/Components/reservation_tile.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class HistoryPage extends StatefulWidget {
  final type;

  HistoryPage({Key key, this.type}) : super(key: key);

  @override
  _HistoryPageState createState() => _HistoryPageState();

  static String routeName = "/history";
}

class _HistoryPageState extends State<HistoryPage> {
  bool _loading;
  List<Reservation> currentReservations = new List();

  List<Widget> reservationListBuilder() {
    List<Widget> reservationResults = new List();

    currentReservations.forEach((reservation) {
      reservationResults.add(ReservationTile(
        reservation: reservation,
      ));
    });

    return reservationResults;
  }

  Future<void> getAllUserReservations() async {
    this.widget.type == 'Owner'
        ? currentReservations =
            await ReservationUseCases.getAllReservationsAsOwner()
        : currentReservations =
            await ReservationUseCases.getAllReservationsAsClient();

    setState(() {
      this._loading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _loading = true;
    getAllUserReservations();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: ModalProgressHUD(
        inAsyncCall: _loading,
        child: RefreshIndicator(
          onRefresh: this.getAllUserReservations,
          child: CustomScrollView(
            slivers: [
              ParkaResizableOnScrollAppBar(
                title: "Historial de Reservaciones",
              ),
              SliverList(
                delegate: SliverChildListDelegate([
                  !this._loading && this.currentReservations.length != 0
                      ? Column(
                          children: reservationListBuilder(),
                        )
                      : ReservationPlaceholder()
                ]),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
