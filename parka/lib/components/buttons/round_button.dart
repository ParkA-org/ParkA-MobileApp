import 'package:auto_size_text/auto_size_text.dart';
import "package:flutter/material.dart";

class RoundedButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final Function onTapHandler;
  final double width;
  final bool hasIcon;
  final bool isSelected;
  final bool hasShadow;

  const RoundedButton(
      {this.color,
      this.icon,
      this.label,
      this.onTapHandler,
      this.width,
      this.isSelected = true,
      @required this.hasShadow,
      @required this.hasIcon});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onTapHandler,
      child: Container(
        height: 40.0,
        width: this.width ?? 300.0,
        decoration: BoxDecoration(
          color: this.isSelected ? this.color : Colors.white,
          border: Border.all(color: this.color),
          borderRadius: BorderRadius.all(
            Radius.circular(50.0),
          ),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 10.0),
              color: this.hasShadow ? Colors.black26 : Colors.transparent,
              blurRadius: 5.0,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Row(
            children: <Widget>[
              Icon(
                this.icon,
                size: this.hasIcon ? 16.0 : 0,
                color: Colors.white,
              ),
              SizedBox(
                width: this.hasIcon ? 15.0 : 0,
              ),
              Expanded(
                child: AutoSizeText(
                  this.label,
                  maxLines: 1,
                  textAlign: this.hasIcon ? TextAlign.start : TextAlign.center,
                  style: TextStyle(
                      color: this.isSelected ? Colors.white : this.color,
                      fontFamily: "Montserrat",
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
