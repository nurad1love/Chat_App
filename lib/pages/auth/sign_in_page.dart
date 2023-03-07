import 'package:chatapp_firebase/functions/helper_function.dart';
import 'package:chatapp_firebase/service/auth_service.dart';
import 'package:chatapp_firebase/service/database_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../widgets/widgets.dart';
import '../home_page.dart';
import '../settings/decorations/spacer.dart';
import '../settings/decorations/text_field_decorations.dart';
import 'sign_up_page.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final formKey = GlobalKey<FormState>();

  String email = "";
  dynamic password = "";
  final bool _isLoading = false;
  AuthService authService = AuthService();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoading == true
          ? const Center(
              child: SizedBox(
                width: 100,
                height: 100,
                child: CircularProgressIndicator(
                  color: Colors.blue,
                ),
              ),
            )
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      // ignore: prefer_const_constructors
                      SizedBox(
                        height: kDeffaultSpacer + 30,
                      ),
                      Center(
                        child: Text(
                          'Welcome back!',
                          style: GoogleFonts.montserrat(
                              fontSize: 35, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(
                        height: kDeffaultSpacer / 20,
                      ),
                      Text(
                        'We are glad to see you again!',
                        style: GoogleFonts.montserrat(
                            fontSize: 16, color: Colors.grey),
                      ),
                      const SizedBox(
                        height: kDeffaultSpacer / 4,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Image.asset('assets/sign_in_image.png'),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 10.0, left: 15, right: 15, bottom: 20),
                        child: TextFormField(
                          validator: (val) {
                            return RegExp(
                                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                    .hasMatch(val!)
                                ? null
                                : "Please enter a valid email";
                          },
                          onChanged: (val) => setState(
                            () {
                              email = val;
                            },
                          ),
                          controller: emailController,
                          decoration: kEmailDecoration,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 15.0, right: 15, bottom: 20),
                        child: TextFormField(
                          validator: (val) {
                            if (val!.length < 6) {
                              return "Password must be at least 6 characters!";
                            } else {
                              return null;
                            }
                          },
                          onChanged: (val) => setState(
                            () {
                              password = val;
                            },
                          ),
                          obscureText: true,
                          controller: passwordController,
                          decoration: kPasswordDecoration,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 20),
                        width: 340,
                        height: 50,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateColor.resolveWith(
                              (states) => const Color(0xFF1565C0),
                            ),
                          ),
                          onPressed: () {
                            logInFunction();
                          },
                          child: const Text('Sign In'),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 5.0, right: 5.0, bottom: 50),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Don\'t have an account?'),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        const SignUpPage(),
                                  ),
                                );
                              },
                              child: const Text('Register now!'),
                            ),
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

  logInFunction() async {
    if (formKey.currentState!.validate()) {
      setState(
        () {
          _isLoading == true;
        },
      );
      await authService.loginWithUserNameandPassword(email, password).then(
        (value) async {
          if (value == true) {
            QuerySnapshot snapshot = await DatabaseService(
                    uid: FirebaseAuth.instance.currentUser!.uid)
                .gettingUserData(email);

            await HelperFunctions.saveUserLoggedInStatus(true);
            await HelperFunctions.saveUserEmailSF(email);
            await HelperFunctions.saveUserNameSF(snapshot.docs[0]["fullName"]);

            // ignore: use_build_context_synchronously
            nextScreen(context, const HomePage());
            setState(() {
              showSnackbar(context, Colors.green, value);
            });
          } else {
            setState(
              () {
                _isLoading == false;
                showSnackbar(
                  context,
                  Colors.red,
                  value,
                );
              },
            );
          }
        },
      );
    }
  }
}
