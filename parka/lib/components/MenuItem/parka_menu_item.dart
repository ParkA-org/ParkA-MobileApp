import 'package:ParkA/components/Utils/styles/text.dart';
import 'package:flutter/material.dart';

class ParkAMenuItem extends StatelessWidget {
  /// Creates a Menu item for drawers and other tab like features `ParkAMenuItem`
  ///
  /// The `label` is a string that represents what is going to be shown as the item. This Field is required.
  ///
  /// The `navigateTo` is a a String that represents the Route of the page to navigate to when the item is tapped
  /// This string has to be the same as an existing route on the routes.dart file and if null will do nothing.
  ///
  /// The `itemStyle` field is optional and will override the default kParkaInputDefaultSyle of the item.
  ///
  /// Make sure you are entering a page's route name correctly before using this widget.

  final String navigateTo;

  final String label;

  final TextStyle itemStyle;

  const ParkAMenuItem(
      {Key key, this.navigateTo, @required this.label, this.itemStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Container(
          alignment: Alignment.centerLeft,
          child: Text(
            "$label",
            style: itemStyle ?? kParkaInputDefaultSyle,
            textAlign: TextAlign.start,
          ),
        ),
        onTap: () {
          if (navigateTo == null || navigateTo.isEmpty) {
            return;
          }
          Navigator.pushNamed(context, navigateTo);
        });
  }
}
