import 'dart:io' show Platform;
import 'package:dotted_border/dotted_border.dart';
import 'package:events_app/screens/add_interest.dart';
import 'package:events_app/screens/settings_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_scale_tap/flutter_scale_tap.dart';

String userDescription = "Born in Venice, Italy 🇮🇹\nMoved to NYC to study Photography at NYU and looking to meet new people with similar interests. Let\'s hang out and get to know each other!";
List<String> userInterests = ["🎾Tennis", "💻Coding", "🎥Sci-fi", "📷Photography", "🎥Drama", "📚Fantasy", "⛷Skiing",  "🎸Guitar", "📚Fiction"];
List<String> userPhotos = ["1.dga",  "2.dga", "3.dga"];

class YourProfile extends StatefulWidget {
  const YourProfile({Key? key}) : super(key: key);

  @override
  State<YourProfile> createState() => _YourProfileState();
}

class _YourProfileState extends State<YourProfile> {
  bool _editProfile = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
          alignment: Alignment.topRight,
          children: [
            Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 65.0,),
                    ClipOval(
                      child: Image.asset(
                        "assets/images/image_1.jpeg",
                        width: 120.0,
                      ),
                    ),
                    const SizedBox(height: 7.0,),
                    const Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: "Lea",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w700,
                              color: Color(0xff101010),
                            ),
                          ),
                          TextSpan(
                            text: "  26",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff101010),
                            ),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 25.0,),
                    ScaleTap(
                      onPressed: () {
                        HapticFeedback.heavyImpact();
                        setState(() {
                          _editProfile = !_editProfile;
                        });
                      },
                      child: Container(
                        width: 109.0,
                        height: 29.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: const BorderRadius.all(Radius.circular(13.0)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.12),
                              blurRadius: 20.0,
                            ),
                          ],
                        ),
                        child: Center(
                          child: Text(
                            _editProfile ? "Save edits" : "Edit profile",
                            style: const TextStyle(
                              fontSize: 14,
                              color: Color(0xff101010),
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                    !_editProfile ? const ShowYourProfileContents() : const EditYourProfileContents(),
                  ],
                )
            ),
            ScaleTap(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SettingsPage()),
                );
              },
              child: const Padding(
                padding: EdgeInsets.only(top: 65.0, right: 35,),
                child: Icon(
                  CupertinoIcons.gear,
                  color: Color.fromRGBO(40, 40, 40, 1),
                  size: 30.0,
                ),
              ),
            ),
          ]
      ),
    );
  }
}


