import 'package:flutter/material.dart';
import 'package:flutter_scale_tap/flutter_scale_tap.dart';

class History extends StatelessWidget {
  const History({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> events = List.generate(10, (index) => "Banana $index");

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 27.0, top: 28.0),
            child: Text(
              'Past events',
              style: TextStyle(
                fontSize: 18.0,
                color: Color(0xff101010),
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const SizedBox(height: 7.0,),
          Center(
            child: Column(
              children: [
                Wrap(
                  children: [
                    for (var i in events)
                      ScaleTap(
                        scaleMinValue: 0.95,
                        onPressed: () {},
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
                                height: 201.0,
                                color: Colors.white,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 186.0,
                                      height: 112.0,
                                      color: Colors.grey,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 14.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: const [
                                          SizedBox(height: 13.0,),
                                          SizedBox(
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
                                          SizedBox(height: 8.0,),
                                          Text(
                                            'You hosted - 10/29/22',
                                            style: TextStyle(
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.w400,
                                              color: Color(0xff101010),
                                            ),
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
        ],
      ),
    );
  }
}
