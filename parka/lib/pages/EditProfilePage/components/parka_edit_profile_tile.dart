import 'package:flutter/material.dart';

class ParkaEditProfileTile extends StatelessWidget {
  final Color color;
  final String label;
  final IconData iconData;
  final Function onTapHandler;

  ParkaEditProfileTile({
    Key key,
    @required this.color,
    @required this.label,
    @required this.iconData,
    this.onTapHandler,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onTapHandler,
      child: Container(
        child: Row(
          children: [
            Expanded(
              child: Icon(
                this.iconData,
                color: this.color ?? Colors.black,
              ),
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  this.label,
                  style: TextStyle(
                    fontFamily: "Montserrat",
                    fontSize: 20.0,
                    color: this.color ?? Colors.black,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
