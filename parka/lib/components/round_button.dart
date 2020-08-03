import "package:flutter/material.dart";

class RoundedButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;

  const RoundedButton({Key key, this.color, this.icon, this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("tapped");
      },
      child: Container(
        height: 40.0,
        width: 300.0,
        decoration: BoxDecoration(
            color: this.color,
            borderRadius: BorderRadius.all(Radius.circular(50.0))),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Row(
            children: <Widget>[
              Icon(
                this.icon,
                size: 16.0,
                color: Colors.white,
              ),
              SizedBox(
                width: 15.0,
              ),
              Text(
                this.label,
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: "Montserrat",
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
    );
  }
}
