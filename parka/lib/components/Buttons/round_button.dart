import "package:flutter/material.dart";

class RoundedButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final Function onTapHandler;
  final double width;
  final bool hasIcon;

  const RoundedButton(
      {this.color,
      this.icon,
      this.label,
      this.onTapHandler,
      this.width,
      @required this.hasIcon});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onTapHandler,
      child: Container(
        height: 40.0,
        width: this.width ?? 300.0,
        decoration: BoxDecoration(
          color: this.color,
          borderRadius: BorderRadius.all(
            Radius.circular(50.0),
          ),
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
                child: Text(
                  this.label,
                  textAlign: this.hasIcon ? TextAlign.start : TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
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
