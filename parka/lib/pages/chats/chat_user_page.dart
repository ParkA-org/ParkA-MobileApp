import 'package:ParkA/components/headers/parka_header.dart';
import 'package:ParkA/data/data-models/chat/chat_data_model.dart';
import 'package:ParkA/data/data-models/message/message_data_model.dart';
import 'package:ParkA/pages/edit-payment/components/parka_input_test.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'components/user_chat_tile.dart';

class ChatUserPage extends StatefulWidget {
  static const String routeName = "/chat-user-page";
  final String chat;
  ChatUserPage({this.chat});

  @override
  ___ChatUserPageState createState() => ___ChatUserPageState();
}

class ___ChatUserPageState extends State<ChatUserPage> {
  bool _loading;
  String _chat;
  List<Message> userMessages = [];

  Future<void> getAllMessages() async {
    // this.userMessages = await VehicleUseCases.getAllUserVehicles();

    setState(() {
      this._loading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    this._chat = this.widget.chat;
    this._loading = true;
    this.getAllMessages();
  }

  List<Widget> messagesListBuilder() {
    List<Widget> ret = new List();

    // this.userChats.forEach((element) {
    ret.add(ChatTile(
      chat: new Chat(),
      onTapHandler: () {
        // Get.to();
      },
    ));

    return ret;
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: Container(
        color: Colors.transparent,
        height: screenSize.height * 0.09,
        width: screenSize.width * 1,
        alignment: Alignment.bottomLeft,
        child: Padding(
          padding: const EdgeInsets.only(left: 32.0, bottom: 20.0),
          child: Row(
            children: [
              Text("Prueba"),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 9.0),
                child: InkWell(
                  child: SvgPicture.asset(
                    "resources/images/SendButtom.svg",
                    width: 45,
                  ),
                  onTap: () {},
                ),
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: ModalProgressHUD(
          inAsyncCall: this._loading,
          opacity: 0.5,
          child: RefreshIndicator(
            onRefresh: this.getAllMessages,
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  pinned: true,
                  expandedHeight: 325,
                  centerTitle: false,
                  leading: Padding(
                    padding: const EdgeInsets.only(left: 19.0),
                    child: ParkaHeader(
                      color: Colors.white,
                      leading: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.arrow_back_ios,
                          size: 35,
                        ),
                      ),
                    ),
                  ),
                  bottom: PreferredSize(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20.0),
                          child: Container(
                            child: CircleAvatar(
                              radius: 75.0,
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
                                  color: Colors.transparent.withOpacity(0.3),
                                  spreadRadius: 0,
                                  blurRadius: 7,
                                  offset: Offset(
                                      0, 20), // changes position of shadow
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 40.0),
                          child: AutoSizeText(
                            "Francisco Tarjetero",
                            maxFontSize: 40,
                            maxLines: 1,
                            minFontSize: 36,
                            style: TextStyle(
                              fontFamily: "Montserrat",
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    preferredSize: Size.fromHeight(100),
                  ),
                  backgroundColor: Color(0xff0B768C),
                  shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.vertical(bottom: Radius.circular(20))),
                ),
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      Column(
                        children: messagesListBuilder(),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
