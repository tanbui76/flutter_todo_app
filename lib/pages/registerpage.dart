// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../compoments/textfield_component.dart';
import '../models/account_models.dart';
import 'loginpage.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _repeatpasswordController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("asset/background_login.jpg"),
                  fit: BoxFit.cover)),
        ),
        Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(color: Colors.black.withOpacity(0.5)),
        ),
        Center(
          child: SingleChildScrollView(
            child: Column(children: [
              const Padding(
                padding: EdgeInsets.only(left: 30, bottom: 18, top: 18),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Register \nnew Account",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontFamily: 'TanDien',
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              CustomTextField(
                  hintText: "Username",
                  prefixIcon: Icons.person_outline_rounded,
                  controller: _usernameController),
              CustomTextField(
                hintText: "Password",
                prefixIcon: Icons.lock,
                controller: _passwordController,
                obscureText: true,
              ),
              CustomTextField(
                  hintText: "Repeat password",
                  prefixIcon: Icons.lock,
                  obscureText: true,
                  controller: _repeatpasswordController),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: ElevatedButton(
                  onPressed: () async {
                    if (_usernameController.text.isEmpty ||
                        _passwordController.text.isEmpty ||
                        _repeatpasswordController.text.isEmpty) {
                      SnackBar snackBar = const SnackBar(
                        content: Text("Please fill in all fields!!!"),
                        duration: Duration(seconds: 2),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    } else {
                      if (_repeatpasswordController.text !=
                          _passwordController.text) {
                        SnackBar snackBar = const SnackBar(
                            content: Text(
                                "Password and Repeat password not match!!!"));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      } else {
                        final prefs = await SharedPreferences.getInstance();
                        AccountModel accountModel = AccountModel(
                            username: _usernameController.text,
                            password: _passwordController.text);
                        prefs.setString('account', accountModel.toJson());
                        SnackBar snackBar = const SnackBar(
                            content: Text(
                                "Register successfully, please login to continue!!!"));

                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginPage()));
                      }
                    }
                  },
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)))),
                  child: const Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Text(
                      "Sign Up",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w800),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 1,
                      width: 50,
                      margin: const EdgeInsets.all(10),
                      color: Colors.white,
                    ),
                    const Text(
                      "Or",
                      style: TextStyle(color: Colors.white),
                    ),
                    Container(
                      height: 1,
                      width: 50,
                      margin: const EdgeInsets.all(10),
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
              const Text(
                "You already have an account",
                style: TextStyle(color: Colors.white),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginPage()));
                    },
                    child: const Text("Sign In")),
              )
            ]),
          ),
        ),
      ]),
    );
  }
}
