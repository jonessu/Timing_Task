import 'dart:io';

import 'package:assessment/Widget/text_widget.dart';
import 'package:assessment/data/more_option_list.dart';
import 'package:assessment/screens/refer_earn_screen/bloc/referearn_bloc.dart';
import 'package:assessment/screens/refer_earn_screen/search_contact_screen.dart';
import 'package:assessment/utils/color_resource.dart';
import 'package:assessment/utils/font.dart';
import 'package:assessment/utils/image_resource.dart';
import 'package:assessment/utils/string_resource.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:search_page/search_page.dart';
import 'package:share/share.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class Contact {
  final String name, mobilenumber, time;
  Contact({required this.name, required this.mobilenumber, required this.time});
}

class ReferearnScreen extends StatefulWidget {
  ReferearnScreen({Key? key}) : super(key: key);

  @override
  _ReferearnScreenState createState() => _ReferearnScreenState();
}

class _ReferearnScreenState extends State<ReferearnScreen> {
  late ReferearnBloc referearnBloc;
  late bool switchValue = false;

  String referValue = 'POCO274568';

  @override
  void initState() {
    super.initState();
    referearnBloc = ReferearnBloc()..add(ReferearnInitailEvent());
  }

  static List<Contact> contact = [
    Contact(name: 'Apple', mobilenumber: '9987654321', time: '6.30'),
    Contact(name: 'Mango', mobilenumber: '9987654532', time: '7.30'),
    Contact(name: 'Grapes', mobilenumber: '9956454321', time: '9.30'),
    Contact(name: 'Cadberry', mobilenumber: '9887654021', time: '8.30'),
    Contact(name: 'Dairy milk', mobilenumber: '9985645321', time: '4.30'),
    Contact(name: 'Milkybar', mobilenumber: '9913456789', time: '3.30'),
    Contact(name: 'Fivestar', mobilenumber: '9983215678', time: '12.30'),
    Contact(name: 'Eclairs', mobilenumber: '9987672134', time: '11.30'),
    Contact(name: 'Lays', mobilenumber: '9990564321', time: '2.30'),
    Contact(name: 'Orange', mobilenumber: '9783213456', time: '8.30'),
    Contact(name: 'Strawberry', mobilenumber: '9566190788', time: '4.30'),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocListener<ReferearnBloc, ReferearnState>(
      bloc: referearnBloc,
      listener: (context, state) {},
      child: BlocBuilder<ReferearnBloc, ReferearnState>(
        bloc: referearnBloc,
        builder: (context, state) {
          if (state is ReferearnLoadingState) {
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else if (state is ReferearnLoadedState) {
            return Scaffold(
              backgroundColor: ColorResources.colorFAFAFA,
              // appBar: AppBar(
              //   leading: Icon(
              //     Icons.arrow_back,
              //     color: ColorResources.colorFFFFFF,
              //   ),
              //   title: Text_Widget(
              //     text: StringResource.ReferandEarn,
              //     fontSize: FontSize.twentyfive,
              //     colour: ColorResources.colorFFFFFF,
              //     fontWeight: FontWeights.bold,
              //   ),
              // ),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(ImageResource.bg1),
                              alignment: Alignment.topCenter,
                            ),
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12.0, vertical: 12.0),
                                child: Column(
                                  children: [
                                    SizedBox(height: 40),
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Row(
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.pop(context);
                                            },
                                            child: Icon(
                                              Icons.arrow_back,
                                              color: ColorResources.colorFFFFFF,
                                            ),
                                          ),
                                          SizedBox(width: 22.0),
                                          Text_Widget(
                                            text: StringResource.ReferandEarn,
                                            fontSize: FontSize.twentyfive,
                                            colour: ColorResources.colorFFFFFF,
                                            fontWeight: FontWeights.bold,
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Image.asset(ImageResource.bg2),
                                    SizedBox(height: 24),
                                    Text(
                                      StringResource
                                          .InviteyourfriendsandgetBonusPoints,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: FontSize.thirtyfour,
                                        color: ColorResources.colorFFFFFF,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 24),
                              Container(
                                decoration: BoxDecoration(
                                  color: ColorResources.colorFFFFFF,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(32.0),
                                    topRight: Radius.circular(32.0),
                                  ),
                                ),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 22.0, vertical: 16.0),
                                child: Column(
                                  children: [
                                    Text_Widget(
                                      text: StringResource.YourReferralCode,
                                      fontSize: FontSize.twelve,
                                      colour: ColorResources.color222222,
                                      fontWeight: FontWeights.normal,
                                    ),
                                    Container(
                                      height: 47,
                                      width: 169,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: Colors.white,
                                        border: Border.all(
                                          color: ColorResources.colorFF781F,
                                          width: 1,
                                        ),
                                      ),
                                      child: Center(
                                        child: Text_Widget(
                                          text: referValue,
                                          fontSize: FontSize.twentyfour,
                                          colour: ColorResources.color222222,
                                          fontWeight: FontWeights.normal,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 24.0),
                                    GestureDetector(
                                      onTap: () async {
                                        const url = "https://wa.me/?text=";
                                        if (await canLaunch(url)) {
                                          await launch(url + referValue);
                                        } else {
                                          throw 'Could not launch $url';
                                        }
                                      },
                                      child: Container(
                                        height: 56,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: ColorResources.colorFF781F,
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          border: Border.all(
                                            color: ColorResources.colorFF781F,
                                            width: 1,
                                          ),
                                        ),
                                        child: Center(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Image.asset(
                                                  ImageResource.whatsappIcon),
                                              SizedBox(width: 10),
                                              Text_Widget(
                                                text: StringResource
                                                    .ShareviaWhatsapp,
                                                fontSize: FontSize.eighteen,
                                                colour:
                                                    ColorResources.colorFFFFFF,
                                                fontWeight: FontWeights.normal,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 24.0),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        GestureDetector(
                                          onTap: () async {
                                            String? encodeQueryParameters(
                                                Map<String, String> params) {
                                              return params.entries
                                                  .map((e) =>
                                                      '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
                                                  .join('&');
                                            }

                                            final Uri emailLaunchUri = Uri(
                                              scheme: 'mailto',
                                              path: 'info@example.com',
                                              query: encodeQueryParameters(<
                                                  String, String>{
                                                'subject': referValue
                                              }),
                                            );

                                            await launch(
                                                emailLaunchUri.toString());
                                          },
                                          child: Column(
                                            children: [
                                              Container(
                                                width: 55.0,
                                                height: 55.0,
                                                decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                            ImageResource
                                                                .ellipse),
                                                        fit: BoxFit.cover)),
                                                child: Image.asset(
                                                    ImageResource.messageIcon),
                                              ),
                                              SizedBox(height: 9),
                                              Text_Widget(
                                                text: StringResource.Email,
                                                fontSize: FontSize.twelve,
                                                colour:
                                                    ColorResources.color222222,
                                                fontWeight: FontWeights.normal,
                                              ),
                                            ],
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            Share.share(referValue);
                                          },
                                          child: Column(
                                            children: [
                                              Container(
                                                width: 55.0,
                                                height: 55.0,
                                                decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                            ImageResource
                                                                .ellipse),
                                                        fit: BoxFit.cover)),
                                                child: Image.asset(ImageResource
                                                    .sharetextIcon),
                                              ),
                                              SizedBox(height: 9),
                                              Text_Widget(
                                                text:
                                                    StringResource.CopyandShare,
                                                fontSize: FontSize.twelve,
                                                colour:
                                                    ColorResources.color222222,
                                                fontWeight: FontWeights.normal,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Column(
                                          children: [
                                            Container(
                                              width: 55.0,
                                              height: 55.0,
                                              decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      image: AssetImage(
                                                          ImageResource
                                                              .ellipse),
                                                      fit: BoxFit.cover)),
                                              child: Image.asset(
                                                  ImageResource.sharedotIcon),
                                            ),
                                            SizedBox(height: 9),
                                            Text_Widget(
                                              text: StringResource.More,
                                              fontSize: FontSize.twelve,
                                              colour:
                                                  ColorResources.color222222,
                                              fontWeight: FontWeights.normal,
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                    SizedBox(height: 44.0),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text_Widget(
                                          text: StringResource
                                              .ContactsnotyetonPockets,
                                          fontSize: FontSize.twenty,
                                          colour: ColorResources.color222222,
                                          fontWeight: FontWeights.normal,
                                        ),
                                        IconButton(
                                            icon: Icon(Icons.search),
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          SearchContact()));
                                            }
                                            // () => showSearch(
                                            //   context: context,
                                            //   delegate: SearchPage<Contact>(
                                            //     searchLabel:
                                            //         StringResource.Searchbynumberorname,
                                            //     suggestion: Center(
                                            //       child: Container(
                                            //         height: 400,
                                            //         width: 350,
                                            //         // decoration: BoxDecoration(
                                            //         //   image: DecorationImage(
                                            //         //     image: AssetImage(
                                            //         //         ImageResource.contacts),
                                            //         //     fit: BoxFit.fill,
                                            //         //   ),
                                            //         // ),
                                            //       ),
                                            //     ),
                                            //     builder: (contact) => ListTile(
                                            //       title: Text(contact.name),
                                            //       subtitle: Text(contact.mobilenumber),
                                            //       trailing: Text(contact.time),
                                            //     ),
                                            //     filter: (contact) => [
                                            //       contact.name,
                                            //       contact.mobilenumber,
                                            //       contact.time,
                                            //     ],
                                            //     items: contact,
                                            //     failure: Center(
                                            //       child: Container(
                                            //         height: 150,
                                            //         width: 150,
                                            //         // decoration: BoxDecoration(
                                            //         //   image: DecorationImage(
                                            //         //     image: AssetImage(
                                            //         //       ImageResource.search,
                                            //         //     ),
                                            //         //     fit: BoxFit.cover,
                                            //         //   ),
                                            //         // ),
                                            //       ),
                                            //     ),
                                            //   ),
                                            // ),
                                            ),
                                      ],
                                    ),
                                    ListView.builder(
                                        physics: NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        itemCount:
                                            referearnBloc.foundUsers.length,
                                        itemBuilder: (context, index) {
                                          return ListTile(
                                              title: Text(referearnBloc
                                                  .foundUsers[index].displayName
                                                  .toString()),
                                              subtitle: Text(referearnBloc
                                                  .foundUsers[index].phones!
                                                  .elementAt(0)
                                                  .value
                                                  .toString()),
                                              leading: (referearnBloc
                                                              .foundUsers[index]
                                                              .avatar !=
                                                          null &&
                                                      referearnBloc
                                                              .foundUsers[index]
                                                              .avatar!
                                                              .length >
                                                          0)
                                                  ? CircleAvatar(
                                                      backgroundColor:
                                                          ColorResources
                                                              .colorFF781F,
                                                      backgroundImage:
                                                          MemoryImage(
                                                              referearnBloc
                                                                  .foundUsers[
                                                                      index]
                                                                  .avatar!),
                                                    )
                                                  : CircleAvatar(
                                                      backgroundColor:
                                                          ColorResources
                                                              .colorFF781F,
                                                      child: Center(
                                                        child: Text_Widget(
                                                          text: referearnBloc
                                                              .foundUsers[index]
                                                              .initials(),
                                                          fontSize:
                                                              FontSize.eighteen,
                                                          colour: ColorResources
                                                              .colorFFFFFF,
                                                          fontWeight:
                                                              FontWeights
                                                                  .normal,
                                                        ),
                                                      ),
                                                    ),
                                              trailing: Text_Widget(
                                                text: StringResource.Invite,
                                                fontSize: FontSize.fourteen,
                                                colour:
                                                    ColorResources.colorFF781F,
                                                fontWeight: FontWeights.normal,
                                              ),
                                              onTap: () {
                                                // Navigator.push(
                                                //     context,
                                                //     MaterialPageRoute(
                                                //         builder: (context) => SingleMultiple()));
                                              });
                                        }),
                                  ],
                                ),
                              ),
                              // Align(
                              //   alignment: Alignment.center,
                              //   child: Text_Widget(
                              //     text: StringResource
                              //         .InviteyourfriendsandgetBonusPoints,
                              //     fontSize: FontSize.twentyfive,
                              //     colour: ColorResources.colorFFFFFF,
                              //     fontWeight: FontWeights.normal,
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        },
      ),
    );
  }
}
