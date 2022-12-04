import 'package:flutter/material.dart';
import 'package:flutter_scale_tap/flutter_scale_tap.dart';

class Attending extends StatelessWidget {
  const Attending({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 27.0, top: 28.0),
            child: Text(
              'Attending soon',
              style: TextStyle(
                fontSize: 18.0,
                color: Color(0xff101010),
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 2,
            padding: const EdgeInsets.only(top: 15.0),
            itemBuilder: (context, index) {
              return ScaleTap(
                scaleMinValue: 0.95,
                onPressed: () {},
                child: Padding(
                  padding: const EdgeInsets.only(left: 17.0, right: 17.0, bottom: 15.0),
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
                        height: 121.0,
                        color: Colors.white,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 178.0,
                              height: 121.0,
                              color: Colors.blue[800],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15.0, top: 11.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children:  const [
                                      SizedBox(
                                        width: 189.0,
                                        child: Text(
                                          '80s themed house party',
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Color(0xff101010),
                                            fontWeight: FontWeight.w500,
                                            height: 1.0,
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 4.0,),
                                      SizedBox(
                                        width: 180.0,
                                        child: Text(
                                          'Tomorrow, 8 PM',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Color(0xff101010),
                                            fontWeight: FontWeight.w400,
                                          ),
                                          softWrap: false,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(bottom: 11.0),
                                    child: SizedBox(
                                      width: 180.0,
                                      child: Text(
                                        '25 Union Square W \nNew York, NY 10003',
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Color(0xff101010),
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
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
              );
            }
          ),
          const Padding(
            padding: EdgeInsets.only(left: 27.0, top: 25.0),
            child: Text(
              'Pending invitations',
              style: TextStyle(
                fontSize: 18.0,
                color: Color(0xff101010),
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 3,
              padding: const EdgeInsets.only(top: 15.0),
              itemBuilder: (context, index) {
                return ScaleTap(
                  scaleMinValue: 0.95,
                  onPressed: () {},
                  child: Padding(
                    padding: const EdgeInsets.only(left: 17.0, right: 17.0, bottom: 15.0),
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
                          height: 121.0,
                          color: Colors.white,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 178.0,
                                height: 121.0,
                                color: Colors.blue[800],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 15.0, top: 11.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: const [
                                        SizedBox(
                                          width: 183.0,
                                          child: Text(
                                            '80s themed house party',
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: Color(0xff101010),
                                              fontWeight: FontWeight.w500,
                                              height: 1.0,
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 4.0,),
                                        SizedBox(
                                          width: 180.0,
                                          child: Text(
                                            'Tomorrow, 8 PM',
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Color(0xff101010),
                                              fontWeight: FontWeight.w400,
                                            ),
                                            softWrap: false,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(bottom: 11.0),
                                      child: SizedBox(
                                        width: 180.0,
                                        child: Text(
                                          '25 Union Square W \nNew York, NY 10003',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Color(0xff101010),
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
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
                );
              }
          ),
        ],
      ),
    );
  }
}
