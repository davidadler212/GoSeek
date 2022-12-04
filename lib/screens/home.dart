import 'package:events_app/screens/event_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_scale_tap/flutter_scale_tap.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> events = List.generate(10, (index) => "Banana $index");

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFFFCFDFF),
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 60.0,),
            const Padding(
              padding: EdgeInsets.only(left: 31.0),
              child: Text(
                'Hey, Leo 👋',
                style: TextStyle(
                  fontSize: 22,
                  color: Color(0xff101010),
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const SizedBox(height: 11.0,),
            Padding(
              padding: const EdgeInsets.only(left: 31.0),
              child: Row(
                children: const [
                  Icon(CupertinoIcons.location_fill, size: 14.0,),
                  Text(" 140 E 14th St, New York, NY", style: TextStyle(color: Color(0xFF7E7E7E)),),
                ],
              ),
            ),
            const SizedBox(height: 35.0,),
            const Padding(
              padding: EdgeInsets.only(left: 17.0),
              child: Text(
                'Happening around you',
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xff101010),
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const SizedBox(height: 12.0,),
            Expanded(
              child: SingleChildScrollView(
                child: Center(
                  child: Column(
                    children: [
                      const SizedBox(height: 12.0,),
                      Wrap(
                        children: [
                          for (int i = 0; i < events.length; i++)
                            ScaleTap(
                              scaleMinValue: 0.95,
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                    builder: (context) {
                                      return const EventDetails();
                                    },
                                  ),
                                );
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(Radius.circular(13.0)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.17),
                                        blurRadius: 15.0,
                                      ),
                                    ],
                                  ),
                                  child: ClipRRect(
                                    borderRadius: const BorderRadius.all(Radius.circular(13.0)),
                                    child: Container(
                                      width: 186.0,
                                      height: 225.0,
                                      color: Colors.white,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: 186.0,
                                            height: 112.0,
                                            color: Colors.blue[800],
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 14.0),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              mainAxisAlignment: MainAxisAlignment.end,
                                              children: [
                                                const SizedBox(height: 13.0,),
                                                const SizedBox(
                                                  width: 155.0,
                                                  child: Text(
                                                    '80s themed house party',
                                                    style: TextStyle(
                                                      fontSize: 16.0,
                                                      fontWeight: FontWeight.w500,
                                                      color: Color(0xff101010),
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(height: 8.0,),
                                                const Text(
                                                  'Tomorrow, 8 PM',
                                                  style: TextStyle(
                                                    fontSize: 14.0,
                                                    fontWeight: FontWeight.w400,
                                                    color: Color(0xff101010),
                                                  ),
                                                ),
                                                const SizedBox(height: 8.0,),
                                                Row(
                                                  children: [
                                                    Row(
                                                      children: const [
                                                        Icon(CupertinoIcons.location, color: Color(0xff7e7e7e), size: 14.0,),
                                                        Text(
                                                          ' 7 min away',
                                                          style: TextStyle(
                                                            fontSize: 14.0,
                                                            color: Color(0xff7e7e7e),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    const SizedBox(width: 60,),
                                                    const Text(
                                                      "\$",
                                                      style: TextStyle(
                                                        color: Color(0xff7e7e7e),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                          ),
                            )
                        ],
                      ),
                      const SizedBox(height: 10.0,),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      // bottomNavigationBar: ,
    );
  }
}
