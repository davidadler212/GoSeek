import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_scale_tap/flutter_scale_tap.dart';

class AddInterest extends StatefulWidget {
  final VoidCallback updateUserInterests;
  final List<String> oldUserInterests;

  const AddInterest({required this.updateUserInterests, required this.oldUserInterests, Key? key}) : super(key: key);

  @override
  State<AddInterest> createState() => _AddInterestState();
}

class _AddInterestState extends State<AddInterest> {
  List<String>? newUserInterests;

  @override
  void initState() {
    newUserInterests = widget.oldUserInterests;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<String> allInterests = List.generate(80, (index) => "${index.toString()} ${index.toString()} ${index.toString()} ${index.toString()}");

    return Scaffold(
      backgroundColor: const Color(0xfffcfdff),
      appBar: AppBar(
        backgroundColor: const Color(0xfffcfdff),
        elevation: 0.0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(CupertinoIcons.back),
            color: const Color(0xff101010),
          ),
        ),
        title: Transform(
          transform:  Matrix4.translationValues(-35.0, 0.0, 0.0),
          child: const Text(
            'Select your interests',
            style: TextStyle(
              fontSize: 22,
              color: Color(0xff101010),
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0,),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 60.0),
                child: Wrap(
                  children: [
                    for (int i = 0; i <= allInterests.length-1; i++)
                      ScaleTap(
                        onPressed: () {
                          HapticFeedback.lightImpact();
                          if (newUserInterests!.contains(allInterests[i])) {
                            setState(() {
                              newUserInterests!.remove(allInterests[i]);
                            });
                          } else {
                            setState(() {
                              newUserInterests!.add(allInterests[i]);
                            });
                          }
                          widget.updateUserInterests;
                          if (kDebugMode) {
                            print(newUserInterests);
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(right: 12.0, bottom: 12.0,),
                          child: Container(
                            height: 41.0,
                            decoration: BoxDecoration(
                              color: newUserInterests!.contains(allInterests[i]) ? const Color(0xFF106BAD) : const Color(0xfff5f5f7),
                              borderRadius: BorderRadius.circular(40.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.16),
                                  blurRadius: 20.0,
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 12, left: 11.0, right: 11.0),
                              child: Text(
                                allInterests[i],
                                style: TextStyle(
                                  fontSize: 14,
                                  color: newUserInterests!.contains(allInterests[i]) ? Colors.white : const Color(0xff7e7e7e),
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
    );
  }
}
