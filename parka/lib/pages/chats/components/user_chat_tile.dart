import 'package:ParkA/data/data-models/chat/chat_data_model.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class ChatTile extends StatelessWidget {
  final Chat chat;
  final Function onTapHandler;

  const ChatTile({
    Key key,
    this.chat,
    this.onTapHandler,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 8.0, top: 14.0),
      child: GestureDetector(
        onTap: this.onTapHandler,
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Row(
                  children: [
                    Container(
                      child: CircleAvatar(
                        radius: 45.0,
                        backgroundImage: NetworkImage(
                          'https://parka-api-bucket-aws.s3.amazonaws.com/pp_857565fdc3.jfif',
                        ),
                        backgroundColor: Colors.transparent,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.8),
                            spreadRadius: 0,
                            blurRadius: 7,
                            offset: Offset(0, 20), // changes position of shadow
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 14.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AutoSizeText(
                            "Francisco Tarjetero",
                            maxLines: 1,
                            maxFontSize: 30,
                            minFontSize: 25,
                            style: TextStyle(
                              color: Color(0xFF077187),
                              fontFamily: "Montserrat",
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: AutoSizeText(
                              "Pagame Mmgvaso ....",
                              maxLines: 1,
                              maxFontSize: 20,
                              minFontSize: 18,
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: "Montserrat",
                              ),
                            ),
                          ),
                          AutoSizeText(
                            "2020-11-10 03:44",
                            maxLines: 1,
                            maxFontSize: 19,
                            minFontSize: 17,
                            style: TextStyle(
                              color: Colors.black54,
                              fontFamily: "Montserrat",
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0, left: 100, right: 20),
                child: Divider(
                  color: Color(0xFFA9A5A5),
                  thickness: 1.6,
                  endIndent: 0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
