import 'package:ParkA/data/data-models/chat/chat_data_model.dart';
import 'package:ParkA/pages/create-vehicle/components/parka_resizable_on_scroll_app_bar.dart';
import 'package:ParkA/pages/vehicle-detail/vehicle_detail_page.dart';
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
                ParkaResizableOnScrollAppBar(
                  title: "Tus Vehiculos",
                ),
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
