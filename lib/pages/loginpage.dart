// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mid_term_flutter/compoments/textfield_component.dart';
import 'package:mid_term_flutter/models/account_models.dart';
import 'package:mid_term_flutter/pages/homepage.dart';
import 'package:mid_term_flutter/pages/registerpage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
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
                    "Login to \n your Account",
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
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: ElevatedButton(
                  onPressed: () async {
                    AccountModel accountModel = AccountModel(
                        username: _usernameController.text,
                        password: _passwordController.text);
                    final prefs = await SharedPreferences.getInstance();
                    Map<String, dynamic> account = jsonDecode(prefs
                            .getString('account') ??
                        '{}'); // chhuyen json thanh map -> json sẽ chuyển thành 2 biến thuộc tính
                    AccountModel validateAccount =
                        AccountModel.fromJson(account)!;
                    if (accountModel.username == validateAccount.username &&
                        accountModel.password == validateAccount.password) {
                      SnackBar snackBar = const SnackBar(
                        content: Text("Login successfully!!!"),
                        duration: Duration(seconds: 2),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomePage()));
                    } else {
                      SnackBar snackBar = const SnackBar(
                          content: Text("Username or password is wrong!!!"));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  },
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)))),
                  child: const Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Text(
                      "Sign In",
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
              Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: IconButton(
                          onPressed: () {},
                          icon: const Image(
                            image: AssetImage('asset/facebook.png'),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: IconButton(
                          onPressed: () {},
                          icon: const Image(
                            image: AssetImage('asset/google.png'),
                          )),
                    )
                  ],
                ),
              ),
              const Text(
                "Don't have a account?",
                style: TextStyle(color: Colors.white),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const RegisterPage()));
                    },
                    child: const Text("Sign Up")),
              )
            ]),
          ),
        ),
      ]),
    );
  }
}
