import 'dart:io';

import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_scale_tap/flutter_scale_tap.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:intl/intl.dart';

DateTime currentDateTime = DateTime.now();

String eventDescription = "";
String eventTitle = "";
String eventLocation = "";
bool eventIsNotFree = false;
String eventPrice = "";
bool imageWasSelected = false;
DateTime? eventDate;
bool dateWillBeFirstTap = true; // true if it's the user hasn't tapped on the "Choose date" button

class CreateEvent extends StatefulWidget {
  const CreateEvent({Key? key}) : super(key: key);

  @override
  State<CreateEvent> createState() => _CreateEventState();
}

class _CreateEventState extends State<CreateEvent> {
  FocusNode? priceFocusNode;

  @override
  void initState() {
    super.initState();
    priceFocusNode = FocusNode();

    // If all of these fields are empty, the user could still have draft saved but it was lost from the variables
    // because they closed the app or something else, so check in the database if there's a draft saved
    if (eventDescription == "" &&
        eventTitle == "" &&
        eventLocation == "" &&
        eventDate == null &&
        eventIsNotFree == false &&
        eventPrice == ""
    ) {
      /// GET DRAFT DATA FROM DATABASE
    }
  }

  @override
  void dispose() {
    priceFocusNode!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    PageController controller = PageController();
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    // Only allow to go to the next page if all required fields are set
    bool filledRequiredFields =
        eventDescription != "" &&
        eventTitle != "" &&
        eventLocation != "" &&
        eventDate != null &&
        eventIsNotFree == true &&
        eventPrice != "0.00" &&
        eventPrice != ""
        ||
        eventDescription != "" &&
        eventTitle != "" &&
        eventLocation != "" &&
        eventDate != null &&
        eventIsNotFree == false;

    return PageView(
      physics: filledRequiredFields ? const ClampingScrollPhysics() : const NeverScrollableScrollPhysics(),
      onPageChanged: (pageIndex) {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }

        filledRequiredFields =
            eventDescription != "" &&
            eventTitle != "" &&
            eventLocation != "" &&
            eventDate != null &&
            eventIsNotFree == true &&
            eventPrice != "0.00" &&
            eventPrice != ""
            ||
            eventDescription != "" &&
            eventTitle != "" &&
            eventLocation != "" &&
            eventDate != null &&
            eventIsNotFree == false;

        if (!filledRequiredFields) {
          controller.jumpTo(0);
        }

        if (pageIndex == 0) {
          setState(() {
            filledRequiredFields = false;
          });
        } else {
          setState(() {
            filledRequiredFields = true;
          });
        }
      },
      controller: controller,
      children: [
        GestureDetector(
          onTap: () {
            FocusScopeNode currentFocus = FocusScope.of(context);
            if (!currentFocus.hasPrimaryFocus) {
              currentFocus.unfocus();
            }
          },
          child: Scaffold(
            backgroundColor: const Color(0xfffcfdff),
            appBar: AppBar(
              backgroundColor: const Color(0xfffcfdff),
              elevation: 0.0,
              leading: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: IconButton(
                  onPressed: () {
                    if (eventDescription == "" &&
                        eventTitle == "" &&
                        eventLocation == "" &&
                        eventDate == null &&
                        eventIsNotFree == false &&
                        eventPrice == ""
                    ) {
                      Navigator.of(context).pop();
                    } else {
                      showDialog(
                        context: context,
                        builder: ((context) {
                          if (Platform.isIOS) {
                            return CupertinoAlertDialog(
                              title: const Text("Save draft?"),
                              content: const Text(
                                  "You can save and continue creating the event later."),
                              actions: [
                                CupertinoDialogAction(
                                    onPressed: () {
                                      eventDescription = "";
                                      eventTitle = "";
                                      eventLocation = "";
                                      eventDate = null;
                                      eventIsNotFree = false;
                                      eventPrice = "";
                                      Navigator.of(context).popUntil((route) => route.isFirst);
                                    },
                                    child: const Text('Discard')),
                                CupertinoDialogAction(
                                    isDefaultAction: true,
                                    onPressed: () {
                                      Navigator.of(context).popUntil((route) => route.isFirst);
                                    },
                                    child: const Text('Save')),
                              ],
                            );
                          } else {
                            return AlertDialog(
                              title: const Text('Save draft?'),
                              content: const Text(
                                  "You can save what you wrote to continue creating the event later."),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      eventDescription = "";
                                      eventTitle = "";
                                      eventLocation = "";
                                      eventDate = null;
                                      eventIsNotFree = false;
                                      eventPrice = "";
                                      imageWasSelected = false;
                                      Navigator.of(context).popUntil((route) => route.isFirst);
                                    },
                                    child: const Text('Discard')),
                                TextButton(
                                    onPressed: () {
                                      Navigator.of(context).popUntil((route) => route.isFirst);
                                    },
                                    child: const Text('Save')),
                              ],
                            );
                          }
                        }),
                      );
                    }
                  },
                  icon: const Icon(CupertinoIcons.clear_thick),
                  color: const Color(0xff101010),
                ),
              ),
              title: const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Host an event',
                  style: TextStyle(
                    fontSize: 22,
                    color: Color(0xff101010),
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20.0,),
                  const Padding(
                    padding: EdgeInsets.only(left: 27.0),
                    child: Text(
                      'Event description',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Color(0xff101010),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8.0,),
                  Padding(
                    padding: const EdgeInsets.only(left: 35.0, right: 35.0,),
                    child: Column(
                      children: [
                        const Text.rich(
                          TextSpan(
                            style: TextStyle(
                              fontSize: 17,
                              color: Color(0xff101010),
                            ),
                            children: [
                              TextSpan(
                                text: 'Describe ',
                              ),
                              TextSpan(
                                text: 'what',
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                              TextSpan(
                                text: ' it is, how much it ',
                              ),
                              TextSpan(
                                text: 'costs',
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                              TextSpan(
                                text: ', ',
                              ),
                              TextSpan(
                                text: 'where',
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                              TextSpan(
                                text: ' and ',
                              ),
                              TextSpan(
                                text: 'when',
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                              TextSpan(
                                text: ' it will take place.',
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 12.0,),
                        Container(
                          width: screenWidth,
                          height: 187.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                              ),
                              const BoxShadow(
                                color: Color(0xfffcfdff),
                                blurRadius: 30.0,
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(14.0, 12.0, 11.0, 12.0,),
                            child: TextFormField(
                              initialValue: eventDescription,
                              maxLength: 1500,
                              minLines: 1,
                              maxLines: 10,
                              onChanged: (val) {
                                eventDescription = val;
                              },
                              onFieldSubmitted: (val) {
                                // gpt(eventDescription);
                              },
                              decoration: const InputDecoration(
                                counterText: "",
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                isDense: true,
                                contentPadding: EdgeInsets.only(),
                              ),
                              style: const TextStyle(
                                fontSize: 17,
                                color: Color(0xff101010),
                              ),
                              keyboardType: TextInputType.multiline,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 22.0,),
                  const Padding(
                    padding: EdgeInsets.only(left: 27.0),
                    child: Text(
                      'Event title',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Color(0xff101010),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8.0,),
                  Padding(
                    padding: const EdgeInsets.only(left: 35.0, right: 35.0,),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Please keep it simple and objective",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 17,
                            color: Color(0xff101010),
                          ),
                        ),
                        const SizedBox(height: 12.0,),
                        Container(
                          width: screenWidth,
                          height: 51.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                              ),
                              const BoxShadow(
                                color: Color(0xfffcfdff),
                                blurRadius: 30.0,
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 18.0, top: 15.0, right: 18.0),
                            child: TextFormField(
                              textInputAction: TextInputAction.next,
                              maxLength: 60,
                              initialValue: eventTitle,
                              onChanged: (val) {
                                eventTitle = val;
                              },
                              decoration: const InputDecoration(
                                counterText: "",
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                isDense: true,
                                contentPadding: EdgeInsets.only(),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 22.0,),
                  const Padding(
                    padding: EdgeInsets.only(left: 27.0),
                    child: Text(
                      'Location',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Color(0xff101010),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8.0,),
                  Padding(
                    padding: const EdgeInsets.only(left: 35.0, right: 35.0,),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Where's the meeting point?",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 17,
                            color: Color(0xff101010),
                          ),
                        ),
                        const SizedBox(height: 12.0,),
                        Container(
                          width: screenWidth,
                          height: 51.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                              ),
                              const BoxShadow(
                                color: Color(0xfffcfdff),
                                blurRadius: 30.0,
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 18.0, top: 15.0, right: 18.0),
                            child: TextFormField(
                              textInputAction: eventIsNotFree ? TextInputAction.next : TextInputAction.done,
                              initialValue: eventLocation,
                              onChanged: (val) {
                                eventLocation = val;
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
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 22.0,),
                  const Padding(
                    padding: EdgeInsets.only(left: 27.0),
                    child: Text(
                      'Date/time',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Color(0xff101010),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8.0,),
                  Padding(
                    padding: const EdgeInsets.only(left: 35.0, right: 35.0,),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "When will it be?",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 17,
                            color: Color(0xff101010),
                          ),
                        ),
                        const SizedBox(height: 12.0,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ScaleTap(
                              onPressed: () {
                                // Update current date and time
                                currentDateTime = DateTime.now();
                                DateTime lastAllowedDateToSchedule = DateTime.now().add(const Duration(days: 90));
                                DateTime firstAllowedDateToSchedule = DateTime.now().add(const Duration(hours: 1));
                                /// Remember to write security rules on Firebase to only allow people to schedule events if it's in less than 1 hour or after 90 days in the future

                                showCupertinoModalPopup(
                                  context: context,
                                  builder: (context) {
                                    return Container(
                                      color: const Color(0xfffcfdff),
                                      height: 350.0,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          SizedBox(
                                            height: 250.0,
                                            child: CupertinoDatePicker(
                                              backgroundColor: const Color(0xfffcfdff),
                                              use24hFormat: false,
                                              mode: CupertinoDatePickerMode.dateAndTime,
                                              initialDateTime: firstAllowedDateToSchedule,
                                              minimumDate: firstAllowedDateToSchedule,
                                              maximumDate: lastAllowedDateToSchedule,
                                              onDateTimeChanged: (DateTime date) {
                                                setState(() {
                                                  eventDate = date;
                                                });
                                              },
                                            ),
                                          ),
                                          const SizedBox(height: 7.0,),
                                          ScaleTap(
                                            onPressed: () {
                                              HapticFeedback.lightImpact();
                                              setState(() {
                                                eventDate ??= firstAllowedDateToSchedule;
                                                Navigator.pop(context);
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
                                              child: const Center(
                                                child: DefaultTextStyle(
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    color: Color(0xff101010),
                                                  ),
                                                  child: Text(
                                                    "Done",
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(height: 55.0,),
                                        ],
                                      ),
                                    );
                                  },
                                );
                              },
                              child: Container(
                                width: 225.0,
                                height: 51.0,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(24.0),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.12),
                                      blurRadius: 25.0,
                                    ),
                                  ],
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 18.0, top: 15.0, right: 18.0),
                                  child: Text.rich(
                                    textAlign: TextAlign.center,
                                    TextSpan(
                                      style: const TextStyle(
                                        fontSize: 16,
                                        color: Color(0xff101010),
                                      ),
                                      children: [
                                        TextSpan(
                                          text: eventDate != null ? DateFormat('EE, MMM d').format(eventDate!) : "Select date",
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        TextSpan(
                                          text: eventDate != null ? DateFormat(' - h:mm a').format(eventDate!) : "",
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 22.0,),
                  const Padding(
                    padding: EdgeInsets.only(left: 27.0),
                    child: Text(
                      'Price',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Color(0xff101010),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8.0,),
                  Padding(
                    padding: const EdgeInsets.only(left: 35.0, right: 35.0,),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Are there any costs that the participants should contribute?",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 17,
                            color: Color(0xff101010),
                          ),
                        ),
                        const SizedBox(height: 12.0,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const SizedBox(),
                            FlutterSwitch(
                              onToggle: (bool newValue) {
                                setState(() {
                                  eventIsNotFree = newValue;
                                });
                              },
                              activeColor: const Color(0xff106bad),
                              showOnOff: true,
                              activeText: "Yes",
                              inactiveText: "No",
                              padding: 5,
                              valueFontSize: 15,
                              activeTextColor: const Color(0xfffcfdff),
                              inactiveTextColor: const Color(0xfffcfdff),
                              activeTextFontWeight: FontWeight.w500,
                              inactiveTextFontWeight: FontWeight.w500,
                              width: 70,
                              borderRadius: 30.0,
                              value: eventIsNotFree,
                            ),
                            const SizedBox(
                              // width: (screenWidth/2.5)-35-10,
                              width: 10.0,
                              height: 51.0,
                            ),
                            eventIsNotFree ? Row(
                              children: [
                                const Text(
                                  "How\nmuch?",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: Color(0xff101010),
                                  ),
                                ),
                                const SizedBox(width: 7.0,),
                                Container(
                                  width: (screenWidth/2.5)-35-10,
                                  height: 51.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(24.0),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.1),
                                      ),
                                      const BoxShadow(
                                        color: Color(0xfffcfdff),
                                        blurRadius: 30.0,
                                      ),
                                    ],
                                  ),
                                  child: Stack(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(left: 33.0, top: 15.0, right: 18.0),
                                          child: TextFormField(
                                            textInputAction: TextInputAction.done,
                                            initialValue: eventPrice,
                                            onChanged: (val) {
                                              eventPrice = val;
                                            },
                                            textAlign: TextAlign.start,
                                            maxLength: 8,
                                            keyboardType: TextInputType.number,
                                            inputFormatters: [
                                              CurrencyTextInputFormatter(
                                                decimalDigits: 2,
                                                symbol: '',
                                              ),
                                            ],
                                            focusNode: priceFocusNode,
                                            decoration: const InputDecoration(
                                              counterText: "",
                                              hintText: "0.00",
                                              border: InputBorder.none,
                                              focusedBorder: InputBorder.none,
                                              enabledBorder: InputBorder.none,
                                              errorBorder: InputBorder.none,
                                              disabledBorder: InputBorder.none,
                                              isDense: true,
                                              contentPadding: EdgeInsets.only(),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 15.0, top: 15.0, right: 18.0),
                                          child: Text(
                                            "\$",
                                            style: TextStyle(
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.grey.shade500,
                                            ),
                                          ),
                                        ),
                                      ]
                                  ),
                                )
                              ],
                            ) : const SizedBox(
                              width: 186.0,
                            ),
                            const SizedBox(),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40.0,),
                  Center(
                    child: ScaleTap(
                      onPressed: () {
                        if (filledRequiredFields) {
                          HapticFeedback.lightImpact();
                          controller.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.ease);
                        } else {
                          HapticFeedback.mediumImpact();
                          sleep(const Duration(milliseconds: 80)); // Not the most elegant way to do it, I know, but oh well...
                          HapticFeedback.lightImpact();
                        }
                      },
                      scaleMinValue: filledRequiredFields ? 0.9 : 1,
                      child: Container(
                        width: 284.0,
                        height: 70.0,
                        decoration: BoxDecoration(
                          color: filledRequiredFields ? const Color(0xff106bad) : Colors.grey,
                          borderRadius: BorderRadius.circular(35.0),
                          boxShadow: const [
                            BoxShadow(
                              color: Color(0x33000000),
                              offset: Offset(0, 3),
                              blurRadius: 15,
                            ),
                          ],
                        ),
                        child: const Center(
                          child: Text(
                            'Next',
                            style: TextStyle(
                              fontSize: 20,
                              color: Color(0xfffcfdff),
                              fontWeight: FontWeight.w700,
                              height: 1.25,
                            ),
                            textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false),
                            textAlign: TextAlign.center,
                            softWrap: false,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 50.0,),
                ],
              ),
            ),
          ),
        ),
        Scaffold(
          backgroundColor: const Color(0xfffcfdff),
          appBar: AppBar(
            backgroundColor: const Color(0xfffcfdff),
            elevation: 0.0,
            leading: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: IconButton(
                onPressed: () {
                  controller.previousPage(duration: const Duration(milliseconds: 300), curve: Curves.ease);
                },
                icon: const Icon(CupertinoIcons.back),
                color: const Color(0xff101010),
              ),
            ),
            title: const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Host an event',
                style: TextStyle(
                  fontSize: 22,
                  color: Color(0xff101010),
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: SizedBox(
              height: screenHeight-103,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20.0,),
                      const Padding(
                        padding: EdgeInsets.only(left: 27.0),
                        child: Text(
                          'Choose an image',
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Color(0xff101010),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8.0,),
                      Padding(
                        padding: const EdgeInsets.only(left: 35.0, right: 35.0,),
                        child: Column(
                          children: [
                            const Text(
                              "We generated a cover image for your event:",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 17,
                                color: Color(0xff101010),
                              ),
                            ),
                            const SizedBox(height: 12.0,),
                            Container(
                              width: 200.0,
                              height: 200.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(24.0),
                                color: Colors.blue[800],
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                  ),
                                  const BoxShadow(
                                    color: Color(0xfffcfdff),
                                    blurRadius: 30.0,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 12.0,),
                            Center(
                              child: ScaleTap(
                                onPressed: () {
                                  // If turned from false to true, vibrate haptic
                                  if (imageWasSelected == false) HapticFeedback.selectionClick();

                                  setState(() {
                                    imageWasSelected = !imageWasSelected;
                                  });
                                },
                                child: Container(
                                  width: 170.0,
                                  height: 40.0,
                                  decoration: BoxDecoration(
                                    color: imageWasSelected ? const Color(0xff106bad) : Colors.white,
                                    borderRadius: const BorderRadius.all(Radius.circular(21.0)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.12),
                                        blurRadius: 20.0,
                                      ),
                                    ],
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Select image",
                                        style: TextStyle(
                                          fontSize: 17,
                                          color: imageWasSelected ? Colors.white : const Color(0xff101010),
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      const SizedBox(width: 3.0,),
                                      Icon(
                                        CupertinoIcons.checkmark_alt,
                                        color: imageWasSelected ? Colors.white : const Color(0xff101010),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 36.0,),
                      const Padding(
                        padding: EdgeInsets.only(left: 35.0, right: 35.0),
                        child: Text(
                          "Or upload you own:",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 17,
                            color: Color(0xff101010),
                          ),
                        ),
                      ),
                      const SizedBox(height: 12.0,),
                      Center(
                        child: ScaleTap(
                          onPressed: () {},
                          child: Container(
                            width: 170.0,
                            height: 40.0,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: const BorderRadius.all(Radius.circular(21.0)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.12),
                                  blurRadius: 20.0,
                                ),
                              ],
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  "Upload image",
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: Color(0xff101010),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(width: 3.0,),
                                Icon(CupertinoIcons.arrow_up_doc_fill),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 50.0,),
                    child: ScaleTap(
                      scaleMinValue: imageWasSelected ? 0.9 : 1,
                      onPressed: () {
                        if (filledRequiredFields && imageWasSelected) {
                          eventDescription = "";
                          eventTitle = "";
                          eventLocation = "";
                          eventDate = null;
                          eventIsNotFree = false;
                          eventPrice = "";
                          imageWasSelected = false;
                          HapticFeedback.heavyImpact();
                          Navigator.pop(context);
                        } else {
                          HapticFeedback.mediumImpact();
                          sleep(const Duration(milliseconds: 80)); // Not the most elegant way to do it, I know, but oh well...
                          HapticFeedback.lightImpact();
                        }
                      },
                      child: Container(
                        width: 284.0,
                        height: 70.0,
                        decoration: BoxDecoration(
                          color: filledRequiredFields && imageWasSelected ? const Color(0xff106bad) : Colors.grey,
                          borderRadius: BorderRadius.circular(35.0),
                          boxShadow: const [
                            BoxShadow(
                              color: Color(0x33000000),
                              offset: Offset(0, 3),
                              blurRadius: 15,
                            ),
                          ],
                        ),
                        child: const Center(
                          child: Text(
                            'Create event',
                            style: TextStyle(
                              fontSize: 20,
                              color: Color(0xfffcfdff),
                              fontWeight: FontWeight.w700,
                              height: 1.25,
                            ),
                            textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false),
                            textAlign: TextAlign.center,
                            softWrap: false,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}