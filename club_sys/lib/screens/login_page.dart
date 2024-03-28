import 'package:club_sys/screens/home_page.dart';
import 'package:club_sys/screens/sign_up_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late dynamic emailAddress;
  late dynamic password;
  bool _obscureText = true;

  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  String? message;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    final InputBorder? disabledBorder;
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
          width: double.infinity,
          height: 990,
          decoration: const BoxDecoration(
            color: Color(0xFF242C3B),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  margin: const EdgeInsets.only(top: 80),
                  width: 250,
                  child: Image.asset(
                    'lib/images/clubSys_dik_logo_beyaz.png',
                  )),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Log In",
                    style: TextStyle(
                        color: Color(0xff37b5e9),
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Container(
                    width: 330,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.7),
                      color: Colors.blue.withOpacity(0.2),
                      border: Border.all(
                        color: Colors.grey,
                        width: 1,
                      ),
                    ),
                    child: TextField(
                      controller: emailController,
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        hintText: "Student E-mail",
                        hintStyle: TextStyle(color: Colors.grey),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: TextField(
                      obscureText: _obscureText,
                      controller: passwordController,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: 'Password',
                        hintStyle: TextStyle(color: Colors.grey),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscureText
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.grey,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                  if (message != null)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        message!,
                        style: TextStyle(
                          color: message!.startsWith('Error')
                              ? Colors.red
                              : Colors.green,
                        ),
                      ),
                    ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      password = passwordController.text;
                      emailAddress = emailController.text;
                      try {
                        final UserCredential userCredential = await FirebaseAuth
                            .instance
                            .signInWithEmailAndPassword(
                          email: emailAddress,
                          password: password,
                        );

                        setState(() {
                          message = 'Login successful!';
                        });
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const HomePage(),
                          ),
                        );
                        // If login is successful, you can navigate to the next screen or perform any other actions.
                      } on FirebaseAuthException catch (e) {
                        setState(() {
                          if (e.code == 'user-not-found') {
                            message = 'No user found for that email.';
                          } else if (e.code == 'wrong-password') {
                            message = 'Wrong password provided for that user.';
                          } else {
                            message = 'Error: ${e.message}';
                          }
                        });
                      } catch (e) {
                        print('Error: $e');
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff37b5e9),
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(70.0),
                          side: BorderSide(
                            color: Colors.white.withOpacity(0.6),
                          ) // Adjust the value for the curve
                          ),
                    ),
                    child: const Text('Confirm'),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const SignUpPage(),
                          ),
                        );
                      },
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(
                            color: Colors.white,
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.white),
                      )),
                  const SizedBox(
                    height: 60,
                  ),
                  Container(
                    width: screenWidth,
                    height: 265,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: const Color(0xFF474E68),
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(30),
                            topLeft: Radius.circular(30)),
                        border: Border.all(
                            color: const Color(0xFF474E68), width: 3)),
                    child: const Column(children: [
                      Text(
                        "Welcome to",
                        style: TextStyle(
                            fontSize: 45,
                            color: Color(0xffffffff),
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "the club",
                        style: TextStyle(
                            fontSize: 45,
                            color: Color(0xff37b5e9),
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "universe!",
                        style: TextStyle(
                            fontSize: 45,
                            color: Color(0xff37b5e9),
                            fontWeight: FontWeight.w600),
                      ),
                    ]),
                  )
                ],
              )
            ],
          )),
    ));
  }
}
