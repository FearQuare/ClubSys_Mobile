import 'package:club_sys/screens/login_page.dart';
import 'package:flutter/material.dart';
import 'package:passwordfield/passwordfield.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        height: screenHeight,
        width: screenWidth,
        decoration: const BoxDecoration(
          color: Color(0xFF242C3B),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 60),
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: screenWidth * 0.06,
                      ),
                      const Center(
                        child: BackButton(
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Image.asset(
              "lib/images/clubSys_dik_logo_beyaz.png",
              width: 200,
              height: 170,
            ),
            Column(
              children: [
                const Text(
                  "Sign Up",
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: 330,
                  height: 40,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 5,
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
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 160,
                      height: 40,
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
                          hintText: "First Name",
                          hintStyle: TextStyle(color: Colors.grey),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: 160,
                      height: 40,
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
                          hintText: "Surname",
                          hintStyle: TextStyle(color: Colors.grey),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                  child: PasswordField(
                    backgroundColor: Colors.blue.withOpacity(0.2),
                    hintText: 'Passsword ',
                    passwordDecoration: PasswordDecoration(
                      inputPadding: const EdgeInsets.symmetric(horizontal: 20),
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: PasswordField(
                    backgroundColor: Colors.blue.withOpacity(0.2),
                    hintText: 'Password Again',
                    passwordDecoration: PasswordDecoration(
                      inputPadding: const EdgeInsets.symmetric(horizontal: 20),
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
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const LoginPage(),
                      ),
                    );
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
                  child: const Text('Sign Up'),
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            Container(
              width: screenWidth,
              height: screenHeight * 0.28,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: const Color(0xFF474E68),
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(30),
                      topLeft: Radius.circular(30)),
                  border: Border.all(color: const Color(0xFF474E68), width: 3)),
              child: const Column(children: [
                Text(
                  "Are you ready",
                  style: TextStyle(
                      fontSize: 45,
                      color: Color(0xffffffff),
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  "for the club",
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
        ),
      ),
    );
  }
}
