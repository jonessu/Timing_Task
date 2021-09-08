import 'dart:io';

import 'package:assessment/Widget/text_widget.dart';
import 'package:assessment/data/more_option_list.dart';
import 'package:assessment/screens/Setting_screen/setting_screen.dart';
import 'package:assessment/screens/accounts_screen/accounts_screen.dart';
import 'package:assessment/screens/all_service_screen/all_service_screen.dart';
import 'package:assessment/screens/home_tab_screen/bloc/hometab_bloc.dart';
import 'package:assessment/screens/refer_earn_screen/refer_earn_screen.dart';
import 'package:assessment/utils/color_resource.dart';
import 'package:assessment/utils/font.dart';
import 'package:assessment/utils/image_resource.dart';
import 'package:assessment/utils/string_resource.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HometabScreen extends StatefulWidget {
  HometabScreen({Key? key}) : super(key: key);

  @override
  _HometabScreenState createState() => _HometabScreenState();
}

class _HometabScreenState extends State<HometabScreen> {
  late HometabBloc hometabBloc;

  @override
  void initState() {
    super.initState();
    hometabBloc = HometabBloc()..add(HometabInitailEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<HometabBloc, HometabState>(
      bloc: hometabBloc,
      listener: (context, state) {},
      child: BlocBuilder<HometabBloc, HometabState>(
        bloc: hometabBloc,
        builder: (context, state) {
          if (state is HometabLoadingState) {
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else if (state is HometabLoadedState) {
            return Scaffold(
              backgroundColor: ColorResources.colorFAFAFA,
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
                              SizedBox(height: 20),
                              ListTile(
                                leading: CircleAvatar(
                                  radius: 23,
                                ),
                                title: Text_Widget(
                                  text: "Prince Pockets",
                                  fontSize: FontSize.thirteen,
                                  colour: ColorResources.colorFFFFFF,
                                  fontWeight: FontWeights.normal,
                                ),
                                subtitle: Text_Widget(
                                  text: "Good to see you back!",
                                  fontSize: FontSize.ten,
                                  colour: ColorResources.colorFFFFFF,
                                  fontWeight: FontWeights.normal,
                                ),
                                trailing: Wrap(
                                  spacing: 12, // space between two icons
                                  children: <Widget>[
                                    Icon(
                                      Icons.search,
                                      color: ColorResources.colorFFFFFF,
                                      size: 30,
                                    ), // icon-1
                                    GestureDetector(
                                      onTap: () {},
                                      child: Icon(
                                        Icons.notifications_outlined,
                                        color: ColorResources.colorFFFFFF,
                                        size: 30,
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    SettingsScreen()));
                                      },
                                      child: Icon(
                                        Icons.settings,
                                        size: 30,
                                        color: ColorResources.colorFFFFFF,
                                      ),
                                    ) // icon-2
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(16),
                                child: SizedBox(
                                  width: double.infinity,
                                  height: 235,
                                  child: ListView(
                                    scrollDirection: Axis.horizontal,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 13),
                                        child: Container(
                                          width: 204,
                                          height: 234,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: AssetImage(
                                                  ImageResource.containerMask),
                                              fit: BoxFit.cover,
                                            ),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20)),
                                            gradient: LinearGradient(
                                              colors: [
                                                ColorResources.colorFFFFFF,
                                                ColorResources.color4F0437,
                                                ColorResources.colorFFFFFF
                                              ],
                                            ),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(13.0),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text_Widget(
                                                  text: StringResource
                                                      .PocketsWallet,
                                                  fontSize: FontSize.sixteen,
                                                  colour: ColorResources
                                                      .color4F0437,
                                                  fontWeight:
                                                      FontWeights.normal,
                                                ),
                                                Text_Widget(
                                                  text: "4336620203007654",
                                                  fontSize: FontSize.eleven,
                                                  colour: ColorResources
                                                      .color4F0437,
                                                  fontWeight:
                                                      FontWeights.normal,
                                                ),
                                                SizedBox(height: 26),
                                                Text_Widget(
                                                  text: StringResource
                                                      .WalletBalance,
                                                  fontSize: FontSize.eleven,
                                                  colour: ColorResources
                                                      .color4F0437,
                                                  fontWeight:
                                                      FontWeights.normal,
                                                ),
                                                SizedBox(height: 4),
                                                Text_Widget(
                                                  text: "₹0.00",
                                                  fontSize: FontSize.nineteen,
                                                  colour: ColorResources
                                                      .color222222,
                                                  fontWeight:
                                                      FontWeights.normal,
                                                ),
                                                SizedBox(height: 36),
                                                Row(
                                                  children: [
                                                    GestureDetector(
                                                      onTap: () {
                                                        // Navigator.of(context).push(
                                                        //     MaterialPageRoute(
                                                        //         builder: (context) =>
                                                        //             AccountScreen()));
                                                      },
                                                      child: Container(
                                                        height: 38,
                                                        width: 100,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(15),
                                                          color: ColorResources
                                                              .colorFF781F,
                                                          border: Border.all(
                                                            color: ColorResources
                                                                .colorFF781F,
                                                            width: 1,
                                                          ),
                                                        ),
                                                        child: Center(
                                                          child: Text_Widget(
                                                            text: StringResource
                                                                .Accounts,
                                                            fontSize:
                                                                FontSize.eleven,
                                                            colour:
                                                                ColorResources
                                                                    .colorFFFFFF,
                                                            fontWeight:
                                                                FontWeights
                                                                    .normal,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(width: 14.63),
                                                    Text(
                                                      'Statement',
                                                      style: TextStyle(
                                                        color: ColorResources
                                                            .color222222,
                                                        fontSize:
                                                            FontSize.eleven,
                                                        fontWeight:
                                                            FontWeights.normal,
                                                        decoration:
                                                            TextDecoration
                                                                .underline,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(height: 10),
                                                Text(
                                                  'UPI ID 6202589829@pockets',
                                                  style: TextStyle(
                                                    color: ColorResources
                                                        .color222222,
                                                    fontSize: FontSize.eleven,
                                                    fontWeight:
                                                        FontWeights.normal,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 13),
                                        child: Container(
                                          width: 204,
                                          height: 234,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage(ImageResource
                                                    .containerFitz),
                                                fit: BoxFit.cover,
                                              ),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(20)),
                                              color:
                                                  ColorResources.color060145),
                                          child: Padding(
                                            padding: const EdgeInsets.all(13.0),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text_Widget(
                                                  text: StringResource
                                                      .LinkyourBankAccount,
                                                  fontSize: FontSize.sixteen,
                                                  colour: ColorResources
                                                      .colorFFFFFF,
                                                  fontWeight:
                                                      FontWeights.normal,
                                                ),
                                                SizedBox(height: 6.5),
                                                Text_Widget(
                                                  text: StringResource
                                                      .Duisauteiruredolorinreprehenderitinvoluptate,
                                                  fontSize: FontSize.eleven,
                                                  colour: ColorResources
                                                      .colorFFFFFF,
                                                  fontWeight:
                                                      FontWeights.normal,
                                                ),
                                                SizedBox(height: 70),
                                                GestureDetector(
                                                  onTap: () {
                                                    // Navigator.of(context).push(
                                                    //     MaterialPageRoute(
                                                    //         builder: (context) =>
                                                    //             AccountScreen()));
                                                  },
                                                  child: Container(
                                                    height: 38,
                                                    width: 100,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15),
                                                      color: ColorResources
                                                          .colorED2020,
                                                      border: Border.all(
                                                        color: ColorResources
                                                            .colorED2020,
                                                        width: 1,
                                                      ),
                                                    ),
                                                    child: Center(
                                                      child: Text_Widget(
                                                        text: StringResource
                                                            .Accounts,
                                                        fontSize:
                                                            FontSize.eleven,
                                                        colour: ColorResources
                                                            .colorFFFFFF,
                                                        fontWeight:
                                                            FontWeights.normal,
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
                                  ),
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
                                padding: EdgeInsets.all(16.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: double.infinity,
                                      height: 120,
                                      decoration: BoxDecoration(
                                        color: ColorResources.color060145,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    ),
                                    SizedBox(height: 16.0),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text_Widget(
                                        text: StringResource.TrendingServices,
                                        fontSize: FontSize.twenty,
                                        colour: ColorResources.color222222,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    SizedBox(
                                        height: 200,
                                        child: GridView.count(
                                            crossAxisCount: 4,
                                            crossAxisSpacing: 0,
                                            mainAxisSpacing: 8.0,
                                            children: List.generate(8, (index) {
                                              return Container(
                                                child: Center(
                                                  child: Column(
                                                    children: [
                                                      trendServiceList[index]
                                                              .newBool
                                                          ? Text("New")
                                                          : SizedBox(),
                                                      Image.asset(
                                                          trendServiceList[
                                                                  index]
                                                              .image),
                                                    ],
                                                  ),
                                                ),
                                              );
                                            }))),
                                    SizedBox(height: 16.0),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ServiceScreen()));
                                      },
                                      child: Center(
                                        child: Container(
                                          height: 40,
                                          width: 133,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            color: ColorResources.colorFFFFFF,
                                          ),
                                          child: Center(
                                            child: Row(
                                              children: [
                                                Text_Widget(
                                                  text: StringResource
                                                      .SeeAllServices,
                                                  fontSize: FontSize.twelve,
                                                  colour: ColorResources
                                                      .color222222,
                                                  fontWeight:
                                                      FontWeights.normal,
                                                ),
                                                SizedBox(width: 6),
                                                Icon(Icons.navigate_next)
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 24),
                                    Container(
                                      height: 175,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                          color: ColorResources.color00000040,
                                          borderRadius:
                                              BorderRadius.circular(18)),
                                    )
                                  ],
                                ),
                              ),
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
