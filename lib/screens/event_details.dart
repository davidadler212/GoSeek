import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_scale_tap/flutter_scale_tap.dart';

class EventDetails extends StatefulWidget {
  const EventDetails({Key? key}) : super(key: key);

  @override
  State<EventDetails> createState() => _EventDetailsState();
}

class _EventDetailsState extends State<EventDetails> with SingleTickerProviderStateMixin {
  final List<String> _firstEventAtendees = ["Hannah", "Cole", "Sandra", "Ron", "Dan", "Alessandra", "Margaret", "Michael"];
  final List<String> _allEventAtendees = ["Hannah", "Cole", "Sandra", "Ron", "Dan", "Alessandra", "Margaret", "Michael", "Hannah", "Cole", "Sandra", "Ron", "Dan", "Alessandra", "Margaret", "Michael"];
  bool _showAllParticipants = false;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xfffcfdff),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        leading: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(CupertinoIcons.back),
            color: const Color(0xff101010),
          ),
        ),
      ),
      body: Stack(
          children: [
            Stack(
              children: [
                Container(
                  width: screenWidth,
                  height: 350.0,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: ExactAssetImage(
                          "assets/images/dalle.jpeg",
                        ),
                        fit: BoxFit.cover
                    ),
                  ),
                ),
                Container(
                  width: screenWidth,
                  height: 350.0,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: <Color>[
                        const Color(0xfffcfdff).withOpacity(0),
                        const Color(0xfffcfdff),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: <Color>[
                      const Color(0xfffcfdff).withOpacity(0),
                      const Color(0xfffcfdff),
                      const Color(0xfffcfdff),
                      const Color(0xfffcfdff),
                      const Color(0xfffcfdff),
                    ],
                  ),
                ),
                child: Stack(
                    children: [
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25.0,),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const SizedBox(height: 200.0,),
                              const Text(
                                '80s themed dorm party',
                                style: TextStyle(
                                  fontSize: 22,
                                  color: Color(0xff101010),
                                  fontWeight: FontWeight.w700,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 31.0,),
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10.0),
                                child: Text(
                                  'My roommate and I are throwing a party to meet other students around campus! Come to our place dressed in your favorite 1980s outfit, inspired by the new Stranger Things Season :)',
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: Color(0xff101010),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 17.0,),
                              Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: const Color(0xfff5f5f7),
                                      borderRadius: BorderRadius.circular(40.0),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 27.0, vertical: 23.0,),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: const [
                                              Text.rich(
                                                TextSpan(
                                                  style: TextStyle(
                                                    fontSize: 17,
                                                    color: Color(0xff101010),
                                                  ),
                                                  children: [
                                                    TextSpan(
                                                      text: 'When: ',
                                                      style: TextStyle(
                                                        fontWeight: FontWeight.w600,
                                                      ),
                                                    ),
                                                    TextSpan(
                                                      text: 'Thursday at 8 PM',
                                                    ),
                                                  ],
                                                ),
                                                textAlign: TextAlign.start,
                                              ),
                                              SizedBox(height: 18.0,),
                                              Text.rich(
                                                style: TextStyle(
                                                  fontSize: 17,
                                                  color: Color(0xff101010),
                                                ),
                                                TextSpan(
                                                  children: [
                                                    TextSpan(
                                                      text: 'Where: ',
                                                      style: TextStyle(
                                                        fontWeight: FontWeight.w600,
                                                      ),
                                                    ),
                                                    TextSpan(
                                                      text: 'Greenwich Village\n(About 1 mile away)',
                                                    ),
                                                  ],
                                                ),
                                                textAlign: TextAlign.start,
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 6.0,),
                                          const SizedBox(
                                            child: Text(
                                              'Exact location will be shown after invitation is approved',
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: Color(0xff707070),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(height: 12.0,),
                                          Center(
                                            child: Stack(
                                              alignment: Alignment.center,
                                              children: [
                                                ClipRRect(
                                                  borderRadius: const BorderRadius.all(Radius.circular(40.0)),
                                                  child: Container(
                                                    color: Colors.green,
                                                    width: 334.0,
                                                    height: 230.0,
                                                  ),
                                                ),
                                                Container(
                                                  width: 73.0,
                                                  height: 73.0,
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius: const BorderRadius.all(Radius.elliptical(36.5, 36.5)),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Colors.black.withOpacity(0.2),
                                                        blurRadius: 15,
                                                      ),
                                                    ],
                                                  ),
                                                  child: const Icon(
                                                    CupertinoIcons.location_solid,
                                                    size: 40.0,
                                                    color: Colors.redAccent,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(height: 18.0,),
                                          const Text.rich(
                                            TextSpan(
                                              style: TextStyle(
                                                fontSize: 17,
                                                color: Color(0xff101010),
                                              ),
                                              children: [
                                                TextSpan(
                                                  text: 'Price: ',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                                TextSpan(
                                                  text: '\$15',
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(height: 6.0,),
                                          const SizedBox(
                                            child: Text(
                                              'Pay in person with cash or digital payment service',
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: Color(0xff707070),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 17.0,),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                child: Column(
                                  children: [
                                    Column(
                                      children: [
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            const Icon(
                                              CupertinoIcons.checkmark,
                                              size: 14.0,
                                            ),
                                            SizedBox(
                                              width: screenWidth-84,
                                              child: const Text(
                                                " Organizer's identity is verified",
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  color: Color(0xff101010),
                                                  height: 1.15,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 5.0,),
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            const Icon(
                                              CupertinoIcons.checkmark,
                                              size: 14.0,
                                            ),
                                            SizedBox(
                                              width: screenWidth-84,
                                              child: const Text(
                                                " Organizer hosted 3 events in the past",
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  color: Color(0xff101010),
                                                  height: 1.15,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 5.0,),
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            const Icon(
                                              CupertinoIcons.checkmark,
                                              size: 14.0,
                                            ),
                                            SizedBox(
                                              width: screenWidth-84,
                                              child: const Text(
                                                " 95% of guests had a positive experience with Hannah",
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  color: Color(0xff101010),
                                                  height: 1.15,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 20.0,),
                                    const Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        'Attendees',
                                        style: TextStyle(
                                          fontFamily: 'SF Pro',
                                          fontSize: 18,
                                          color: Color(0xff101010),
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 12.0,),
                                    Stack(
                                      alignment: Alignment.bottomCenter,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(bottom: 10.0,),
                                          child: _showAllParticipants ?
                                          Wrap(
                                            children: [
                                              for (int i = 0; i < _allEventAtendees.length; i++)
                                                Padding(
                                                  padding: const EdgeInsets.all(6),
                                                  child: Column(
                                                    children: [
                                                      ClipRRect(
                                                        borderRadius: BorderRadius.circular(40.0),
                                                        child: Container(
                                                          color: Colors.blue,
                                                          width: 74.0,
                                                          height: 74.0,
                                                        ),
                                                      ),
                                                      const Text(
                                                        'Hannah\n(Host)',
                                                        style: TextStyle(
                                                          fontSize: 14,
                                                          color: Color(0xff101010),
                                                        ),
                                                        textAlign: TextAlign.center,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                            ],
                                          ) :
                                          Wrap(
                                            children: [
                                              for (int i = 0; i < _firstEventAtendees.length; i++)
                                                Padding(
                                                  padding: const EdgeInsets.all(6),
                                                  child: Column(
                                                    children: [
                                                      ClipRRect(
                                                        borderRadius: BorderRadius.circular(40.0),
                                                        child: Container(
                                                          color: Colors.blue,
                                                          width: 74.0,
                                                          height: 74.0,
                                                        ),
                                                      ),
                                                      const Text(
                                                        'Hannah\n(Host)',
                                                        style: TextStyle(
                                                          fontSize: 14,
                                                          color: Color(0xff101010),
                                                        ),
                                                        textAlign: TextAlign.center,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                            ],
                                          ),
                                        ),
                                        _showAllParticipants ? Container() : Container(
                                          width: screenWidth,
                                          height: 158.0,
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                              begin: Alignment.topCenter,
                                              end: Alignment.bottomCenter,
                                              colors: <Color>[
                                                const Color(0xfffcfdff).withOpacity(0),
                                                const Color(0xfffcfdff),
                                              ],
                                            ),
                                          ),
                                        ),
                                        ScaleTap(
                                          onPressed: () {
                                            setState(() {
                                              _showAllParticipants = true;
                                            });
                                          },
                                          child: _showAllParticipants ? Container() : Container(
                                            width: 96.0,
                                            height: 41.0,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.circular(40.0),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black.withOpacity(0.2),
                                                  blurRadius: 15,
                                                ),
                                              ],
                                            ),
                                            child: const Center(
                                              child: Text(
                                                '12 more',
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  color: Color(0xff101010),
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    _showAllParticipants ? const SizedBox(height: 50.0,) : const SizedBox(height: 70.0,),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ]
                ),
              ),
            ),
          ]
      ),
    );
  }
}
