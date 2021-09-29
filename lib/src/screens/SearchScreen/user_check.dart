// //@dart=2.9

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:dr_health/src/screens/index.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_fadein/flutter_fadein.dart';
// import 'package:flutter_swiper/flutter_swiper.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:get/get.dart';
// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
// import 'package:dr_health/main.dart';
// import 'package:dr_health/src/auth/auth.dart';
// import 'dart:async';
// import 'package:dr_health/src/constant.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'dart:math';

// import 'package:showcaseview/showcaseview.dart';

// class SplashScreen extends StatefulWidget {
//   @override
//   _SplashScreenState createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {

//   @override
//   String finalEmail;

//   @override
//   Future <void> initState() {
//     getValidationData().whenComplete(() async {
//     Timer(Duration(seconds: 15), () async {
//       WidgetsFlutterBinding.ensureInitialized();
//       await Firebase.initializeApp();

//       Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => finalEmail == null ? LoginPage() : Home2()));  //LoginPage
//     });

//     super.initState();
//   });
//         }

//   Future getValidationData() async {
//     final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
//     var obtainedEmail = sharedPreferences.getString('email');
//     setState(() {
//       finalEmail = obtainedEmail;

//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         gradient: LinearGradient(
//           begin: Alignment.topLeft,
//           end: Alignment.bottomRight,
//           colors: [
//             Colors.black,
//             Colors.blue[900],
//             Colors.green[900],
//             Colors.yellow[700]
//           ]
//         )
//       ),

//       child: Scaffold(
//        backgroundColor: Colors.black26,
//         body: Padding(
//           padding: const EdgeInsets.fromLTRB(10, 10, 10, 80),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               // FadeIn(
//               //   duration: Duration(seconds: 7),
//               //   child: Image(
//               //     image: AssetImage("assets/images/welcome.jpg"),
//               //     height: 260,
//               //   ),
//               // ),
//               SpinKitRipple(
//                 duration: Duration(seconds: 4),
//                 color: Colors.white,
//                 size: 100.0,
//               ),
//               SizedBox(height: 40),
//               FadeIn(
//                 duration: Duration(seconds: 1),
//                 child: Text("Welcome",
//                 style: TextStyle(
//                   fontSize: 18,
//                   letterSpacing: 1.0,
//                   color: Colors.green,
//                 ),
//                 ),
//               ),
//               SizedBox(height: 12),

//               FadeIn(duration: Duration(seconds: 4),

//                   child: Text("To")),
//               SizedBox(height: 12),

