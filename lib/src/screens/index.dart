import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:animated_widgets/animated_widgets.dart';
import 'package:dr_health/src/components/widgets/AppDrawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:dr_health/src/handlers/notifications_handler.dart';
import 'package:dr_health/src/database/repository.dart';
import 'package:dr_health/src/models/pill.dart';
import 'package:dr_health/src/components/Medicine/medicines_list.dart';
import 'package:dr_health/src/utils/calendar.dart';
import 'package:dr_health/src/models/calendar_day_model.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  //-------------------| Flutter notifications |-------------------
  final Notifications _notifications = Notifications();
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  //===============================================================

  //--------------------| List of Pills from database |----------------------
  // ignore: deprecated_member_use
  List<Pill> allListOfPills = List<Pill>();
  final Repository _repository = Repository();
  // ignore: deprecated_member_use
  List<Pill> dailyPills = List<Pill>();
  //=========================================================================

  //-----------------| Calendar days |------------------
  final CalendarDayModel _days = CalendarDayModel();
  List<CalendarDayModel> _daysList;
  //====================================================

  //handle last choose day index in calendar
  int _lastChooseDay = 0;

  @override
  void initState() {
    super.initState();
    initNotifies();
    setData();
    _daysList = _days.getCurrentDays();
  }

  //init notifications
  Future initNotifies() async => flutterLocalNotificationsPlugin = await _notifications.initNotifies(context);


  //--------------------GET ALL DATA FROM DATABASE---------------------
  Future setData() async {
    allListOfPills.clear();
    (await _repository.getAllData("Pills")).forEach((pillMap) {
      allListOfPills.add(Pill().pillMapToObject(pillMap));
    });
    chooseDay(_daysList[_lastChooseDay]);
  }
  //===================================================================

  @override
  Widget build(BuildContext context) {
    final whSize = MediaQuery.of(context).size.height / MediaQuery.of(context).size.width;
    final double deviceHeight =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;

    final isDialOpen = ValueNotifier(false);

    final Widget addReminderButton = SpeedDial (
      icon: Icons.control_point_rounded,
      // animatedIcon: AnimatedIcons.menu_close,
      backgroundColor: Theme.of(context).primaryColor,
      activeBackgroundColor: Colors.transparent,
      overlayColor: Colors.black,
      overlayOpacity: 0.4,
      spacing: 12,
      spaceBetweenChildren: 12,
      closeManually: false,
      openCloseDial: isDialOpen,
      children: [
        SpeedDialChild(
          child: Icon(Icons.alarm_add_rounded),
          backgroundColor: Theme.of(context).primaryColor.withOpacity(1.0),
          foregroundColor: Colors.white,
          label: 'Add Reminder',
          onTap: () => Navigator.pushNamed(context, '/AddNewMedicine'),
        ),
        SpeedDialChild(
          child: Icon(Icons.qr_code_2_rounded),
          backgroundColor: Theme.of(context).primaryColor.withOpacity(1.0),
          foregroundColor: Colors.white,
          label: 'Scan QR Code',
          onTap: () => {},
        )
      ],
    );
    // HOME BODY
    return WillPopScope(
      onWillPop: () async {
        if (isDialOpen.value) {
          isDialOpen.value = false;
          return false;
        } else {
          return true;
        }
      },
      child: SafeArea(
        top: false, left: false, right: false,
        minimum: EdgeInsets.only(bottom: 5.0),
        child: Scaffold(
          floatingActionButton: addReminderButton,
          floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
          backgroundColor: Color.fromRGBO(248, 248, 248, 1),
          // APPLICATION BAR
          appBar: AppBar(
            backgroundColor: Theme.of(context).primaryColor,
            actions: [
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/AddNewMedicine');
                },
                child: ShakeAnimatedWidget(
                  enabled: true,
                  duration: Duration(milliseconds: 2000),
                  curve: Curves.linear,
                  shakeAngle: Rotation.deg(z: 30),
                  child: Icon(
                    Icons.notifications_none,
                    size: 35.0,
                  ),
                ),
              ),
            ],
            title: Text(
              "Dr. Health",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: whSize * 10.5,
                color: Colors.white,
              ),
            ),
            centerTitle: false,
            elevation: 2,
            shadowColor: Colors.lightGreenAccent[100],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(10),
              ),
            ),
          ),
          // APP DRAWER
          drawer: AppDrawer(),
          // END APP DRAWER
          body: SingleChildScrollView(
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.only(
                    top: 0.0, left: 25.0, right: 25.0, bottom: 20.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: deviceHeight * 0.03,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.0),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Calendar(chooseDay,_daysList),
                      ),
                    ),
                    SizedBox(height: deviceHeight * 0.02),
                    dailyPills.isEmpty
                      ? SizedBox(
                          width: double.infinity,
                          height: 100,
                          child: Center(
                          // ignore: deprecated_member_use
                            child: WavyAnimatedTextKit(
                              textStyle: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).primaryColor),
                              text: [
                                "No Reminders Today..."
                              ],
                              isRepeatingAnimation: true,
                              speed: Duration(milliseconds: 150),
                            ),
                          ),
                        )
                      : MedicinesList(dailyPills, setData, flutterLocalNotificationsPlugin)
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  //-------------------------| Click on the calendar day |-------------------------

  void chooseDay(CalendarDayModel clickedDay){
    setState(() {
      _lastChooseDay = _daysList.indexOf(clickedDay);
      _daysList.forEach((day) => day.isChecked = false );
      CalendarDayModel chooseDay = _daysList[_daysList.indexOf(clickedDay)];
      chooseDay.isChecked = true;
      dailyPills.clear();
      allListOfPills.forEach((pill) {
        DateTime pillDate = DateTime.fromMicrosecondsSinceEpoch(pill.time * 1000);
        if(chooseDay.dayNumber == pillDate.day && chooseDay.month == pillDate.month && chooseDay.year == pillDate.year){
          dailyPills.add(pill);
        }
      });
      dailyPills.sort((pill1,pill2) => pill1.time.compareTo(pill2.time));
    });
  }

  //===============================================================================


}
