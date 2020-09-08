import 'package:ParkA/components/SearchBar/search_bar.dart';
import 'package:flutter/material.dart';

class SearchSection extends StatelessWidget {
  const SearchSection({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0, bottom: 17.0),
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Icon(
                      Icons.arrow_forward_ios,
                      size: 35.0,
                      textDirection: TextDirection.rtl,
                      color: Colors.white,
                    ),
                  ),
                  Expanded(
                    flex: 10,
                    child: Text(
                      'Buscar Parqueo',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Colors.white,
                        fontSize: 29.0,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Expanded(
                    child: Container(),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: SearchBar(),
                  ),
                  Flexible(
                    fit: FlexFit.loose,
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(5.0, 5.0),
                            color: Colors.black54,
                          ),
                        ],
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: ClipOval(
                        child: Material(
                          color: Colors.white, // button color
                          child: InkWell(
                            splashColor: Colors.red, // inkwell color
                            child: SizedBox(
                              width: 56,
                              height: 56,
                              child: Icon(
                                Icons.filter_list,
                                size: 35,
                                color: Color(0xFF0B768C),
                              ),
                            ),
                            onTap: () {},
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      decoration: BoxDecoration(
        color: Color(0xFF0B768C),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(15.0),
          bottomRight: Radius.circular(15.0),
        ),
      ),
    );
  }
}
