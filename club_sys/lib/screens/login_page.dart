import 'package:club_sys/screens/sign_up_page.dart';
import 'package:flutter/material.dart';
import 'package:passwordfield/passwordfield.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

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
                    child: const TextField(
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        hintText: "Student Id",
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
                    child: PasswordField(
                      backgroundColor: Colors.blue.withOpacity(0.2),
                      hintText: 'Default password constraint ',
                      passwordDecoration: PasswordDecoration(
                        inputPadding:
                            const EdgeInsets.symmetric(horizontal: 20),
                      ),
                      border: PasswordBorder(
                        border: OutlineInputBorder(
                            borderSide:
                                const BorderSide(width: 0, color: Colors.grey),
                            borderRadius: BorderRadius.circular(25.7)),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 0, color: Colors.grey),
                          borderRadius: BorderRadius.circular(25.7),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 0, color: Colors.grey),
                          borderRadius: BorderRadius.circular(25.7),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {},
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
                        ),
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