//               FadeIn(duration: Duration(seconds: 7),child: Text('Dr. Health' ,   style: TextStyle(
//                 fontSize: 20,
//                 letterSpacing: 1.0,
//                 color: Colors.yellow,
//               ),))
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class Home2 extends StatefulWidget {
//   static const PREFERENCES_IS_FIRST_LAUNCH_STRING = "PREFERENCES_IS_FIRST_LAUNCH_STRING";

//   const Home2({Key key}) : super(key: key);

//   @override
//   HomeState createState() => HomeState();
// }

// class HomeState extends State<Home2> {
//   final _themeData = GetStorage();
//   bool _isdarkMode = false;

//   // List<String> autoSelect = ['A' , 'B' , 'C'];

//   //[A, B , C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S ,T ,U, V ,W , X , Y , Z];

//   GlobalKey _one = GlobalKey();
//   GlobalKey _three = GlobalKey();
//   GlobalKey _two = GlobalKey();

//   BuildContext myContext;
//   @override
//   void initState(){
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback(
//             (_) {
//           _isFirstLaunch().then((result){
//             if(result)
//               ShowCaseWidget.of(myContext).startShowCase([_one ,_two , _three]);
//           });
//         }
//     );

//     _themeData.writeIfNull("darkmode", false);
//     _isdarkMode = _themeData.read("darkmode");

//   }
//   bool _visible = true;
//   bool visible = true;
//   bool autoPlay = false;

//   int itemCount = 1;
//   int indexa;
//   List<String> Vipera = ['Methali' , 'Mafumbo', 'Vitendawili' , 'Nahau', 'Misemo', 'Mafumbo'];
//   List<String> alpha = ['A' , 'B' , 'C' , 'D' ,"E"];

//   var rng = new Random();

//   dynamic Ulizo = 'Kozi mwana Mandanda';
//   List<String> Uliza = ['Kozi mwana Mandanda' , 'Asiyesikia la mkuu'];

//   dynamic Majibu = "Kulala na njaa kupenda";
//   dynamic Maelezo = "Ahangaikaye kwa chochote kupata Riziki ya halali chochote atapata kama riziki. \n Methali inayofanana: Mtembea bure si sawa na mkaa bure";
//  // String alpha = 'A';

//   @override
//   Widget build(BuildContext context) {

//     // dynamic indexa = rng.nextInt(5);

//   //  print(alpha[indexa]);

//     int ItemCount = 100;
//    // Ulizo[1];
//     int itemCount = 0;

//    // var l = new List.generate(12, (_) => rng.nextInt(10));
//     return ClipRRect(
//         borderRadius: BorderRadius.all(
//             Radius.circular(20)
//         ),
//         child: ShowCaseWidget(
//           builder: Builder(builder: (context) {
//             myContext = context;
//             return FadeIn(
//               duration:  Duration(seconds: 2),
//               child: Scaffold(
//                 drawer: _customDrawer(context),
//                 backgroundColor: _isdarkMode ? Colors.black : Colors.white,

//                 appBar: new AppBar(
//                   // shape: RoundedRectangleBorder(
//                   //     borderRadius:  BorderRadius.vertical(
//                   //         bottom: Radius.circular(90)
//                   //     )
//                   // ),
//                   shadowColor: Colors.white,
//                   toolbarHeight: 50,
//                   elevation: 25,
//                   backgroundColor: Colors.black26,
//                   flexibleSpace: Container(
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.vertical(bottom: Radius.circular(12)),
//                         gradient: LinearGradient(
//                             colors: [
//                               Colors.green[900],
//                               Colors.brown[900],
//                               Colors.blueGrey,

//                             ]
//                         )
//                     ),
//                   ),
//                   // backgroundColor: Colors.black26,
//                   title: new Text("Semi za Kiswahili", style: TextStyle(letterSpacing: 2.9)),
//                   centerTitle: true,
//                 ),
//                 body: GestureDetector(

//                   onTap: () async {

//                     Fluttertoast.showToast(msg: ".......", toastLength: Toast.LENGTH_LONG);
//                     DocumentSnapshot variable = await FirebaseFirestore.instance.collection('Methali').doc('A').get();
//                    Ulizo = variable[itemCount.toString()][0];
//                     Majibu = variable[itemCount.toString()][1];
//                     Maelezo = variable[itemCount.toString()][2];
//                     Fluttertoast.showToast(msg: ".", fontSize:  10);
//                     if(itemCount >10) {

//                       Fluttertoast.showToast(msg: "Mwisho !", backgroundColor: Colors.teal);
//                     }
//                     itemCount++;


//                   },
//                   onLongPress: ()async { if(itemCount > 0) {itemCount--;}
//                   Fluttertoast.showToast(msg: ".......", toastLength: Toast.LENGTH_LONG);
//                   DocumentSnapshot variable = await FirebaseFirestore.instance.collection('Methali').doc('A').get();
//                  Ulizo = variable[itemCount.toString()][0];
//                   Majibu = variable[itemCount.toString()][1];
//                   Maelezo = variable[itemCount.toString()][2];
//                   Fluttertoast.showToast(msg: ".", fontSize: 10);

//                   },

//                   child: Swiper(
//                     // onIndexChanged: (index) async {
//                     //   Fluttertoast.showToast(msg: ".....", textColor: Colors.blue, fontSize: 10, toastLength: Toast.LENGTH_LONG);
//                     //   DocumentSnapshot variable = await FirebaseFirestore.instance.collection('Methali').doc(alpha).get();
//                     //   Ulizo = variable[index.toString()][0];
//                     //   Majibu = variable[index.toString()][1];
//                     //   Maelezo = variable[index.toString()][2];
//                     //   // itemCount++; itemCounta++;
//                     //   Fluttertoast.showToast(msg: ".", backgroundColor: Colors.black12, fontSize: 10);
//                     //   if(index==0) {Fluttertoast.showToast(msg: "Mwanzo", textColor: Colors.blue, fontSize: 10, toastLength: Toast.LENGTH_LONG);}
//                     //
//                     //   print(index);
//                     // } ,

//                     autoplayDisableOnInteraction: true,
//                     duration: 2000,
//                     itemBuilder: (BuildContext context,int index){

//                       return Padding(
//                         padding: const EdgeInsets.fromLTRB(3, 0, 3, 0),
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             RaisedButton.icon(onPressed: () {

//                             },
//                                 color: Colors.blueGrey , icon: Icon(Icons.arrow_circle_down), label: Text("Semi za Leo")),
//                             SizedBox(height: 90),

//                             Showcase(
//                               key: _one,
//                               title: 'ili Kupata semi zaidi',
//                               description: ' inahitaji uwe umeungwanishwa katika mtandao',

//                               child: FadeIn(
//                                 duration: Duration(seconds: 2),
//                                 child: Text('$Ulizo',
//                                   //testMap.keys.elementAt(index),
//                                   style: TextStyle(
//                                     fontSize: 19,
//                                     letterSpacing: 1.5,
//                                     color:  _isdarkMode ? Colors.green : Colors.black87,
//                                     // color: Colors.greenAccent
//                                     //     color: Colors.black,
//                                   ),),
//                               ),
//                             ),
//                             SizedBox(height: 25),
//                             Showcase(
//                               key: _three,
//                               title: 'Kupata semi iliyotangulia:',
//                               description: ' Bonyeza kioo na shikilia kwa mda ,kisha vuta kwenda kulia',


//                               child: Text(''),

//                             ),

//                             AnimatedOpacity(
//                               opacity: _visible ? 1.0 : 0.0,
//                               duration: const Duration(milliseconds: 1000),
//                               child: FadeIn(
//                                 duration: Duration(seconds: 7),
//                                 child: Text('$Majibu',
//                                   // testMap.values.elementAt(index),
//                                   style: TextStyle(
//                                     fontSize: 16,
//                                     letterSpacing: 1.9,
//                                     color:  _isdarkMode ? Colors.greenAccent : Colors.black87,

//                                     //       color: Colors.brown
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             SizedBox(height: 25),

//                             FlatButton.icon(onPressed: (){

//                               setState((){
//                                 _visible = !_visible;

//                               });


//                             },
//                                 icon: Icon(_visible ? Icons.visibility : Icons.visibility_off), label: Text('')),

//                             SizedBox(height: 2),
//                             Showcase(
//                               key: _two,
//                               title: 'Kupata semi inayofuata:',
//                               description: 'Bonyeza kwenye kioo, subiri kidogo ,kisha vuta kwenda kushoto',
//                               child: Text(''),

//                             ),
//                             FlatButton.icon(onPressed: () {
//                               setState(() {
//                                 visible = ! visible;
//                               });
//                             },
//                                 label: Text('Maelezo'), icon: Icon(Icons.arrow_circle_down_outlined)),

//                             FadeIn(
//                               duration: Duration(seconds: 5),
//                               child: Card(
//                                 shadowColor: Colors.brown,
//                                 color: Colors.black26,
//                                 child: Padding(
//                                   padding: const EdgeInsets.all(8.0),
//                                   child: Padding(
//                                     padding: const EdgeInsets.fromLTRB(5, 0, 5, 7),
//                                     child: AnimatedOpacity(
//                                       opacity: visible ? 1.0 : 0.0,
//                                       duration: const Duration(milliseconds: 1000),
//                                       child: FadeIn( duration: Duration(seconds: 3), curve: Curves.elasticIn,child: Text('$Maelezo', style: TextStyle(color: Colors.yellowAccent),)),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       );
//                     },
//                     itemCount:  ItemCount,//testMap.length,
//                     //pagination: SwiperPagination(),
//                     control: SwiperControl(),
//                   ),
//                 ),

//               ),
//             );

//           }),
//         ));
//   }


//   //Customized Navigation bar

//   Widget _customDrawer(BuildContext context) {
//     return FadeIn(
//       duration: Duration(seconds: 2),
//       child: Container(
//         width: 250,
//         padding: EdgeInsets.all(2),
//         child: ClipRRect(
//           borderRadius: BorderRadius.all(
//             Radius.circular(12.0),
//           ),
//           child: Drawer(
//             elevation: 0.0,
//             child: ListView(
//               padding: EdgeInsets.zero,
//               children: <Widget>[
//                 DrawerHeader(
//                   child: Card(
//                     color: Colors.black26,
//                     child: Center(
//                       child: Text(
//                         "Vipera vya semi ",
//                         style: TextStyle(color: _isdarkMode ? Colors.white : Colors.white,
//                           fontSize: 25
//                         ),
//                       ),
//                     ),
//                   ),
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.all(Radius.circular(10.0)),
//                       image: DecorationImage(
//                           fit: BoxFit.cover,
//                           image: AssetImage('assets/images/cover.jpg'))),
//                 ),
//                 ListTile(
//                   leading: Icon(Icons.border_color),
//                   title: Text('Methali' ,style: TextStyle(fontSize: 12, letterSpacing: 2.0),),
//                   onTap: () => { Navigator.pushNamed(context, '/mithali')},
//                 ),
//                 ListTile(
//                   leading: Icon(Icons.border_color),
//                   title: Text('Vitendawili' , style: TextStyle(fontSize: 12, letterSpacing: 2.0),),
//                   onTap: () => {Navigator.pushNamed(context, '/vitendawili')},
//                 ),
//                 ListTile(
//                   leading: Icon(Icons.border_color),
//                   title: Text('Nahau' ,style: TextStyle(fontSize: 12, letterSpacing: 2.0),),
//                   onTap: () => {
//                     Navigator.pushNamed(context , '/nahau')},
//                 ),
//                 ListTile(
//                   leading: Icon(Icons.border_color),
//                   title: Text('Mafumbo' , style: TextStyle(fontSize: 12, letterSpacing: 2.0),),
//                   onTap: () => {
//                     Navigator.pushNamed(context , '/mafumbo')},

//                 ),

//                 ListTile(
//                   leading: Icon(Icons.border_color),
//                   title: Text('Misemo' , style: TextStyle(fontSize: 12, letterSpacing: 2.0),),
//                   onTap: () => {
//                     Navigator.pushNamed(context , '/misemo')
//                   },
//                 ),
//                 Divider(height: 20.0, color: Colors.black26,),

//                 SizedBox(height: 10),
//                 SwitchListTile(
//                   secondary: const Icon(Icons.ac_unit),
//                   title: const Text(
//                     "Mandhari",
//                   ),
//                   value: _isdarkMode,
//                   onChanged: (value){
//                     setState(() {
//                       _isdarkMode = value;
//                     });
//                     _isdarkMode
//                         ? Get.changeTheme(ThemeData.dark())
//                         : Get.changeTheme(ThemeData.light());
//                     _themeData.write('darkmode', value);
//                   },
//                   activeThumbImage: const AssetImage("assets/half-moon.png"),
//                   inactiveThumbImage: const AssetImage("assets/sun.png"),
//                   activeColor: Colors.blue,
//                   inactiveTrackColor: Colors.grey,
//                 ),
//                 ListTile(
//                   leading: Icon(Icons.border_color),
//                   title: Text('Kuhusu' , style: TextStyle(fontSize: 12, letterSpacing: 2.0),),
//                   onTap: () => {
//                     Navigator.pushNamed(context , '/kuhusu')
//                   },
//                 ),
//                 ListTile(
//                   leading: Icon(Icons.comment_sharp),
//                   title: Text('Maoni / Ushauri' ,style: TextStyle(fontSize: 12, color: Colors.green , letterSpacing: 2.0),),
//                   onTap: () => Navigator.pushNamed(context , '/maoni'),
//                   //onTap: () => SystemNavigator.pop(),

//                 ),


//                 ListTile(
//                     leading: Icon(Icons.fullscreen_exit_outlined),
//                     title: Text('Ondoka' ,style: TextStyle(fontSize: 12, color: Colors.amber , letterSpacing: 2.0),),
//                     onTap: ()  async {
//                       final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
//                       sharedPreferences.remove('email');
//                       Navigator.push(context , MaterialPageRoute(builder: (context) => SplashScreen()));
//                     }
//                 ),
//                 ListTile(
//                   leading: Icon(Icons.fullscreen_exit_outlined),
//                   title: Text('funga' ,style: TextStyle(fontSize: 12, color: Colors.red , letterSpacing: 2.0),),
//                  // onTap: () => SystemNavigator.pop(),
//                   onTap: () => Navigator.push(context , MaterialPageRoute(builder: (context) => GoodbyeScreen())),

//                 ),
//               ],
//             ),


//           ),
//         ),
//       ),
//     );
//   }
// }




// // Goodbye Screen

// class GoodbyeScreen extends StatefulWidget {
//   @override
//   _GoodbyeScreenState createState() => _GoodbyeScreenState();
// }

// class _GoodbyeScreenState extends State<GoodbyeScreen> {

//   @override
//   Future <void> initState() {
//       Timer(Duration(seconds: 5), (){
//          SystemNavigator.pop();
//       });
//       super.initState();
//   }


//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//           gradient: LinearGradient(
//               begin: Alignment.topLeft,
//               end: Alignment.bottomRight,
//               colors: [
//                 Colors.black,
//                 Colors.blue[900],
//                 Colors.green[900],
//                 Colors.yellow[700]
//               ]
//           )
//       ),

//       child: Scaffold(
//         backgroundColor: Colors.black26,
//         body: Padding(
//           padding: const EdgeInsets.fromLTRB(10, 10, 10, 80),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               SpinKitSpinningLines (
//                 duration: Duration(seconds: 4),
//                 color: Colors.white,
//                 size: 100.0,
//               ),
//               SizedBox(height: 40),
//               FadeIn(
//                 duration: Duration(seconds: 1),
//                 child: Text("Karibu tena",
//                   style: TextStyle(
//                     fontSize: 18,
//                     letterSpacing: 1.0,
//                     color: Colors.green,
//                   ),
//                 ),
//               ),


//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }



// // // Display the ShowcaseView only on the first launch

// // Future<bool> _isFirstLaunch() async{
// //   final sharedPreferences = await SharedPreferences.getInstance();
// //   bool isFirstLaunch = sharedPreferences.getBool(Home.PREFERENCES_IS_FIRST_LAUNCH_STRING) ?? true;

// //   if(isFirstLaunch)
// //     sharedPreferences.setBool(Home.PREFERENCES_IS_FIRST_LAUNCH_STRING, false);

// //   return isFirstLaunch;
// // }






































// // //
// // // body: GestureDetector(
// // // onTap: () async {
// // // if(itemCount >10) {
// // //
// // // Fluttertoast.showToast(msg: "Mwisho !", backgroundColor: Colors.teal);
// // // }
// // // indexa = rng.nextInt(3);
// // //
// // // Fluttertoast.showToast(msg: ".......", toastLength: Toast.LENGTH_LONG);
// // // DocumentSnapshot variable = await FirebaseFirestore.instance.collection(Vipera[indexa].toString()).doc(alpha[indexa].toString()).get();
// // // Ulizo = variable[itemCount.toString()][0];
// // // Majibu = variable[itemCount.toString()][1];
// // // Maelezo = variable[itemCount.toString()][2];
// // // Fluttertoast.showToast(msg: ".", fontSize:  10);
// // // itemCount++;
// // // print(itemCount);
// // //
// // //
// // // },