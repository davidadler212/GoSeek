import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;
import 'package:flutter_scale_tap/flutter_scale_tap.dart';

List<Map<String, dynamic>> eventsHosting = [];
List<GlobalKey<AnimatedListState>> keys = [];
List<int> currentAcceptedInvites = []; // Keeps track of how many invites were accepted for each event to display the updated count in the "x attending" text

class Hosting extends StatefulWidget {
  const Hosting({Key? key}) : super(key: key);

  @override
  State<Hosting> createState() => _HostingState();
}

class _HostingState extends State<Hosting> {

  @override
  void initState() {
    if (eventsHosting.isEmpty) {
      // MOCK DATA:
      eventsHosting.add({
        "id": 1,
        "title": "Bananas eat passion fruits because they're fat",
        "date": "Tomorrow, 8 PM",
        "attendees": ["David", "Muriel", "Ariela", "Allison", "Leon"],
        "pendingInvitees": [["Jason", 26, ["🎾Tennis",  "💻Coding", "🎥Sci-fi",  "🎥Drama", "📚Fantasy", "⛷Skiing",  "🎸Guitar", "📚Fiction"]], ["Maximiliano", 22, ["🎾Tennis",  "💻Coding"]], ["Bob", 34, ["🎾Tennis",  "💻Coding", "📚Fiction"]], ["Jasonnnnnnnn", 19, ["🎾Tennis",  "💻Coding"]]],
      });
      currentAcceptedInvites.add(0);

      eventsHosting.add({
        "id": 2,
        "title": "Potatos eat watermelons because they're obese",
        "date": "Tuesday, 9 PM",
        "attendees": ["Laurel", "Tyler", "Paolo"],
        "pendingInvitees": [["Gorilla", 18, ["🎾Tennis",  "💻Coding"]], ["Doggy", 33, ["🎾Tennis",  "💻Coding"]], ["Pig", 29, ["🎾Tennis",  "💻Coding", "🎸Guitar"]]],
      });
      currentAcceptedInvites.add(0);
    }

    // pendingInvitees = ["Jason", "Maximiliano", "Bob", "Jasonnnnnnnn"];
    keys = List.generate(eventsHosting.length, (index) {
      return GlobalKey<AnimatedListState>();
    });
    super.initState();
  }
  // void initState() {
  //   eventsHosting = List.generate(10, (index) => "Banana $index");
  //   pendingInvitees = ["Jason", "Maximiliano", "Bob", "Jasonnnnnnnn"];
  //   key = List.generate(eventsHosting.length, (index) {
  //     return List.generate(eventsHosting.length, (index) {
  //       return GlobalKey<AnimatedListState>();
  //     });
  //   });
  //   super.initState();
  // }

  // final GlobalKey<AnimatedListState> key = GlobalKey();

