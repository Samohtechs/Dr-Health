//@dart=2.9

// ignore_for_file: deprecated_member_use

import 'package:dr_health/src/utils/app_shared_preference.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:dr_health/src/auth/forgotpassword.dart';
import 'package:dr_health/src/auth/signup.dart';
import 'package:dr_health/src/constant.dart';
import 'package:dr_health/src/screens/index.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String email, password;
  Widget _buildLogo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 30),
          child: Text(
            'Dr. Health',
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.height / 30,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              letterSpacing: 2.0
            ),
          ),
        )
      ],
    );
  }

  Widget _buildEmailRow() {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Form(
        key: _formKey,
        child: TextFormField(
          controller: _emailController,
          keyboardType: TextInputType.emailAddress,
          validator: (String value) {
            if (value.isEmpty) {
              return 'Please provide your credentials';
            }
            return null;
          },
          onChanged: (value) {
            setState(() {
              email = value;
            });
          },
          decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.email,
                color: mainColor,
              ),
              labelText: 'Email Address'),
        ),
      ),
    );
  }

  Widget _buildPasswordRow() {
    return Padding(
      padding: EdgeInsets.all(8),
      child: TextFormField(
        controller: _passwordController,
        keyboardType: TextInputType.text,
        obscureText: true,
        validator: (String value) {
          if (value.isEmpty) {
            return 'Please provide your credentials';
          }
          return null;
        },
        onChanged: (value) {
          setState(() {
            password = value;
          });
        },
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.lock,
            color: mainColor,
          ),
          labelText: 'Password',
        ),
      ),
    );
  }

  Widget _buildForgetPasswordButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 10),
        FlatButton.icon(
          onPressed: () {
            setState(() {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => forgotpassword()),);
            });
          },
          label: Text("Forgot Password?"),
          icon: Icon(Icons.arrow_circle_down_outlined),
        ),
      ],
    );
  }

  Widget _buildLoginButton() {
    return Container(
      height: 1.4 * (MediaQuery.of(context).size.height / 20),
      width: 5 * (MediaQuery.of(context).size.width / 10),
      margin: EdgeInsets.only(bottom: 20),
      child: RaisedButton(
        elevation: 5.0,
        color: mainColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        onPressed: () async {
         final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
          AppPreferences.setUserEmail(email);
          // AppPreferences.setUserEmail('email', _emailController.text);
          if (email != null && password != null) {
            setState(() {
              if(_signInWithEmailAndPassword()) {
                print("Welcome");
              }
              else {
                print('Need an Account?');
              }
             AppPreferences.setUserEmail(email);
             Navigator.pushReplacementNamed(context, '/Navigation');
              // Navigator.push(context , MaterialPageRoute(builder: (context) => Navigation()));
            //  Navigator.pushReplacementNamed(context, '/loading');
            });
          }
          if(email != null && password != null)
          {
            Navigator.pushReplacementNamed(context, '/Navigation');
            // Navigator.push(context , MaterialPageRoute(builder: (context) => Navigation()));
            // Navigator.pushReplacementNamed(context, '/loading');
          }
        },
        child: Text(
          "Welcome",
          style: TextStyle(
            color: Colors.white,
            letterSpacing: 2.0,
            fontSize: MediaQuery.of(context).size.height / 50,
          ),
        ),
      ),
    );
  }

  // Widget _buildOrRow() {
  //   return Row(
  //     mainAxisAlignment: MainAxisAlignment.center,
  //     children: <Widget>[
  //       Container(
  //         margin: EdgeInsets.only(bottom: 20),
  //         child: Text(
  //           '- OR -',
  //           style: TextStyle(
  //             fontWeight: FontWeight.w600,
  //           ),
  //         ),
  //       )
  //     ],
  //   );
  // }

  // Widget _buildSocialBtnRow() {
  //   return Row(
  //     mainAxisAlignment: MainAxisAlignment.center,
  //     children: <Widget>[
  //       GestureDetector(
  //         onTap: () {setState(() async {
  //         await  signInWithGoogle();
  //           Navigator.pushReplacementNamed(context, '/Navigation');
  //           // await Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => Navigation()));
  //         });},
  //         child: Container(
  //           height: 60,
  //           width: 60,
  //           decoration: BoxDecoration(
  //             shape: BoxShape.circle,
  //             color: mainColor,
  //             boxShadow: [
  //               BoxShadow(
  //                   color: Colors.black26,
  //                   offset: Offset(0, 2),
  //                   blurRadius: 6.0)
  //             ],
  //           ),
  //           child: Icon(
  //             FontAwesomeIcons.google,
  //             color: Colors.white,
  //           ),
  //         ),
  //       )
  //     ],
  //   );
  // }

  Widget _buildContainer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.6,
            width: MediaQuery.of(context).size.width * 0.8,
            decoration: BoxDecoration(
              color: Colors.green.shade300,  //Colors.white60,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Provide your information",
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height / 40,
                      ),
                    ),

                  ],
                ),
                _buildEmailRow(),
                _buildPasswordRow(),
                _buildForgetPasswordButton(),
                _buildLoginButton(),
                // _buildOrRow(),
                // _buildSocialBtnRow(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSignUpBtn() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 40),
          child: FlatButton(
            onPressed: () {
              setState(() {
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => signUp()));  //LoginPage
              });
            },

            child: RichText(
              text: TextSpan(children: [
                TextSpan(
                  text: 'Don\'t have an account? ',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: MediaQuery.of(context).size.height / 50,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                TextSpan(
                  text: 'Register here',
                  style: TextStyle(
                    color: mainColor,
                    fontSize: MediaQuery.of(context).size.height / 50,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.3
                  ),
                )
              ]),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.brown[300],
        //Color(0xfff2f3f7),
        body: Stack(
          children: <Widget>[

            Container(
              height: MediaQuery.of(context).size.height * 0.7,
              width: MediaQuery.of(context).size.width,
              child: Container(
                decoration: BoxDecoration(
                  color: mainColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: const Radius.circular(50),
                    bottomRight: const Radius.circular(50),
                  ),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _buildLogo(),
                _buildContainer(),
                _buildSignUpBtn(),
                FlatButton(onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => Home()));  //LoginPage
                }, child: Text("Anonymous login" , style: TextStyle(fontSize: 15, color: Colors.blueGrey))),


              ],
            )
          ],
        ),
      ),
    );
  }

  //Email and Password SignIn method

  _signInWithEmailAndPassword() async{
    try{
      final User user = (await _firebaseAuth.signInWithEmailAndPassword(
          email: _emailController.text.trim(), password: _passwordController.text.trim())).user;
      if(user!=null){
        setState(() {
          Fluttertoast.showToast(msg: "Welcome !");
          Navigator.pushReplacementNamed(context, '/Navigation');
          // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Navigation()),);
        });
      }
    }catch(e){
      Fluttertoast.showToast(msg: "Provide correct details or create an account", toastLength: Toast.LENGTH_LONG);
    }
  }
}


// Google sign in

Future<UserCredential> signInWithGoogle() async {
  final GoogleSignInAccount googleuser = await GoogleSignIn().signIn();

  final GoogleSignInAuthentication googleAuth = await googleuser.authentication;

  final GoogleAuthCredential credential = GoogleAuthProvider.credential(
      idToken: googleAuth.idToken,
      accessToken: googleAuth.accessToken
  );
  Fluttertoast.showToast(msg: "Welcome !");
  return await FirebaseAuth.instance.signInWithCredential(credential);
}



