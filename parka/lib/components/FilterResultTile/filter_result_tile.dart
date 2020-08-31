import 'package:flutter/material.dart';

class FilterResultTile extends StatelessWidget {
  const FilterResultTile({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 30.0,
        horizontal: 30.0,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: Color(0xFFE9E9E9),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.local_parking,
                color: Color(0xFF0B768C),
                size: 40.0,
              ),
            ),
          ),
          Expanded(
            flex: 7,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Calle Puerto Rico #175',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      color: Color(0xFF0B768C),
                      fontSize: 20.0,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 14.0, bottom: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Silvio Arzeno',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            color: Color(0xFF69858B),
                            fontSize: 17.0,
                          ),
                        ),
                        Text(
                          '10 metros',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            color: Color(0xFF69858B),
                            fontSize: 17.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    color: Color(0xFF0B768C),
                    thickness: 2,
                    endIndent: 0,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
