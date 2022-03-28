// ignore_for_file: prefer_const_constructors

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:e_wallet/Views/Auth/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Utils/constants.dart';
import '../Home/home.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool termsConditions = false;
  void showAlertDialogOnOkCallback(
    String title,
    Widget msg,
    DialogType dialogType,
    BuildContext context,
    Function btnokpress,
    Function btncancelpress,
  ) {
    AwesomeDialog(
            // buttonsTextStyle: TextStyle(color: Colors.whit),
            padding: EdgeInsets.all(10),
            aligment: Alignment.center,
            context: context,
            animType: AnimType.BOTTOMSLIDE,
            dialogType: dialogType,
            title: title,
            body: msg,
            btnOkColor: primaryClr,
            btnCancelColor: secendoryClr,
            btnOkText: "Agreed",
            btnCancelText: "Cancel",
            btnCancelOnPress: btncancelpress,
            btnOkOnPress: btnokpress)
        .show();
  }

  @override
  Widget build(BuildContext context) {
    double _w = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: backColor,
        body: SingleChildScrollView(
          child: Column(crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/signup_vector.png",
                  width: _w / 1.4,
                ),
                // SizedBox(
                //   height: 20,
                // ),
                Container(
                  padding: EdgeInsets.all(16),
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(children: [
                    Text(
                      "Create new account",
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextField(
                      controller: name,
                      decoration: InputDecoration(
                        labelText: "Full name",
                        // prefixIcon: Icon(Icons.people),
                        border: OutlineInputBorder(
                          //Outline border type for TextFeild
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(
                            color: Colors.redAccent,
                            width: 0,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextField(
                      controller: email,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: "E-mail",
                        border: OutlineInputBorder(
                          //Outline border type for TextFeild
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(
                            color: Colors.redAccent,
                            width: 0,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextField(
                      controller: password,
                      keyboardType: TextInputType.emailAddress,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: "Password",
                        suffixIcon: Icon(Icons.remove_red_eye),
                        border: OutlineInputBorder(
                          //Outline border type for TextFeild
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(
                            color: Colors.redAccent,
                            width: 0,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      // crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Checkbox(
                          value: termsConditions,
                          onChanged: (bool? value) {
                            setState(() {
                              termsConditions = value!;
                            });
                          },
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            Text("By creating an account, you agree to our"),
                            GestureDetector(
                              onTap: () => showAlertDialogOnOkCallback(
                                "Terms and Conditions",
                                Text("Terms snd Conditions"),
                                DialogType.INFO,
                                context,
                                //on cancel button
                                () {
                                  setState(() {
                                    termsConditions = true;
                                  });
                                },
                                //on agreed button
                                () {
                                  setState(() {
                                    termsConditions = false;
                                  });
                                },
                              ),
                              child: Text(
                                "Terms and Conditions",
                                style: TextStyle(color: Colors.blue),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    InkWell(
                      onTap: (() => Get.to(() => Home())),
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: primaryClr),
                        child: Center(
                          child: Text(
                            "Create Account",
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ),
                  ]),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account? ",
                      style: TextStyle(
                          // fontSize: 25,
                          ),
                    ),
                    InkWell(
                      onTap: (() {
                        Get.offAll(() => Login());
                      }),
                      child: Text(
                        "Sign In",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xff6d5ffd).withOpacity(0.8)),
                      ),
                    ),
                  ],
                )
              ]),
        ),
      ),
    );
  }
}