  void removeItem({
    required int pendingInvitationListIndex,
    required int eventsHostingListIndex,
    required String pendingInvitationName,
    required int pendingInvitationAge,
    required List<String> pendingInvitationInterests,
    required int numOfTagsNotShown,
  }) {
    keys[eventsHostingListIndex].currentState!.removeItem(
      pendingInvitationListIndex, (context, animation) {
      return Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(13.0)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.085),
              blurRadius: 15.0,
            ),
          ],
        ),
        child: FadeTransition(
          opacity: animation,
          child: SizeTransition(
            sizeFactor: animation,
            child: Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(13.0)),
                ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(23.0)),
                  child: Container(
                    height: 121.0,
                    color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(),
                        Padding(
                          padding: const EdgeInsets.only(top: 15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ClipOval(
                                child: Image.asset(
                                  "assets/images/image_2.jpeg",
                                  width: 68.0,
                                ),
                              ),
                              const SizedBox(height: 5.0,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    pendingInvitationName,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  Text(
                                    ' $pendingInvitationAge',
                                    style: const TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Center(
                          child: Container(
                            width: 164.0,
                            decoration: BoxDecoration(
                              color: const Color(0xfff5f5f7),
                              borderRadius: BorderRadius.circular(23.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 4.0, left: 8.0, bottom: 6.0),
                              child: Wrap(
                                alignment: WrapAlignment.center,
                                children: [
                                  for (int i = 0; i <= pendingInvitationInterests.length-2; i++) Text("${pendingInvitationInterests[i]},  "),
                                  numOfTagsNotShown > 0 ?
                                  Text("${pendingInvitationInterests.last},  ") :
                                  Text("${pendingInvitationInterests.last}  "),

                                  numOfTagsNotShown > 0 ?
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5.0),
                                    child: Text("+$numOfTagsNotShown"),
                                  ) :
                                  const SizedBox(),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            Container(
                              width: 61.0,
                              height: 61.0,
                              color: const Color(0xFF64CC64),
                              child: IconButton(
                                icon: const Icon(
                                  CupertinoIcons.check_mark,
                                  color: Colors.white,
                                ),
                                onPressed: () {},
                              ),
                            ),
                            Container(
                              width: 61.0,
                              height: 60.0,
                              color: const Color(0xFFD95F5F),
                              child: IconButton(
                                icon: const Icon(
                                  CupertinoIcons.xmark,
                                  color: Colors.white,
                                ),
                                onPressed: () {},
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    },
      duration: const Duration(milliseconds: 300),
    );
    eventsHosting[eventsHostingListIndex]["pendingInvitees"].removeAt(pendingInvitationListIndex);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 27.0, top: 28.0),
            child: Text(
              'Hosted by you',
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
            itemCount: eventsHosting.length,
            padding: const EdgeInsets.only(top: 15.0),
            itemBuilder: (context, eventsHostingListIndex) {
              return Padding(
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
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: const BorderRadius.all(Radius.circular(23.0)),
                                  child: Container(
                                    width: 152.0,
                                    height: 103.0,
                                    color: Colors.blue[800],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 15.0),
                                  child: SizedBox(
                                    height: 103.0,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: 200.0,
                                          child: Text(
                                            eventsHosting[eventsHostingListIndex]["title"],
                                            style: const TextStyle(
                                              fontSize: 16,
                                              color: Color(0xff101010),
                                              fontWeight: FontWeight.w500,
                                              height: 1.0,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 180.0,
                                          child: Text(
                                            eventsHosting[eventsHostingListIndex]["date"],
                                            style: const TextStyle(
                                              fontSize: 14,
                                              color: Color(0xff101010),
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 180.0,
                                          child: Text(
                                            "${eventsHosting[eventsHostingListIndex]["attendees"].length + currentAcceptedInvites[eventsHostingListIndex]} attending",
                                            style: const TextStyle(
                                              fontSize: 14,
                                              color: Color(0xff101010),
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            AnimatedCrossFade(
                              firstChild: const Padding(
                                padding: EdgeInsets.only(top: 25.0, left: 10.0),
                                child: Text(
                                  'Pending invitation requests',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Color(0xff101010),
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              secondChild: const Padding(
                                padding: EdgeInsets.only(left: 10.0),
                                child: SizedBox(
                                  height: 0.0,
                                  child: Text(
                                    'Pending invitation requests',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ),
                              duration: const Duration(milliseconds: 300),
                              crossFadeState: eventsHosting[eventsHostingListIndex]["pendingInvitees"].length > 0 ? CrossFadeState.showFirst : CrossFadeState.showSecond,
                            ),
                            AnimatedList(
                                key: keys[eventsHostingListIndex],
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                padding: EdgeInsets.zero,
                                initialItemCount: eventsHosting[eventsHostingListIndex]["pendingInvitees"].length,
                                itemBuilder: (context, pendingInvitationListIndex, animation) {
                                  // List<String> allInviteeTags = ["🎾Tennis",  "💻Coding", "🎥Sci-fi"];
                                  List<String> allInviteeTags = eventsHosting[eventsHostingListIndex]["pendingInvitees"][pendingInvitationListIndex][2];
                                  List<String> shownInviteeTags = [];

                                  int currentNumOfChars = 0;
                                  int numOfTagsNotShown = 0;


                                  for (int i = 0; i <= allInviteeTags.length-1; i++) {
                                    if (currentNumOfChars <= 44 && currentNumOfChars + allInviteeTags[i].length <= 44) {
                                      shownInviteeTags.add(allInviteeTags[i]);
                                      currentNumOfChars += allInviteeTags[i].length;
                                    } else {
                                      numOfTagsNotShown = allInviteeTags.length - shownInviteeTags.length;
                                      break;
                                    }
                                  }

                                  return ScaleTap(
                                    scaleMinValue: 0.95,
                                    onPressed: () {},
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(Radius.circular(13.0)),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black.withOpacity(0.085),
                                            blurRadius: 15.0,
                                          ),
                                        ],
                                      ),
                                      child: FadeTransition(
                                        opacity: animation,
                                        child: SizeTransition(
                                          key: UniqueKey(),
                                          sizeFactor: animation,
                                          child: Padding(
                                            padding: const EdgeInsets.only(top: 12.0),
                                            child: Container(
                                              decoration: const BoxDecoration(
                                                borderRadius: BorderRadius.all(Radius.circular(13.0)),
                                              ),
                                              child: ClipRRect(
                                                borderRadius: const BorderRadius.all(Radius.circular(23.0)),
                                                child: Container(
                                                  height: 121.0,
                                                  color: Colors.white,
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      const SizedBox(),
                                                      Padding(
                                                        padding: const EdgeInsets.only(top: 15.0),
                                                        child: Column(
                                                          crossAxisAlignment: CrossAxisAlignment.center,
                                                          children: [
                                                            ClipOval(
                                                              child: Image.asset(
                                                                "assets/images/image_2.jpeg",
                                                                width: 68.0,
                                                              ),
                                                            ),
                                                            const SizedBox(height: 5.0,),
                                                            Row(
                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                              children: [
                                                                Text(
                                                                  eventsHosting[eventsHostingListIndex]["pendingInvitees"][pendingInvitationListIndex][0],
                                                                  textAlign: TextAlign.center,
                                                                  style: const TextStyle(
                                                                    fontWeight: FontWeight.w700,
                                                                  ),
                                                                ),
                                                                Text(
                                                                  ' ${eventsHosting[eventsHostingListIndex]["pendingInvitees"][pendingInvitationListIndex][1]}',
                                                                  style: const TextStyle(
                                                                    fontSize: 14,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Center(
                                                        child: Container(
                                                          width: 164.0,
                                                          decoration: BoxDecoration(
                                                            color: const Color(0xfff5f5f7),
                                                            borderRadius: BorderRadius.circular(23.0),
                                                          ),
                                                          child: Padding(
                                                            padding: const EdgeInsets.only(top: 4.0, left: 8.0, bottom: 6.0),
                                                            child: Wrap(
                                                              alignment: WrapAlignment.center,
                                                              children: [
                                                                for (int i = 0; i <= shownInviteeTags.length-2; i++) Text("${shownInviteeTags[i]},  "),
                                                                numOfTagsNotShown > 0 ?
                                                                Text("${shownInviteeTags.last},  ") :
                                                                Text("${shownInviteeTags.last}  "),

                                                                numOfTagsNotShown > 0 ?
                                                                Padding(
                                                                  padding: const EdgeInsets.only(top: 5.0),
                                                                  child: Text("+$numOfTagsNotShown"),
                                                                ) :
                                                                const SizedBox(),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Column(
                                                        children: [
                                                          ScaleTap(
                                                            opacityMinValue: .7,
                                                            scaleMinValue: 1,
                                                            onPressed: () {
                                                              showDialog(
                                                                context: context,
                                                                barrierDismissible: false,
                                                                builder: ((context) {
                                                                  if (Platform.isIOS) {
                                                                    return CupertinoAlertDialog(
                                                                      title: const Text("Accept invitation request?"),
                                                                      content: Text("You can't uninvite ${eventsHosting[eventsHostingListIndex]["pendingInvitees"][pendingInvitationListIndex][0]} after accepting their invitation request."),
                                                                      actions: [
                                                                        CupertinoDialogAction(
                                                                            onPressed: () {
                                                                              Navigator.of(context).pop(false);
                                                                            },
                                                                            child: const Text('Cancel')),
                                                                        CupertinoDialogAction(
                                                                            onPressed: () {
                                                                              setState(() {
                                                                                removeItem(
                                                                                  pendingInvitationListIndex: pendingInvitationListIndex,
                                                                                  eventsHostingListIndex: eventsHostingListIndex,
                                                                                  pendingInvitationName: eventsHosting[eventsHostingListIndex]["pendingInvitees"][pendingInvitationListIndex][0],
                                                                                  pendingInvitationAge: eventsHosting[eventsHostingListIndex]["pendingInvitees"][pendingInvitationListIndex][1],
                                                                                  pendingInvitationInterests: shownInviteeTags,
                                                                                  numOfTagsNotShown: numOfTagsNotShown,
                                                                                );
                                                                                currentAcceptedInvites[eventsHostingListIndex] = currentAcceptedInvites[eventsHostingListIndex] + 1;
                                                                              });
                                                                              Navigator.of(context).pop(true);
                                                                            },
                                                                            child: const Text('Invite')),
                                                                      ],
                                                                    );
                                                                  } else {
                                                                    return AlertDialog(
                                                                      title: const Text('Accept invitation request?'),
                                                                      content: Text("You can't uninvite ${eventsHosting[eventsHostingListIndex]["pendingInvitees"][pendingInvitationListIndex][0]} after accepting their invitation request."),
                                                                      actions: [
                                                                        TextButton(
                                                                            onPressed: () {
                                                                              Navigator.of(context).pop(false);
                                                                            },
                                                                            child: const Text('Cancel')),
                                                                        TextButton(
                                                                            onPressed: () {
                                                                              setState(() {
                                                                                removeItem(
                                                                                  pendingInvitationListIndex: pendingInvitationListIndex,
                                                                                  eventsHostingListIndex: eventsHostingListIndex,
                                                                                  pendingInvitationName: eventsHosting[eventsHostingListIndex]["pendingInvitees"][pendingInvitationListIndex][0],
                                                                                  pendingInvitationAge: eventsHosting[eventsHostingListIndex]["pendingInvitees"][pendingInvitationListIndex][1],
                                                                                  pendingInvitationInterests: shownInviteeTags,
                                                                                  numOfTagsNotShown: numOfTagsNotShown,
                                                                                );
                                                                                currentAcceptedInvites[eventsHostingListIndex] = currentAcceptedInvites[eventsHostingListIndex] + 1;
                                                                              });
                                                                              Navigator.of(context).pop(true);
                                                                            },
                                                                            child: const Text('Invite')),
                                                                      ],
                                                                    );
                                                                  }
                                                                }),
                                                              );
                                                            },
                                                            child: Container(
                                                              width: 61.0,
                                                              height: 61.0,
                                                              color: const Color(0xFF64CC64),
                                                              child: const Icon(
                                                                CupertinoIcons.check_mark,
                                                                color: Colors.white,
                                                              ),
                                                            ),
                                                          ),
                                                          ScaleTap(
                                                            opacityMinValue: .7,
                                                            scaleMinValue: 1,
                                                            onPressed: () {
                                                              showDialog(
                                                                context: context,
                                                                barrierDismissible: false,
                                                                builder: ((context) {
                                                                  if (Platform.isIOS) {
                                                                    return CupertinoAlertDialog(
                                                                      title: const Text("Reject invitation request?"),
                                                                      content: Text("${eventsHosting[eventsHostingListIndex]["pendingInvitees"][pendingInvitationListIndex][0]} won't be notified about this."),
                                                                      actions: [
                                                                        CupertinoDialogAction(
                                                                            onPressed: () {
                                                                              Navigator.of(context).pop(false);
                                                                            },
                                                                            child: const Text('Cancel')),
                                                                        CupertinoDialogAction(
                                                                            onPressed: () {
                                                                              setState(() {
                                                                                removeItem(
                                                                                  pendingInvitationListIndex: pendingInvitationListIndex,
                                                                                  eventsHostingListIndex: eventsHostingListIndex,
                                                                                  pendingInvitationName: eventsHosting[eventsHostingListIndex]["pendingInvitees"][pendingInvitationListIndex][0],
                                                                                  pendingInvitationAge: eventsHosting[eventsHostingListIndex]["pendingInvitees"][pendingInvitationListIndex][1],
                                                                                  pendingInvitationInterests: shownInviteeTags,
                                                                                  numOfTagsNotShown: numOfTagsNotShown,
                                                                                );
                                                                              });
                                                                              Navigator.of(context).pop(true);
                                                                            },
                                                                            child: const Text('Reject')),
                                                                      ],
                                                                    );
                                                                  } else {
                                                                    return AlertDialog(
                                                                      title: const Text("Reject invitation request?"),
                                                                      content: Text("${eventsHosting[eventsHostingListIndex]["pendingInvitees"][pendingInvitationListIndex][0]} won't be notified about this."),
                                                                      actions: [
                                                                        TextButton(
                                                                            onPressed: () {
                                                                              Navigator.of(context).pop(false);
                                                                            },
                                                                            child: const Text('Cancel')),
                                                                        TextButton(
                                                                            onPressed: () {
                                                                              setState(() {
                                                                                removeItem(
                                                                                  pendingInvitationListIndex: pendingInvitationListIndex,
                                                                                  eventsHostingListIndex: eventsHostingListIndex,
                                                                                  pendingInvitationName: eventsHosting[eventsHostingListIndex]["pendingInvitees"][pendingInvitationListIndex][0],
                                                                                  pendingInvitationAge: eventsHosting[eventsHostingListIndex]["pendingInvitees"][pendingInvitationListIndex][1],
                                                                                  pendingInvitationInterests: shownInviteeTags,
                                                                                  numOfTagsNotShown: numOfTagsNotShown,
                                                                                );
                                                                              });
                                                                              Navigator.of(context).pop(true);
                                                                            },
                                                                            child: const Text('Reject')),
                                                                      ],
                                                                    );
                                                                  }
                                                                }),
                                                              );
                                                            },
                                                            child: Container(
                                                              width: 61.0,
                                                              height: 60.0,
                                                              color: const Color(0xFFD95F5F),
                                                              child: const Icon(
                                                                CupertinoIcons.xmark,
                                                                color: Colors.white,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
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
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
