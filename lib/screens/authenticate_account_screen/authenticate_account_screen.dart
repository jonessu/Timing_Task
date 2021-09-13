import 'dart:ui';

import 'package:assessment/Widget/text_widget.dart';
import 'package:assessment/utils/color_resource.dart';
import 'package:assessment/utils/font.dart';
import 'package:assessment/utils/image_resource.dart';
import 'package:assessment/utils/string_resource.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:icici/widgets/custom_dropdown_widget.dart';

class AuthenticateAccountScreen extends StatefulWidget {
  @override
  _AuthenticateAccountScreenState createState() =>
      _AuthenticateAccountScreenState();
}

class _AuthenticateAccountScreenState extends State<AuthenticateAccountScreen> {
  TextEditingController gridNumberController1 = TextEditingController();
  TextEditingController gridNumberController2 = TextEditingController();
  TextEditingController gridNumberController3 = TextEditingController();

  bool requiredText = false;

  String selectedDebitText = debitList1[0].cardtext;
  int radioValue = 0;

  @override
  void initState() {
    SharedPreferences.getInstance().then((pref) {
      setState(() {
        selectedDebitText =
            pref.getString('radioTextKey') ?? debitList1[0].cardtext;
        radioValue = pref.getInt('radioValueKey') ?? 0;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                elevation: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                          left: 25, right: 25, bottom: 48, top: 10),
                      child: Row(
                        children: [
                          Text_Widget(
                              text: selectedDebitText,
                              fontSize: 24,
                              colour: ColorResources.color222222,
                              fontWeight: FontWeight.w700),
                          GestureDetector(
                            child: Icon(Icons.arrow_back),
                            onTap: () {
                              setState(() {
                                showBottomDropdown();
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    // Container(
                    //   margin: EdgeInsets.only(left: 25,right: 25,bottom: 32,top: 15),
                    //   child: CustomDropDownWidget('XXXX XXXX XXXX 2345','XXXX 3425 XXXX 2347','XXXX 2356 XXXX 3215'),
                    // ),

                    Container(
                      margin: EdgeInsets.only(
                          left: 25, right: 25, bottom: 48, top: 10),
                      child: Row(
                        children: [
                          Text_Widget(
                              text: selectedDebitText,
                              fontSize: 24,
                              colour: ColorResources.color222222,
                              fontWeight: FontWeight.w700),
                          GestureDetector(
                            child: Icon(Icons.arrow_back),
                            onTap: () {
                              setState(() {
                                showBottomDropdown();
                              });
                            },
                          ),
                        ],
                      ),
                    ),

                    Stack(
                      children: [
                        Container(
                          height: 188,
                          width: 330,
                          margin:
                              EdgeInsets.only(left: 25, right: 25, bottom: 25),
                          decoration: BoxDecoration(
                              color: ColorResources.color060145,
                              borderRadius: BorderRadius.circular(12)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 40),
                                height: 56,
                                width: 56,
                                decoration: BoxDecoration(
                                  color: ColorResources.colorFFFFFF,
                                  borderRadius: BorderRadius.circular(9),
                                ),
                                child: TextFormField(
                                    controller: gridNumberController1,
                                    keyboardType: TextInputType.number,
                                    onChanged: (value) {
                                      if (value.isEmpty ||
                                          RegExp(r'^[0-9]+$').hasMatch(value)) {
                                        setState(() {
                                          requiredText = false;
                                        });
                                      } else {
                                        setState(() {
                                          requiredText = true;
                                        });
                                      }
                                    }),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 40),
                                height: 56,
                                width: 56,
                                decoration: BoxDecoration(
                                  color: ColorResources.colorFFFFFF,
                                  borderRadius: BorderRadius.circular(9),
                                ),
                                child: TextFormField(
                                    controller: gridNumberController2,
                                    keyboardType: TextInputType.number,
                                    onChanged: (value) {
                                      if (value.isEmpty ||
                                          RegExp(r'^[0-9]+$').hasMatch(value)) {
                                        setState(() {
                                          requiredText = false;
                                        });
                                      } else {
                                        setState(() {
                                          requiredText = true;
                                        });
                                      }
                                    }),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 40),
                                height: 56,
                                width: 56,
                                decoration: BoxDecoration(
                                  color: ColorResources.colorFFFFFF,
                                  borderRadius: BorderRadius.circular(9),
                                ),
                                child: TextFormField(
                                  controller: gridNumberController3,
                                  keyboardType: TextInputType.number,
                                  onChanged: (value) {
                                    if (value.isEmpty ||
                                        RegExp(r'^[0-9]+$').hasMatch(value)) {
                                      setState(() {
                                        requiredText = false;
                                      });
                                    } else {
                                      setState(() {
                                        requiredText = true;
                                      });
                                    }
                                  },
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 25, right: 25, top: 25),
                          //child: Image.asset(ImageResource.cardRectangle)),
                        )
                      ],
                    ),
                    requiredText
                        ? Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Wrong Grid Number, Please enter correct Grid",
                              style: TextStyle(
                                color: ColorResources.colorF92538,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          )
                        : SizedBox(),
                    Container(
                      margin: EdgeInsets.only(left: 56, right: 56, bottom: 130),
                      // child: CustomText(
                      //   Languages.of(context)!.gridHint,
                      // ),
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

  showBottomDropdown() {
    showModalBottomSheet(
      isScrollControlled: true,
      isDismissible: false,
      enableDrag: false,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15.0), topRight: Radius.circular(15.0)),
      ),
      backgroundColor: ColorResources.colorFFFFFF,
      context: context,
      builder: (BuildContext context) {
        return Container(
          constraints: const BoxConstraints(
            minHeight: 150,
            maxHeight: 230,
          ),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            ListTile(
              leading: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: CircleAvatar(
                  radius: 16,
                  backgroundColor: ColorResources.colorBFCBD730,
                  child: Icon(
                    Icons.close,
                    color: ColorResources.color222222,
                  ),
                ),
              ),
              title: Center(
                child: Text_Widget(
                    text: "Select  Debit Card",
                    fontSize: 20,
                    colour: ColorResources.color222222,
                    fontWeight: FontWeight.w700),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 31),
              child: Wrap(
                children: [
                  SizedBox(
                    height: debitList1.length * 80.0,
                    child: ListView.builder(
                        itemCount: debitList1.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 18.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(9.5),
                                  border: Border.all(
                                      color: ColorResources.colorEFEFEF)),
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    radioValue = index;
                                    selectedDebitText =
                                        debitList1[index].cardtext;
                                    SharedPreferences.getInstance()
                                        .then((pref) {
                                      pref.setInt('radioValueKey', radioValue);
                                      pref.setString(
                                          'radioTextKey', selectedDebitText);
                                    });
                                  });
                                  Navigator.pop(context);
                                },
                                child: ListTile(
                                  leading: CircleAvatar(
                                    radius: 11.5,
                                    backgroundColor: ColorResources.colorFF781F
                                        .withOpacity(.35),
                                  ),
                                  title: Text(debitList1[index].cardtext),
                                  trailing: radioValue == index
                                      ? CircleAvatar(
                                          radius: 12,
                                          backgroundColor:
                                              ColorResources.color10CB00,
                                          child: Center(
                                              child: Icon(
                                            Icons.done,
                                            size: 10,
                                            color: ColorResources.colorFFFFFF,
                                          )))
                                      : Container(
                                          height: 24,
                                          width: 24,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: ColorResources.colorFFFFFF,
                                              border: Border.all(
                                                color:
                                                    ColorResources.color222222,
                                              )),
                                        ),
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                ],
              ),
              // Padding(
              //   padding: const EdgeInsets.only(bottom: 18.0),
              //   child: Container(
              //     decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(9.5),
              //         border: Border.all(
              //             color: ColorResources.colorEFEFEF)),
              //     child: GestureDetector(
              //       onTap: () {
              //         setState(() {
              //           radioValue = 0;
              //           selectedDebitText = "4799 XXXX XXXX 7654";
              //           SharedPreferences.getInstance().then((pref) {
              //             pref.setInt('radioValueKey', 0);
              //             pref.setString(
              //                 'radioTextKey', selectedDebitText);
              //           });
              //         });
              //         Navigator.pop(context);
              //       },
              //       child: ListTile(
              //         leading: CircleAvatar(
              //           radius: 11.5,
              //           backgroundColor:
              //               ColorResources.colorFF781F.withOpacity(.35),
              //         ),
              //         title: Text('4799 XXXX XXXX 7654'),
              //         trailing: radioValue == 0
              //             ? CircleAvatar(
              //                 radius: 12,
              //                 backgroundColor:
              //                     ColorResources.color10CB00,
              //                 child: Center(
              //                     child: Icon(
              //                   Icons.done,
              //                   size: 10,
              //                   color: ColorResources.colorFFFFFF,
              //                 )))
              //             : Container(
              //                 height: 24,
              //                 width: 24,
              //                 decoration: BoxDecoration(
              //                     shape: BoxShape.circle,
              //                     color: ColorResources.colorFFFFFF,
              //                     border: Border.all(
              //                       color: ColorResources.color222222,
              //                     )),
              //               ),
              //       ),
              //     ),
              //   ),
              // ),
              // Padding(
              //   padding: const EdgeInsets.only(bottom: 18.0),
              //   child: Container(
              //     decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(9.5),
              //         border: Border.all(
              //             color: ColorResources.colorEFEFEF)),
              //     child: GestureDetector(
              //       onTap: () {
              //         setState(() {
              //           radioValue = 1;
              //           selectedDebitText = "XXXX 2222 333X 3211";
              //           SharedPreferences.getInstance().then((pref) {
              //             pref.setInt('radioValueKey', 1);
              //             pref.setString(
              //                 'radioTextKey', selectedDebitText);
              //           });
              //         });
              //         Navigator.pop(context);
              //       },
              //       child: ListTile(
              //         leading: CircleAvatar(
              //           radius: 11.5,
              //           backgroundColor:
              //               ColorResources.colorFF781F.withOpacity(.35),
              //         ),
              //         title: Text(''),
              //         trailing: radioValue == 1
              //             ? CircleAvatar(
              //                 radius: 12,
              //                 backgroundColor:
              //                     ColorResources.color10CB00,
              //                 child: Center(
              //                     child: Icon(
              //                   Icons.done,
              //                   size: 10,
              //                   color: ColorResources.colorFFFFFF,
              //                 )))
              //             : Container(
              //                 height: 24,
              //                 width: 24,
              //                 decoration: BoxDecoration(
              //                     shape: BoxShape.circle,
              //                     color: ColorResources.colorFFFFFF,
              //                     border: Border.all(
              //                       color: ColorResources.color222222,
              //                     )),
              //               ),
              //       ),
              //     ),
              //   ),
              // ),
            )
          ]),
        );
      },
    );
  }
}

class DebitList {
  String cardtext;
  DebitList({required this.cardtext});
}

List<DebitList> debitList1 = [
  DebitList(cardtext: "3247 XXXX XXXX 2345"),
  DebitList(cardtext: "XXXX 2222 333X 3211"),
];
