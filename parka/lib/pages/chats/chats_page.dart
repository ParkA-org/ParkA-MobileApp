import 'package:ParkA/components/headers/parka_header.dart';
import 'package:ParkA/components/search-bar/search_bar.dart';
import 'package:ParkA/data/data-models/chat/chat_data_model.dart';
import 'package:ParkA/pages/create-vehicle/components/parka_resizable_on_scroll_app_bar.dart';
import 'package:ParkA/pages/search/components/search_section.dart';
import 'package:ParkA/pages/vehicle-detail/vehicle_detail_page.dart';
import 'package:ParkA/styles/parka_colors.dart';
import 'package:ParkA/styles/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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

    this.userChats.forEach((element) {
      ret.add(ChatTile(
        chat: element,
        onTapHandler: () {
          Get.to(
            VehicleDetailPage(
              vehicleId: element.id,
            ),
          );
        },
      ));
    });

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
                  title: Text(
                    "Chats",
                    style: TextStyle(
                        fontFamily: "Montserrat",
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  expandedHeight: 200,
                  actions: [
                    SearchBar(enabled: true,),
                  ],
                  backgroundColor: Color(0xff0B768C),
                ),
                // Column(
                //   children: <Widget>[
                //     // ParkaHeader(
                //     //   color: Colors.white,
                //     //   leading: GestureDetector(
                //     //     onTap: () {
                //     //       Navigator.pop(context);
                //     //     },
                //     //     child: Icon(
                //     //       Icons.arrow_back_ios,
                //     //     ),
                //     //   ),
                //     //   trailing: Icon(
                //     //     Icons.arrow_back_ios,
                //     //     color: Colors.transparent,
                //     //   ),
                //     // ),
                //     // SearchBar(),
                //     Text('Prueba'),
                //   ],
                // ),
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      !this._loading && this.userChats.length != 0
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
