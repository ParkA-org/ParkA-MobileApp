import 'package:ParkA/components/headers/parka_header.dart';
import 'package:ParkA/components/user/other_user_personal_information_widget.dart';
import 'package:ParkA/data/data-models/review/review_data_model.dart';
import 'package:ParkA/data/data-models/user/user_data_model.dart';
import 'package:ParkA/data/use-cases/user/user_use_cases.dart';
import 'package:ParkA/pages/profile/components/parka_review_history_tile.dart';
import 'package:ParkA/styles/parka_colors.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class ProfileScreen extends StatefulWidget {
  static String routeName = "/profileScreen";
  final String userId;

  ProfileScreen({
    @required this.userId,
  });

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int infoScreenPage = 1;
  String _userId;
  bool _loading = true;
  User _user;

  @override
  void initState() {
    super.initState();
    this._userId = this.widget.userId;
    this._getPageData();
  }

  void _getPageData() async {
    this._user = await UserUseCases.getOtherUser(this._userId);

    setState(() {
      this._loading = false;
    });
  }

  List<Widget> _reviewListView() {
    List<Widget> ret = new List();

    this._user.reviews.forEach((Review element) {
      ret.add(
        ParkaReviewHistoryTile(
          review: element,
        ),
      );
    });

    return ret;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ParkaColors.parkaGreen,
      body: SafeArea(
        child: ModalProgressHUD(
          inAsyncCall: this._loading,
          child: this._loading
              ? Container()
              : Column(
                  children: [
                    Expanded(
                      flex: 0,
                      child: ParkaHeader(
                        color: Colors.white,
                      ),
                    ),
                    Expanded(
                      flex: 0,
                      child: Container(
                        height: 100.0,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16.0,
                          vertical: 8.0,
                        ),
                        child: OtherUserProfilePersonalInformationWidget(
                          user: this._user,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                          padding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(25.0),
                            ),
                          ),
                          child: ListView(
                            children: _reviewListView(),
                          )),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
