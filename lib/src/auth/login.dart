//@dart=2.9
import 'package:dr_health/src/components/navigation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:dr_health/src/screens/index.dart';
import 'forgotpassword.dart';
import 'home.dart';
import 'signup.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LOGIN extends StatefulWidget {
  @override
  _LOGINState createState() => _LOGINState();
}
class _LOGINState extends State<LOGIN> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  final color3 = const Color(0xFF38BF68);

  Widget Title = Container(
    padding: const EdgeInsets.symmetric(horizontal: 20,),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Login",
              style: TextStyle(
                letterSpacing: 2.0,
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                  fontSize: 20
              ),
            ),
            Container( width: 5),
          ],
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.circle,
              color: Colors.black87,
              size: 10.0,
            ),
            new SizedBox(
              width: 70.0,
              child: new Center(
                child: new Container(
                  margin: new EdgeInsetsDirectional.only(start: 10.0, end: 10.0),
                  height: 1.0,
                  color: Colors.yellow,
                ),
              ),
            ),

            Icon(
              Icons.circle,
              color: Colors.black,
              size: 10.0,
            )
          ],
        )
      ],
    ),
  );
  Widget back =  Container(
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [

          Container(height: 615,width: 300),
          Positioned( top: 0,
            child:  Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.white,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(20))
              ),
              height: 510,width: 290,
              margin: EdgeInsets.symmetric(vertical: 15.0,horizontal:35),
            ),
          ),
        ],
      )
  );
  Widget text(BuildContext context) {
    return Container(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                child:
                const Text("Welcome",
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
              ),
              SizedBox(height: 3),
              Container(
                child: Text("Provide your details to procede: ",
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.black54
                  ),
                ),
              ),
              SizedBox(height: 50),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black54),
                    borderRadius: BorderRadius.circular(12)

                ),
                child: Container(
                    padding: EdgeInsets.all(10),
                    constraints: BoxConstraints(
                        minWidth: 80, minHeight: 40, maxWidth: 260),
                    child: Row(
                      children: [
                        Icon(Icons.email),
                        SizedBox(width: 10),
                        Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("EMAIL",
                                style: TextStyle(
                                    color: Colors.black54
                                ),
                              ),
                              SizedBox(
                                width: 180, height: 30,
                                child: TextFormField(
                                  controller: _emailController,
                                  decoration: InputDecoration(
                                    border: UnderlineInputBorder(),
                                  ),
                                  validator: (String value) {
                                    if (value.isEmpty) {
                                      return 'Please provide your details';
                                    }
                                    return null;
                                  },

                                ),
                              )
                              // TextFormField(
                              //   decoration: InputDecoration(
                              //   ),
                              // )
                            ]
                        ),

                      ],
                    )
                ),
              ),
              SizedBox(height: 7),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black54),
                    borderRadius: BorderRadius.circular(12)

                ),
                child: Container(
                    padding: EdgeInsets.all(10),
                    constraints: BoxConstraints(
                        minWidth: 80, minHeight: 40, maxWidth: 260),
                    child: Row(
                      children: [
                        Icon(Icons.lock),
                        SizedBox(width: 10),
                        Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("PASSWORD",
                                style: TextStyle(
                                    color: Colors.black54
                                ),),
                              SizedBox(
                                width: 180, height: 30,
                                child: TextFormField(
                                  controller: _passwordController,
                                  decoration: InputDecoration(
                                    border: UnderlineInputBorder(),
                                  ),
                                  validator: (String value) {
                                    if (value.isEmpty) {
                                      return 'Please provide your details';
                                    }
                                    return null;
                                  },
                                ),
                              )
                              // TextFormField(
                              //   decoration: InputDecoration(
                              //   ),
                              // )
                            ]
                        ),

                      ],
                    )
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => forgotpassword()),);
                      });
                    },
                    child: Container(
                        margin: EdgeInsets.only(top: 20,left: 150),
                        child: const Text("Forgot Password?",
                          style: TextStyle(
                              fontSize: 13,
                              color: Color(0xFF267D43)
                          ),
                        )
                    ),
                  ),
                ],
              ), //Check
              SizedBox(height: 70),
              Container(
                // width: 120,
                padding: const EdgeInsets.only(left: 30, top: 7, right: 7, bottom: 7),
                decoration: const BoxDecoration(
                    gradient:  LinearGradient(
                        colors: [Colors.lightGreen, Color(0xFF2A9750)]),
                    borderRadius: BorderRadius.horizontal(
                        right: Radius.circular(40), left: Radius.circular(40))
                ),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text("Login", style: TextStyle(
                        letterSpacing: 2.0,
                          color: Colors.white,
                          fontSize: 20
                      ),),
                      Container(width: 15),
                      Container(
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.lightGreen
                        ),
                        child: IconButton(onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            setState(() {
                              _signInWithEmailAndPassword();
                            });
                          }
                        },
                            icon: Icon(Icons.arrow_forward_rounded),
                            iconSize: 25,
                            color: Colors.black54), width: 40, height: 40,)
                    ]
                ),
              ),
              SizedBox(height: 30),
              const Text("Don't Have An Account ?",
                style: TextStyle(
                    fontSize: 13
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => signUp()),);
                  });
                },
                child: Container(
                    child: const Text("Create one",
                      style: TextStyle(
                          color: Color(0xFF267D43)
                      ),
                    )
                ),
              ),
              SizedBox(height: 80, width: 20),

            ]
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    const color3 = const Color(0xFF38BF68);
    return Form(
        key: _formKey,
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(fontFamily: 'Balsamiq_Sans'),
            home: Scaffold(
              backgroundColor: color3,
              body: Container(
                child: ListView(
                    children:[
                      Title,
                      Stack(
                          alignment: Alignment.center,
                          children: [
                            back,
                            text(context),
                          ]
                      )
                    ]
                ),
              ),
            )
        )
    );
  }

  _signInWithEmailAndPassword() async{
    try{
      final User user = (await _firebaseAuth.signInWithEmailAndPassword(
          email: _emailController.text.trim(), password: _passwordController.text.trim())).user;
      if(user!=null){
        setState(() {
          Fluttertoast.showToast(msg: "Signed In Sucessfully");
          // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home()),);
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Navigation()),);
        });
      }

    }catch(e){
      Fluttertoast.showToast(msg: e.toString());
    }
  }

}