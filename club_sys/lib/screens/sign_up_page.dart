import 'package:club_sys/screens/login_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';




class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  late dynamic emailAddress;
  late dynamic firstName;
  late dynamic lastName;
  late dynamic password;
  late dynamic password1;
  late dynamic password2;
  bool _obscureText = true;
  bool _obscureText2 = true;
  bool errorCheck = true;
  String errorMessage = "";
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController password1Controller = TextEditingController();
  TextEditingController password2Controller = TextEditingController();
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
                  height: 25,
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
                  child: TextField(
                    textAlign: TextAlign.center,
                    controller: emailController,
                    decoration: InputDecoration(
                      hintText: "E-mail",
                      hintStyle: TextStyle(color: Colors.grey),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
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
                      child: TextField(
                        textAlign: TextAlign.center,
                        controller: firstNameController,
                        decoration: const InputDecoration(
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
                      child: TextField(
                        textAlign: TextAlign.center,
                        controller: lastNameController,
                        decoration: const InputDecoration(
                          hintText: "Surname",
                          hintStyle: TextStyle(color: Colors.grey),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: TextField(
                    onTap: () {
                      setState(() {
                        errorCheck = true;
                      });
                    },
                    obscureText: _obscureText,
                    controller: password1Controller,
                    decoration: InputDecoration(
                      hintText: 'Password',
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
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: TextField(
                    obscureText: _obscureText2,
                    controller: password2Controller,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscureText2
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.grey,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscureText2 = !_obscureText2;
                          });
                        },
                      ),
                    ),
                  ),
                ),
                errorCheck
                    ? const SizedBox(
                        height: 20,
                      )
                    : Padding(
                        padding: const EdgeInsets.only(top: 1),
                        child: Text(
                          errorMessage,
                          style: const TextStyle(color: Colors.red),
                        ),
                      ),
                ElevatedButton(
                  onPressed: () async {
                    emailAddress = emailController.text;
                    password1 = password1Controller.text;
                    password2 = password2Controller.text;
                    firstName = firstNameController.text;
                    lastName = lastNameController.text;
                    print(password1Controller.text);
                    print(password2Controller.text);
                    if (emailController.text.isEmpty &&
                        password1Controller.text.isEmpty &&
                        password2Controller.text.isEmpty &&
                        firstNameController.text.isEmpty &&
                        lastNameController.text.isEmpty) {
                      errorMessage = "There are empty boxes !!!";
                      setState(() {
                        errorCheck = false;
                      });
                    } else if (password1Controller.text !=
                        password2Controller.text) {
                      errorMessage = "Passwords are not match";
                      setState(() {
                        errorCheck = false;
                      });
                    } else {
                      emailAddress = emailController.text;
                      password = password1Controller.text;

                      try {
                        UserCredential userCredential = await FirebaseAuth
                            .instance
                            .createUserWithEmailAndPassword(
                          email: emailAddress,
                          password: password,
                          
                    
                        );
                        /*
                        print(FirebaseFirestore.instance.collection("Students".length.toString()));
                        await FirebaseFirestore.instance
                            .collection('Students')
                            .doc(userCredential.user!.uid)
                            .set({
                          'email': emailAddress,
                          'password': password,
                          'firstName': firstName,
                          'lastName': lastName,
                          // Add other fields as needed
                        });
                        */
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => LoginPage(),
                          ),
                        );
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'weak-password') {
                          errorMessage = 'The password provided is too weak.';
                          setState(() {
                            errorCheck = false;
                          });
                        } else if (e.code == 'email-already-in-use') {
                          errorMessage =
                              'The account already exists for that email.';
                          setState(() {
                            errorCheck = false;
                          });
                        } else {
                          errorMessage = 'Error: ${e.message}';
                          setState(() {
                            errorCheck = false;
                          });
                        }
                      } catch (e) {
                        print('ERROR: $e');
                      }
                    }
                    // Navigator.of(context).push(
                    // MaterialPageRoute(
                    // builder: (context) => LoginPage(),
                    //),
                    //);
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

