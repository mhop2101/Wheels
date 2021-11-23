import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wheels/model/user.dart';
import 'package:wheels/Profile/edit_profile_page.dart';
import 'package:wheels/utils/user_preferences_other.dart';
import 'package:wheels/widget/appbar_widget.dart';
import 'package:wheels/widget/button_widget.dart';
import 'package:wheels/widget/numbers_widget_other.dart';
import 'package:wheels/widget/profile_widget_other.dart';
import 'package:wheels/comments/commentrs.dart';

var texto = 'Contratar Wheeler';

class ProfileOther extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<ProfileOther> {
  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.myUser;

    return ThemeSwitchingArea(
      child: Builder(
        builder: (context) => Scaffold(
          appBar: buildAppBar(context),
          body: ListView(
            physics: BouncingScrollPhysics(),
            children: [
              const SizedBox(height: 24),
              ProfileWidget(
                imagePath: user.imagePath,
                onClicked: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => EditProfilePage()),
                  );
                },
              ),
              const SizedBox(height: 24),
              buildName(user),
              const SizedBox(height: 24),
              Center(child: buildpgradeButton()),
              const SizedBox(height: 24),
              NumbersWidget(),
              const SizedBox(height: 48),
              buildAbout(user),
              const SizedBox(height: 24),
              Center(child: buildCommentButton()),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildName(User user) => Column(
        children: [
          Text(
            user.name,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          const SizedBox(height: 4),
          Text(
            user.email,
            style: TextStyle(color: Colors.grey),
          )
        ],
      );

  Widget buildpgradeButton() => ButtonWidget(
      text: texto,
      onClicked: () {
        texto = "Wheeler contratado exitosamente";
        setState(() {});
      });

  Widget buildCommentButton() => ButtonWidget(
      text: "Ver comentarios",
      onClicked: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => TestMe()),
        );
      });

  Widget buildAbout(User user) => Container(
        padding: EdgeInsets.symmetric(horizontal: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'About',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              user.about,
              style: TextStyle(fontSize: 16, height: 1.4),
            ),
          ],
        ),
      );
}
