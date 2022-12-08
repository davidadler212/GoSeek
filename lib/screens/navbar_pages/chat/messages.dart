import 'package:events_app/screens/navbar_pages/chat/chat_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_scale_tap/flutter_scale_tap.dart';


class ChatUsers {
  String text;
  String secondaryText;
  String image;
  String time;
  ChatUsers(
      {required this.text,
        required this.secondaryText,
        required this.image,
        required this.time});
}

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<ChatUsers> chatUsers = [
    ChatUsers(
        text: "Jane Russel",
        secondaryText: "Awesome Setup",
        image: "assets/images/image_2.jpeg",
        time: "Now",
    ),
    ChatUsers(
        text: "Glady's Murphy",
        secondaryText: "That's Great",
        image: "assets/images/image_3.jpeg",
        time: "Yesterday",
    ),
    ChatUsers(
        text: "Jorge Henry",
        secondaryText: "Hey where are you?",
        image: "assets/images/image_4.jpeg",
        time: "31 Mar",
    ),
    ChatUsers(
        text: "Philip Fox",
        secondaryText: "Busy! Call me in 20 mins",
        image: "assets/images/image_5.jpeg",
        time: "28 Mar",
    ),
    ChatUsers(
        text: "Debra Hawkins",
        secondaryText: "Thankyou, It's awesome",
        image: "assets/images/image_2.jpeg",
        time: "23 Mar",
    ),
    ChatUsers(
        text: "Jacob Pena",
        secondaryText: "will update you in evening",
        image: "assets/images/image_3.jpeg",
        time: "17 Mar",
    ),
    ChatUsers(
        text: "Andrey Jones",
        secondaryText: "Can you please share the file?",
        image: "assets/images/image_4.jpeg",
        time: "24 Feb",
    ),
    ChatUsers(
        text: "John Wick",
        secondaryText: "How are you?",
        image: "assets/images/image_5.jpeg",
        time: "18 Feb",
    ),
    ChatUsers(
      text: "Jane Russel",
      secondaryText: "Awesome Setup",
      image: "assets/images/image_2.jpeg",
      time: "Now",
    ),
    ChatUsers(
      text: "Glady's Murphy",
      secondaryText: "That's Great",
      image: "assets/images/image_3.jpeg",
      time: "Yesterday",
    ),
    ChatUsers(
      text: "Jorge Henry",
      secondaryText: "Hey where are you?",
      image: "assets/images/image_4.jpeg",
      time: "31 Mar",
    ),
    ChatUsers(
      text: "Philip Fox",
      secondaryText: "Busy! Call me in 20 mins",
      image: "assets/images/image_5.jpeg",
      time: "28 Mar",
    ),
    ChatUsers(
      text: "Debra Hawkins",
      secondaryText: "Thankyou, It's awesome",
      image: "assets/images/image_2.jpeg",
      time: "23 Mar",
    ),
    ChatUsers(
      text: "Jacob Pena",
      secondaryText: "will update you in evening",
      image: "assets/images/image_3.jpeg",
      time: "17 Mar",
    ),
    ChatUsers(
      text: "Andrey Jones",
      secondaryText: "Can you please share the file?",
      image: "assets/images/image_4.jpeg",
      time: "24 Feb",
    ),
    ChatUsers(
      text: "John Wick",
      secondaryText: "How are you?",
      image: "assets/images/image_5.jpeg",
      time: "18 Feb",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffcfdff),
      appBar: AppBar(
        backgroundColor: const Color(0xfffcfdff),
        elevation: 0.0,
        title: const Padding(
          padding: EdgeInsets.only(left: 16.0, bottom: 5.0),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              'Messages',
              style: TextStyle(
                fontSize: 22,
                color: Color(0xff101010),
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ListView.builder(
              itemCount: chatUsers.length,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: const EdgeInsets.only(top: 16),
              itemBuilder: (context, index) {
                return ScaleTap(
                  scaleMinValue: 0.95,
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return ChatDetailPage();
                    }));
                  },
                  child: Container(
                    padding: const EdgeInsets.only(left: 25, right: 25, bottom: 25),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Row(
                            children: <Widget>[
                              CircleAvatar(
                                backgroundImage: AssetImage(chatUsers[index].image,),
                                maxRadius: 30,
                              ),
                              const SizedBox(
                                width: 16,
                              ),
                              Expanded(
                                child: Container(
                                  color: Colors.transparent,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        chatUsers[index].text,
                                        style: const TextStyle(fontSize: 16),
                                      ),
                                      const SizedBox(
                                        height: 6,
                                      ),
                                      Text(
                                        chatUsers[index].secondaryText,
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.grey.shade600,
                                            fontWeight: (index == 0 || index == 3)
                                                ? FontWeight.bold
                                                : FontWeight.normal,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          chatUsers[index].time,
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: (index == 0 || index == 3)
                                  ? FontWeight.bold
                                  : FontWeight.normal
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