// DISPLAY PROFILE
class ShowYourProfileContents extends StatelessWidget {
  const ShowYourProfileContents({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> userPhotos = ["1.dga",  "2.dga", "3.dga"];

    return Column(
        children: [
          const SizedBox(height: 25.0,),
          SizedBox(
            width: 336.0,
            child: Text(
              userDescription,
              style: const TextStyle(
                fontFamily: 'SF Pro',
                fontSize: 17,
                color: Color(0xff101010),
              ),
              textAlign: TextAlign.left,
            ),
          ),
          const SizedBox(
            height: 32.0,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Interests',
                  style: TextStyle(
                    fontSize: 18,
                    color: Color(0xff101010),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 12.0,),
                SizedBox(
                  width: 348.0,
                  child: Wrap(
                    children: [
                      for (int i = 0; i <= userInterests.length-1; i++)
                        Padding(
                          padding: const EdgeInsets.only(right: 12.0, bottom: 12.0,),
                          child: Container(
                            height: 41.0,
                            decoration: BoxDecoration(
                              color: const Color(0xFFF2F2F2),
                              borderRadius: BorderRadius.circular(40.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 7, left: 11.0, right: 11.0),
                              child: Text(
                                userInterests[i],
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Color(0xff7e7e7e),
                                ),
                                textAlign: TextAlign.center,
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
          const SizedBox(
            height: 24.0,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Photos',
                  style: TextStyle(
                    fontSize: 18,
                    color: Color(0xff101010),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 12.0,),
                SizedBox(
                  width: 346.0,
                  child: Wrap(
                    children: [
                      for (int i = 0; i <= userPhotos.length-1; i++)
                        ScaleTap(
                          scaleMinValue: 0.95,
                          onPressed: () {},
                          child: Padding(
                            padding: const EdgeInsets.only(right: 10.0, bottom: 10.0,),
                            child: ClipRRect(
                              borderRadius: const BorderRadius.all(Radius.circular(25.0)),
                              child: Container(
                                width: 163.0,
                                height: 163.0,
                                color: Colors.blueGrey[300],
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                const SizedBox(height: 5.0,),
              ],
            ),
          ),
          const SizedBox(height: 25.0,),
        ]
    );
  }
}


// EDIT PROFILE
class EditYourProfileContents extends StatefulWidget {
  const EditYourProfileContents({Key? key}) : super(key: key);

  @override
  State<EditYourProfileContents> createState() => _EditYourProfileContentsState();
}

class _EditYourProfileContentsState extends State<EditYourProfileContents> {
  FocusNode? bioFocusNode;

  @override
  void initState() {
    super.initState();
    bioFocusNode = FocusNode();
  }

  @override
  void dispose() {
    bioFocusNode!.dispose();
    super.dispose();
  }

  void _requestFocus(){
    setState(() {
      FocusScope.of(context).requestFocus(bioFocusNode);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 25.0,),
          DottedBorder(
            color: bioFocusNode!.hasFocus ? const Color(0xFF106BAD) : const Color(0xFF707070),
            borderType: BorderType.RRect,
            radius: const Radius.circular(24.0),
            strokeWidth: 3,
            padding: EdgeInsets.zero,
            dashPattern: bioFocusNode!.hasFocus ? const [double.infinity, double.infinity] : const [7,7],
            child: Container(
              width: 378.0,
              decoration: BoxDecoration(
                color: const Color(0xfff5f5f7),
                borderRadius: BorderRadius.circular(24.0),
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10.0, 7.0, 10.0, 10.0,),
                  child: SizedBox(
                    width: 336.0,
                    child: TextFormField(
                      focusNode: bioFocusNode,
                      initialValue: userDescription,
                      minLines: 1,
                      maxLines: 10,
                      onTap: _requestFocus,
                      onChanged: (val) {
                        userDescription = val;
                      },
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        isDense: true,
                        contentPadding: EdgeInsets.only(),
                      ),
                      style: const TextStyle(
                        fontFamily: 'SF Pro',
                        fontSize: 17,
                        color: Color(0xff101010),
                      ),
                      keyboardType: TextInputType.multiline,
                    ),

                    // Text(
                    //   'Born in Venice, Italy 🇮🇹\nMoved to NYC to study Photography at NYU and looking to meet new people with similar interests. Let\'s hang out and get to know each other!',
                    //   style: TextStyle(
                    //     fontFamily: 'SF Pro',
                    //     fontSize: 17,
                    //     color: Color(0xff101010),
                    //   ),
                    //   textAlign: TextAlign.left,
                    // ),
                  ),
                ),
              ),
            ),
          ),
          if (bioFocusNode!.hasFocus) Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
                HapticFeedback.lightImpact();
              },
              child: Container(
                width: 109.0,
                height: 29.0,
                decoration: BoxDecoration(
                  color: const Color(0xFF106BAD),
                  borderRadius: const BorderRadius.all(Radius.circular(13.0)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.12),
                      blurRadius: 20.0,
                    ),
                  ],
                ),
                child: const Center(
                  child: Text(
                    "Done",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 12.0,
          ),
          DottedBorder(
            color: const Color(0xFF707070),
            borderType: BorderType.RRect,
            radius: const Radius.circular(24.0),
            strokeWidth: 3,
            padding: EdgeInsets.zero,
            dashPattern: const [7,7],
            child: Container(
              width: 378.0,
              decoration: BoxDecoration(
                color: const Color(0xfff5f5f7),
                borderRadius: BorderRadius.circular(24.0),
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 2.0,),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Interests',
                        style: TextStyle(
                          fontSize: 18,
                          color: Color(0xff101010),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 12.0,),
                      SizedBox(
                        width: 336.0,
                        child: Wrap(
                          children: [
                            for (int i = 0; i <= userInterests.length-1; i++)
                              ScaleTap(
                                onPressed: () {
                                  HapticFeedback.lightImpact();
                                  setState(() {
                                    if (userInterests.length > 3) {
                                      userInterests.remove(userInterests[i]);
                                    } else {
                                      showDialog(
                                          context: context,
                                          barrierDismissible: false,
                                          builder: ((context) {
                                            if (Platform.isIOS) {
                                              return CupertinoAlertDialog(
                                                title: const Text(
                                                    "Come on!"
                                                ),
                                                content: const Text(
                                                    "I'm sure you have at least 3 interests."
                                                ),
                                                actions: [
                                                  CupertinoDialogAction(
                                                      onPressed: () {
                                                        Navigator.of(context).pop(false);
                                                      },
                                                      child: const Text("I'm an interesting person")
                                                  ),
                                                ],
                                              );
                                            } else {
                                              return AlertDialog(
                                                title: const Text(
                                                    "Come on!"
                                                ),
                                                content: const Text(
                                                    "I'm sure you have at least 3 interests."
                                                ),
                                                actions: [
                                                  TextButton(
                                                      onPressed: () {
                                                        Navigator.of(context).pop(false);
                                                      },
                                                      child: const Text("I'm an interesting person")
                                                  ),
                                                ],
                                              );
                                            }
                                          }));
                                    }
                                  });
                                },
                                child: Stack(
                                    alignment: Alignment.topRight,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(right: 12.0, bottom: 12.0,),
                                        child: Container(
                                          height: 41.0,
                                          decoration: BoxDecoration(
                                            color: const Color(0xfff5f5f7),
                                            borderRadius: BorderRadius.circular(40.0),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black.withOpacity(0.16),
                                                blurRadius: 17.0,
                                              ),
                                            ],
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.only(top: 7, left: 11.0, right: 11.0),
                                            child: Text(
                                              userInterests[i],
                                              style: const TextStyle(
                                                fontSize: 14,
                                                color: Color(0xff7e7e7e),
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(right: 5.0),
                                        child: Icon(
                                          CupertinoIcons.minus_circle_fill,
                                          size: 18.0,
                                          color: Color(0xFFD54141),
                                        ),
                                      ),
                                      // Stack(
                                      //   alignment: Alignment.topLeft,
                                      //     children: [
                                      //       Padding(
                                      //         padding: const EdgeInsets.only(
                                      //           left: 3.0,
                                      //           top: 7.0,
                                      //         ),
                                      //         child: Container(
                                      //           width: 11.5,
                                      //           height: 5.0,
                                      //           color: Colors.black,
                                      //         ),
                                      //       ),
                                      //       Padding(
                                      //         padding: const EdgeInsets.only(right: 5.0),
                                      //         child: Icon(
                                      //           CupertinoIcons.minus_circle_fill,
                                      //           size: 18.0,
                                      //           color: Colors.grey.shade400,
                                      //         ),
                                      //       ),
                                      //     ],
                                      // ),
                                    ]
                                ),
                              ),
                            ScaleTap(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                    builder: (context) => AddInterest(
                                      updateUserInterests: () {
                                        setState(() {
                                          // COLOCAR COISA AQUI PRA PEGAR INTERESTS DO FIREBASE
                                        });
                                      },
                                      oldUserInterests: userInterests,
                                    ),
                                  ),
                                );
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(right: 12.0, bottom: 12.0,),
                                child: Container(
                                  height: 41.0,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(40.0),
                                    border: Border.all(width: 1.0, color: const Color(0xff707070)),
                                  ),
                                  child: const Padding(
                                    padding: EdgeInsets.only(top: 12, left: 11.0, right: 11.0),
                                    child: Text(
                                      "Add interest",
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Color(0xff7e7e7e),
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
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
          const SizedBox(
            height: 12.0,
          ),
          DottedBorder(
            color: const Color(0xFF707070),
            borderType: BorderType.RRect,
            radius: const Radius.circular(24.0),
            strokeWidth: 3,
            padding: EdgeInsets.zero,
            dashPattern: const [7,7],
            child: Container(
              width: 378.0,
              decoration: BoxDecoration(
                color: const Color(0xfff5f5f7),
                borderRadius: BorderRadius.circular(24.0),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 2.0,),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Photos',
                          style: TextStyle(
                            fontSize: 18,
                            color: Color(0xff101010),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 12.0,),
                        SizedBox(
                          width: 346.0,
                          child: Wrap(
                            children: [
                              for (int i = 0; i <= userPhotos.length-1; i++)
                                ScaleTap(
                                  scaleMinValue: 0.95,
                                  onPressed: () {},
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 10.0, bottom: 10.0,),
                                    child: Container(
                                      width: 163.0,
                                      height: 163.0,
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(Radius.circular(25.0)),
                                        color: Colors.blueGrey[300],
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black.withOpacity(0.16),
                                            blurRadius: 30.0,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ScaleTap(
                                scaleMinValue: 0.95,
                                onPressed: () {},
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 10.0, bottom: 10.0,),
                                  child: Container(
                                    width: 163.0,
                                    height: 163.0,
                                    decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(Radius.circular(25.0)),
                                      color: Colors.white,
                                      border: Border.all(width: 1.0, color: const Color(0xff707070)),
                                    ),
                                    child: const Icon(
                                      CupertinoIcons.plus,
                                      size: 35.0,
                                      color: Color(0xFF9B9B9B),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 5.0,),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 25.0,),
        ]
    );
  }
}
