import 'package:chatapp_firebase/functions/helper_function.dart';
import 'package:chatapp_firebase/pages/auth/sign_in_page.dart';
import 'package:chatapp_firebase/service/auth_service.dart';
import 'package:chatapp_firebase/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../home_page.dart';
import '../settings/decorations/spacer.dart';
import '../settings/decorations/text_field_decorations.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String fullName = "";
  String email = "";
  dynamic password = "";
  AuthService authService = AuthService();

  final formKey = GlobalKey<FormState>();

  final bool _isLoading = false;

  final TextEditingController userNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(
                color: Colors.blue,
              ),
            )
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: kDeffaultSpacer - 40.0,
                      ),
                      Center(
                        child: Text(
                          'Hello new user!',
                          style: GoogleFonts.montserrat(
                              fontSize: 35, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(
                        height: kDeffaultSpacer / 20,
                      ),
                      Text(
                        'Create a new account to chat with other users!',
                        style: GoogleFonts.montserrat(
                            fontSize: 14, color: Colors.grey),
                      ),
                      const SizedBox(
                        height: kDeffaultSpacer / 4,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 10.0, left: 20, right: 20),
                        child: Image.asset('assets/sign_up_image.jpg'),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 20,
                          left: 15,
                          right: 15,
                        ),
                        child: TextFormField(
                          validator: (val) {
                            if (val!.isNotEmpty) {
                              return null;
                            } else {
                              return "This field is cannot be empty!";
                            }
                          },
                          onChanged: (val) => setState(
                            () {
                              fullName = val;
                            },
                          ),
                          controller: userNameController,
                          decoration: kUsersNewNameDecoration,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 20.0, left: 15, right: 15, bottom: 20),
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
                            registerUser();
                          },
                          child: const Text('Register'),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 5.0, right: 5.0, bottom: 50),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Already have an account?'),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        const SignInPage(),
                                  ),
                                );
                              },
                              child: const Text('Sign in!'),
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

  registerUser() async {
    if (formKey.currentState!.validate()) {
      setState(
        () {
          userNameController.clear();
          emailController.clear();
          passwordController.clear();
          _isLoading == true;
        },
      );
      await authService
          .registerUserWithEmailandPassword(fullName, email, password)
          .then(
        (value) async {
          if (value == true) {
            await HelperFunctions.saveUserEmailSF(email);
            await HelperFunctions.saveUserNameSF(fullName);
            await HelperFunctions.saveUserLoggedInStatus(true);

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
