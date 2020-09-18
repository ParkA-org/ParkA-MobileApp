import 'package:flutter/material.dart';

class FavoritePlaceButton extends StatelessWidget {
  const FavoritePlaceButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 40.0,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(offset: Offset(5.0, 5.0), color: Colors.black54),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: Color(0xFFE9E9E9),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.star,
                  color: Color(0xFF0B768C),
                  size: 40.0,
                ),
              ),
            ),
            Expanded(
                flex: 5,
                child: Text(
                  'Lugares Favoritos',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    color: Color(0xFF077187),
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
                )),
            Expanded(
              child: Icon(
                Icons.navigate_next,
                color: Color(0xFF077187),
                size: 60,
              ),
            )
          ],
        ),
      ),
    );
  }
}
