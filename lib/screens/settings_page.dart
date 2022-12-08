import 'package:events_app/screens/customer_care.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_scale_tap/flutter_scale_tap.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage();

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  TextEditingController nameTextFormFieldController = TextEditingController();
  late FocusNode nameTextFormFieldFocusNode = FocusNode();

  @override
  void dispose() {
    nameTextFormFieldFocusNode.dispose();
    nameTextFormFieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final validName = RegExp(r"^[a-zA-Z]+((['’,. -][a-zA-Z ])?[a-zA-Z]*)*$");

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
              'CHILL, NOT FINAL DESIGN',
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
            // physics: const NeverScrollableScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    const SizedBox(height: 20.0,),
                    Padding(
                      padding: const EdgeInsets.only(left: 41.0, bottom: 4.0),
                      child: SizedBox(
                        width: size.width*0.9,
                        child: Text(
                          "email: ",
                          // textAlign: TextAlign.right,
                          style: const TextStyle(
                            fontSize: 17.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20.0,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 21.0, bottom: 4.0),
                          child: Text(
                            "name",
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
                            width: size.width*0.9,
                            height: 48.0,
                            color: const Color(0xFFFAFAFA),
                            child: Stack(
                              alignment: Alignment.centerRight,
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: SizedBox(
                                    width: 298.0,
                                    child: TextFormField(
                                      controller: nameTextFormFieldController,
                                      focusNode: nameTextFormFieldFocusNode,
                                      maxLength: 40,
                                      maxLengthEnforcement: MaxLengthEnforcement.enforced,
                                      validator: (val) {
                                        if (val!.isEmpty) {
                                          return "don't you have a name?";
                                        }
                                        // else if (val.trim().split(' ').length == 1) {
                                        //   return "first and last name, please";
                                        // }
                                        else if (!validName.hasMatch(val.trim())) {
                                          return "only Elon's son can have a weird name";
                                        }
                                        else {
                                          return null;
                                        }
                                      },
                                      onChanged: (val) {
                                      },
                                      textCapitalization: TextCapitalization.words,
                                      autocorrect: false,
                                      cursorColor: const Color(0XFF6A62B7),
                                      decoration: InputDecoration(
                                        counterText: "",
                                        hintText: 'Lea',
                                        icon: const Padding(
                                          padding: EdgeInsets.only(left: 22.0),
                                          child: Text(
                                            '👤',
                                            style: TextStyle(fontSize: 21.0),
                                          ),
                                        ),
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                ),
                                nameTextFormFieldFocusNode.hasFocus
                                    ? Padding(
                                  padding: const EdgeInsets.only(right: 8.0,),
                                  child: ScaleTap(
                                    onPressed: () async {
                                    },
                                    child: ClipRRect(
                                      borderRadius: const BorderRadius.all(Radius.circular(30.0)),
                                      child: Container(
                                        height: 36.0,
                                        color: const Color(0xAFA884FA).withOpacity(0.5),
                                        child: const Padding(
                                          padding: EdgeInsets.fromLTRB(12.0, 5.0, 12.0, 0.0),
                                          child: Text(
                                              "save 💾"
                                            ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ) :
                                Container(),
                              ]
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20.0,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding:  EdgeInsets.only(left: 21.0, bottom: 4.0),
                          child: Text(
                            "password",
                            // textAlign: TextAlign.right,
                            style: TextStyle(
                              fontSize: 17.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        ScaleTap(
                          enableFeedback: false,
                          onPressed: () {
                          },
                          child: ClipRRect(
                            borderRadius: const BorderRadius.all(Radius.circular(30.0),),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(26.0),
                                border: Border.all(width: 1, color: const Color(0XFFFAFAFA)),
                                color: Colors.transparent,
                              ),
                              // margin: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
                              width: size.width*0.9,
                              height: 48,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 22.0),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Row(
                                    children: const [
                                      Text(
                                        '🔑',
                                        style: TextStyle(fontSize: 21.0),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 16.0),
                                        child: Text(
                                          'change password',
                                          style: TextStyle(
                                            fontSize: 16.0,
                                            color: Color(0XFFFAFAFA),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20.0,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 21.0, bottom: 4.0),
                          child: Text(
                            "addresses & payments",
                            // textAlign: TextAlign.right,
                            style: TextStyle(
                              fontSize: 17.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        ScaleTap(
                          enableFeedback: false,
                          onPressed: () {
                          },
                          child: ClipRRect(
                            borderRadius: const BorderRadius.all(Radius.circular(30.0),),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(26.0),
                                border: Border.all(width: 1, color: const Color(0XFFFAFAFA)),
                                color: Colors.transparent,
                              ),
                              // margin: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
                              width: size.width*0.9,
                              height: 48,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 22.0),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Row(
                                    children: const [
                                      Text(
                                        '🏠 💳',
                                        style: TextStyle(fontSize: 21.0),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 16.0),
                                        child: Text(
                                          'manage addresses & payments',
                                          style: TextStyle(
                                            fontSize: 16.0,
                                            color: Color(0XFFFAFAFA),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20.0,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 21.0, bottom: 4.0),
                          child: Text(
                            "help",
                            // textAlign: TextAlign.right,
                            style: TextStyle(
                              fontSize: 17.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        ScaleTap(
                          enableFeedback: false,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => CustomerCare()),
                            );
                          },
                          child: ClipRRect(
                            borderRadius: const BorderRadius.all(Radius.circular(30.0),),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(26.0),
                                border: Border.all(width: 1, color: const Color(0XFFFAFAFA)),
                                color: Colors.transparent,
                              ),
                              // margin: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
                              width: size.width*0.9,
                              height: 48,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 22.0),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Row(
                                    children: const [
                                      Text(
                                        '📞',
                                        style: TextStyle(fontSize: 21.0),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 16.0),
                                        child: Text(
                                          'contact us',
                                          style: TextStyle(
                                            fontSize: 16.0,
                                            color: Color(0XFFFAFAFA),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 25.0,),
                  ],
                ),
                SizedBox(height: size.height/4.2,),
                Padding(
                  padding: const EdgeInsets.only(bottom: 50.0),
                  child: Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ScaleTap(
                            enableFeedback: false,
                            onPressed: () async {
                              Navigator.pop(context);
                            },
                            child: ClipRRect(
                              borderRadius: const BorderRadius.all(Radius.circular(30.0),),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(26.0),
                                  // border: Border.all(width: 1, color: const Color(0XFFFAFAFA)),
                                  color: Colors.white12,
                                ),
                                // margin: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
                                width: 150,
                                height: 48,
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Text(
                                        '👋',
                                        style: TextStyle(fontSize: 21.0),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 16.0),
                                        child: Text(
                                          'sign out',
                                          style: TextStyle(
                                            fontSize: 16.0,
                                            color: Color(0XFFFAFAFA),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 40.0,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          Text(
                            "⭐️   give feedback",
                            style: TextStyle(
                              fontSize: 17.0,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            "💼   join the team!",
                            style: TextStyle(
                              fontSize: 17.0,
                              color: Colors.white,
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
    );
  }
}
