import 'package:events_app/screens/navbar_pages/events/attending.dart';
import 'package:events_app/screens/navbar_pages/events/history.dart';
import 'package:events_app/screens/navbar_pages/events/hosting.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Events extends StatefulWidget {
  const Events({Key? key}) : super(key: key);

  @override
  _EventsState createState() => _EventsState();
}

class _EventsState extends State<Events> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          body: AnnotatedRegion<SystemUiOverlayStyle>(
            value: SystemUiOverlayStyle.dark,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                SizedBox(height: 60.0,),
                Padding(
                  padding: EdgeInsets.only(left: 31.0),
                  child: Text(
                    'Your events',
                    style: TextStyle(
                      fontSize: 22,
                      color: Color(0xff101010),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                TabBar(
                  indicatorColor: Color(0xFF101010),
                  labelColor: Color(0xFF101010),
                  unselectedLabelColor: Color(0xFF7E7E7E),
                  indicatorSize: TabBarIndicatorSize.label,
                  indicatorWeight: 1.0,
                  // labelPadding: EdgeInsets.all(0),
                  padding: EdgeInsets.only(top: 20.0, bottom: 5.0),
                  indicatorPadding: EdgeInsets.only(bottom: 8.0),
                  tabs: [
                    Tab(
                      child: Text(
                        "Attending",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Tab(
                      child: Text(
                        "Hosting",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Tab(
                      child: Text(
                        "History",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      Attending(),
                      Hosting(),
                      History(),
                    ]
                  ),
                ),
              ],
            ),
          ),
      ),
    );
  }
}
