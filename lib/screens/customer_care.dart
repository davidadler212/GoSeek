import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomerCare extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFFAA7EFF), Color(0xFF7C81FF)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: TooltipVisibility(
        visible: false,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            systemOverlayStyle: SystemUiOverlayStyle.light,
            iconTheme: const IconThemeData(
              color: Color(0xFFFFFFFF),
            ),
            title: const Text(
              'contact us',
              style: TextStyle(
                color: Color(0xFFFFFFFF),
                fontWeight: FontWeight.bold,
                fontSize: 17.0,
              ),
            ),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0.0,
          ),
          body: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 25.0,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 21.0, bottom: 4.0),
                            child: Text(
                              "problems with your order? ",
                              // textAlign: TextAlign.right,
                              style: TextStyle(
                                fontSize: 17.0,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          ClipRRect(
                            borderRadius: const BorderRadius.all(Radius.circular(30.0),),
                            child: Container(
                              // margin: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
                              width: size.width*0.9,
                              height: 300,
                              color: const Color(0xFFFAFAFA),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 25.0,),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
