import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int currentTab = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text(
            'ZaBoteru',
            style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  fontSize: 28.0,
                ),
          ),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.notifications, color: Colors.white, size: 28,),
              onPressed: () {
                // Navigate to the 'notification' page here
                Navigator.pushNamed(context, '/notification');
              },
            ),
            IconButton(
              icon: const Icon(Icons.settings, color: Colors.white, size: 28,),
              onPressed: () {
                // Navigate to the 'settings' page here
                Navigator.pushNamed(context, '/settings');
              },
            ),
          ],
        ),
        body: const Center(
          child: DashboardContent(),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.blue,
          shape: const CircleBorder(),
          child: const Icon(Icons.bluetooth, color: Colors.white, size: 28,),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          color: Colors.white,
          shape: const CircularNotchedRectangle(),
          notchMargin: 8,
          // ignore: sized_box_for_whitespace
          child: Container(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MaterialButton(
                      padding: const EdgeInsets.only(right: 7.0),
                      minWidth: 40,
                      onPressed: () {
                        Navigator.pushNamed(context, '/dashbpard');
                        // setState(() {
                        //   currentTab = 0;
                        // });
                      },
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.dashboard,
                          color: Colors.blue,
                          // color: currentTab == 0 ? Colors.blue: Colors.grey,
                          ),
                          Text(
                            'Dashboard',
                            style: TextStyle(
                              // color: currentTab == 0 ? Colors.blue : Colors.grey,
                              ),
                          )
                        ],
                      ),
                    ),
                    MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        Navigator.pushNamed(context, '/statistics');
                        // setState(() {
                        //   currentTab = 1;
                        // });
                      },
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.pie_chart,
                          color: Colors.blue,
                          // color: currentTab == 1 ? Colors.blue: Colors.grey,
                          ),
                          Text(
                            'Statistics',
                            style: TextStyle(
                              // color: currentTab == 1 ? Colors.blue : Colors.grey,
                              ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MaterialButton(
                      padding: const EdgeInsets.only(right: 29.0),
                      minWidth: 40,
                      onPressed: () {
                        Navigator.pushNamed(context, '/intake');
                        // setState(() {
                        //   currentTab = 2;
                        // });
                      },
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.water,
                          color: Colors.blue,
                          // color: currentTab == 2 ? Colors.blue: Colors.grey,
                          ),
                          Text(
                            'Intake',
                            style: TextStyle(
                              // color: currentTab == 2 ? Colors.blue : Colors.grey,
                              ),
                          )
                        ],
                      ),
                    ),
                    MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        Navigator.pushNamed(context, '/intake');
                        // setState(() {
                        //   currentTab = 3;
                        // });
                      },
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.water,
                          color: Colors.blue,
                          // color: currentTab == 3 ? Colors.blue: Colors.grey,
                          ),
                          Text(
                            'Intake',
                            style: TextStyle(
                              // color: currentTab == 3 ? Colors.blue : Colors.grey,
                              ),
                          )
                        ],
                      ),
                    ),
                  ],
                )
              ],
            )
          ),
        ),
      ),
    );
  }
}

double _volume = 0.0;

class DashboardContent extends StatefulWidget {
  const DashboardContent({super.key});

  @override
  State<DashboardContent> createState() => _DashboardContentState();
}

class _DashboardContentState extends State<DashboardContent> {

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        IconButton(
          icon: const Icon(Icons.volume_up),
          tooltip: 'Increase volume by 10',
          onPressed: () {
            setState(() {
              _volume += 10;
            });
          },
        ),
        Text('Volume : $_volume'),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            elevation: 4,
          ),
          child: const Text(
            'Send notification',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            elevation: 4,
          ),
          child: const Text(
            'Create notification',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
                ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            elevation: 4,
          ),
          child: const Text(
            'Schedule',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}