import 'package:flutter/material.dart';

class PendingReservationsPage extends StatelessWidget {
  static String routeName = "pending-reservations-page";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text("Pending reservations"),
        ),
      ),
    );
  }
}
