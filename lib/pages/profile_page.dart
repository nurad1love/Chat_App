import 'package:chatapp_firebase/service/auth_service.dart';
import 'package:chatapp_firebase/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import '../functions/show_dialog_func.dart';
import '../widgets/confirm_alert_dialog.dart';
import '../widgets/tiles/list_tiles.dart';
import '../widgets/widgets.dart';
import 'home_page.dart';
import 'settings/decorations/font_decoration.dart';

// ignore: must_be_immutable
class ProfilePage extends StatefulWidget {
  String userName;
  String userEmail;

  ProfilePage({super.key, required this.userEmail, required this.userName});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  AuthService authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: Colors.blue[900],
        title: Text(
          'Profile',
          style: kGoogleFontsMontserratWithBoldAndSize20,
        ),
        actions: const [],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const Icon(
              Icons.account_circle,
              size: 150,
              color: Colors.black54,
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 15.0,
                bottom: 25,
              ),
              child: Text(
                widget.userName,
                textAlign: TextAlign.center,
                style: kGoogleFontsMontserratWithBoldAndSize20,
              ),
            ),
            const Divider(
              height: 2,
            ),
            CustomListTile(
              onTap: () {
                nextScreen(
                  context,
                  const HomePage(),
                );
              },
              leading: const Icon(
                Icons.people,
                color: Colors.orangeAccent,
              ),
              title: Text(
                'Groups',
                style: kGoogleFontsMontserratWithoutBoldWithSize16,
              ),
            ),
            ListTile(
              selectedTileColor: Colors.grey.withOpacity(0.3),
              selectedColor: Colors.blue[900],
              selected: true,
              onTap: () {},
              leading: const Icon(
                Icons.person,
                color: Color(0xFF0D47A1),
              ),
              title: Text(
                'Profile',
                style: kGoogleFontsMontserratWithoutBoldWithSize16,
              ),
            ),
            CustomListTile(
              onTap: () async {
                showCheckDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: ((context) => const CheckAlertDialog()),
                    authService: authService);
              },
              leading: const Icon(
                Icons.logout_outlined,
                color: Colors.redAccent,
              ),
              title: Text(
                'Log out',
                style: kGoogleFontsMontserratWithoutBoldWithSize16,
              ),
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(25.0),
              child: Icon(
                Icons.account_circle,
                size: 150,
                color: Colors.black54,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black45),
                  borderRadius: BorderRadius.circular(10)),
              width: MediaQuery.of(context).size.width,
              height: 100,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Full name:',
                          style: kGoogleFontsKanitWithBoldWithSize18),
                      Text(widget.userName,
                          style: kGoogleFontsKanitWithoutBoldWithSize18),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                    child: Divider(
                      height: 2,
                      color: Colors.black,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Email:',
                        style: kGoogleFontsKanitWithBoldWithSize18,
                      ),
                      Text(
                        widget.userEmail,
                        style: kGoogleFontsKanitWithoutBoldWithSize18,
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
