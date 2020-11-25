import 'package:ParkA/components/headers/parka_header.dart';
import 'package:ParkA/components/search-bar/search_bar.dart';
import 'package:ParkA/data/data-models/chat/chat_data_model.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'components/user_chat_placeholder.dart';
import 'components/user_chat_tile.dart';

class ChatsPage extends StatefulWidget {
  static const String routeName = "/chats-page";

  @override
  ___ChatsPageState createState() => ___ChatsPageState();
}

class ___ChatsPageState extends State<ChatsPage> {
  bool _loading;
  List<Chat> userChats = [];

  Future<void> getAllUserChats() async {
    // this.userChats = await VehicleUseCases.getAllUserVehicles();

    setState(() {
      this._loading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    this._loading = true;
    this.getAllUserChats();
  }

  List<Widget> chatListBuilder() {
    List<Widget> ret = new List();

    // this.userChats.forEach((element) {
    ret.add(ChatTile(
      chat: new Chat(),
      onTapHandler: () {
        // Get.to();
      },
    ));
    ret.add(ChatTile(
      chat: new Chat(),
      onTapHandler: () {
        // Get.to();
      },
    ));
    ret.add(ChatTile(
      chat: new Chat(),
      onTapHandler: () {
        // Get.to();
      },
    ));
    ret.add(ChatTile(
      chat: new Chat(),
      onTapHandler: () {
        // Get.to();
      },
    ));
    ret.add(ChatTile(
      chat: new Chat(),
      onTapHandler: () {
        // Get.to();
      },
    ));
    ret.add(ChatTile(
      chat: new Chat(),
      onTapHandler: () {
        // Get.to();
      },
    ));
    // });

    return ret;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ModalProgressHUD(
          inAsyncCall: this._loading,
          opacity: 0.5,
          child: RefreshIndicator(
            onRefresh: this.getAllUserChats,
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  pinned: true,
                  expandedHeight: 182,
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
                          padding: const EdgeInsets.only(left: 18.0),
                          child: AutoSizeText(
                            "Chats",
                            maxLines: 1,
                            maxFontSize: 36,
                            minFontSize: 34,
                            style: TextStyle(
                              fontFamily: "Montserrat",
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 8.0),
                          child: SearchBar(),
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
                      !this._loading && this.userChats.length != 1
                          ? Column(
                              children: chatListBuilder(),
                            )
                          : ChatListPlaceHolder()
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
