import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:zaboteru/providers/result_provider.dart';

class DashboardContent extends StatefulWidget {
  const DashboardContent({super.key});

  @override
  State<DashboardContent> createState() => _DashboardContentState();
}

class _DashboardContentState extends State<DashboardContent> {
  bool isSterilization = false;
  bool isHeating = false;
  bool isVisible = false;
  DateTime today = DateTime.now();

  Map<int, String> months = {
    1: 'Jan',
    2: 'Feb',
    3: 'Mar',
    4: 'Apr',
    5: 'May',
    6: 'Jun',
    7: 'Jul',
    8: 'Aug',
    9: 'Sep',
    10: 'Oct',
    11: 'Nov',
    12: 'Dec',
  };

  Timer? _sterilizationTimer;
  bool isSterilizationSwitchEnabled = true;
  int sterilizationRemainingTime = 10;

  @override
  void dispose() {
    _sterilizationTimer?.cancel();
    super.dispose();
  }

  void _startSterilizationTimer() {
    _sterilizationTimer?.cancel();

    _sterilizationTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        sterilizationRemainingTime--;
      });

      if (sterilizationRemainingTime <= 0) {
        _sterilizationTimer?.cancel();
        setState(() {
          isSterilization = false;
        });

        // Disable the switch for 5 seconds
        setState(() {
          isSterilizationSwitchEnabled = false;
        });

        // Wait for 5 seconds before hiding the message
        Future.delayed(const Duration(seconds: 5), () {
          setState(() {
            isVisible = false;
            sterilizationRemainingTime =
                10; // Reset the timer for the next sterilization
            isSterilizationSwitchEnabled = true;
          });
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    String formattedDate = '${today.day} ${months[today.month]} ${today.year}';
    return ScreenUtilInit(
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          // Dismiss keyboard if pressed anywhere out of it
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Scaffold(
            body: SingleChildScrollView(
          child: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 20.h),
                  Text(
                    'Today\n$formattedDate',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: const Color.fromARGB(255, 79, 79, 79),
                      fontSize: 14.sp,
                    ),
                  ),
                  SizedBox(height: 30.h),
                  CircularPercentIndicator(
                    radius: 100.w,
                    lineWidth: 14.w,
                    percent: 0.4,
                    progressColor: Colors.blue,
                    backgroundColor: const Color.fromARGB(255, 197, 205, 208),
                    circularStrokeCap: CircularStrokeCap.round,
                    center: Text(
                      '40%',
                      style: TextStyle(fontSize: 28.sp),
                    ),
                  ),
                  SizedBox(height: 30.h),
                  const Divider(
                    color: Color.fromARGB(255, 197, 205, 208),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0), // Adjust the padding as needed
                    child: SizedBox(
                      height:
                          120, // Set a fixed height or use MediaQuery.of(context).size.height
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(4),
                                child: Column(children: [
                                  Text(
                                    'Days Streak',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color:
                                          const Color.fromARGB(255, 12, 57, 93),
                                      fontSize: 16.0.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ]),
                              ),
                            ),
                          ),
                          SizedBox(
                              width: 8.0.w), // Add space between containers
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(4),
                                child: Column(children: [
                                  Text(
                                    'Day Goal',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color:
                                          const Color.fromARGB(255, 12, 57, 93),
                                      fontSize: 16.0.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 8.h,
                                  ),
                                  Text(
                                    context
                                        .watch<ResultProvider>()
                                        .result[0]
                                        .toStringAsPrecision(3),
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 23.0.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                ]),
                              ),
                            ),
                          ),
                          SizedBox(
                              width: 8.0.w), // Add space between containers
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(4),
                                child: Column(children: [
                                  Text(
                                    'Bottles to go',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color:
                                          const Color.fromARGB(255, 12, 57, 93),
                                      fontSize: 16.0.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 8.h,
                                  ),
                                  Text(
                                    context
                                        .watch<ResultProvider>()
                                        .result[1]
                                        .toStringAsPrecision(3),
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 23.0.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                ]),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(left: 16.0.w, right: 16.0.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'Enable Sterilization',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18.sp,
                              ),
                            ),
                            Switch(
                              value: isSterilization,
                              onChanged: (value) {
                                setState(() {
                                  // Allow switch change only if isSwitchEnabled is true
                                  if (isSterilizationSwitchEnabled) {
                                    isVisible = true;
                                    isSterilization = value;
                                    if (value) {
                                      _startSterilizationTimer();
                                    } else {
                                      // If the switch is turned off, cancel the timer
                                      _sterilizationTimer?.cancel();
                                    }
                                  }
                                });
                              },
                              activeColor:
                                  Colors.blue, // Color when the switch is ON
                              activeTrackColor: const Color.fromARGB(
                                  255,
                                  147,
                                  191,
                                  228), // Track color when the switch is ON
                              inactiveTrackColor: const Color.fromARGB(255, 218,
                                  218, 218), // Color when the switch is OFF
                              inactiveThumbColor: const Color.fromARGB(
                                  255,
                                  174,
                                  174,
                                  174), // Track color when the switch is OFF),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 16.0.w, right: 16.0.w),
                        child: Visibility(
                            visible: isVisible,
                            child: SizedBox(
                              height: 40.h,
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: 16.0.w, right: 16.0.w),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Flexible(
                                      child: Text(
                                        sterilizationRemainingTime > 0
                                            ? 'Time Remaining till the end of Sterilization\n$sterilizationRemainingTime seconds'
                                            : 'Done Sterilization!',
                                        style: const TextStyle(
                                            color: Color.fromARGB(
                                                255, 33, 33, 34)),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 16.0.w, right: 16.0.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'Enable Heating',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18.sp,
                              ),
                            ),
                            Switch(
                              value: isHeating,
                              onChanged: (value) {
                                setState(() {
                                  isHeating = value;
                                });
                              },
                              activeColor:
                                  Colors.blue, // Color when the switch is ON
                              activeTrackColor: const Color.fromARGB(
                                  255,
                                  147,
                                  191,
                                  228), // Track color when the switch is ON
                              inactiveTrackColor: const Color.fromARGB(255, 218,
                                  218, 218), // Color when the switch is OFF
                              inactiveThumbColor: const Color.fromARGB(
                                  255,
                                  174,
                                  174,
                                  174), // Track color when the switch is OFF),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 70.h,
                      ),
                    ],
                  )
                ]),
          ),
        )),
      ),
    );
  }
}
