import 'package:assessment/Widget/text_widget.dart';
import 'package:assessment/data/ThemeNotifier.dart';
import 'package:assessment/data/color.dart';
import 'package:assessment/data/more_option_list.dart';
import 'package:assessment/screens/accounts_screen/bloc/account_bloc.dart';
import 'package:assessment/utils/color_resource.dart';
import 'package:assessment/utils/font.dart';
import 'package:assessment/utils/image_resource.dart';
import 'package:assessment/utils/string_resource.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccountScreen extends StatefulWidget {
  AccountScreen({Key? key}) : super(key: key);

  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  late AccountBloc accountBloc;
  late int selectedValue = 1;
  late int selectedCardValue = 0;
  late int tabBarValue = 0;
  late SharedPreferences prefs;
  late String ImageCardValue = ImageResource.card1;

  @override
  void initState() {
    super.initState();
    accountBloc = AccountBloc()..add(AccountInitailEvent());

    SharedPreferences.getInstance().then((pref) {
      setState(() {
        selectedValue = pref.getInt('themeKey') ?? 1;
        selectedCardValue = pref.getInt('cardValueIndexKey') ?? 0;
        ImageCardValue = pref.getString('cardValueKey') ?? ImageResource.card1;
      });
      print(selectedValue);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AccountBloc, AccountState>(
      bloc: accountBloc,
      listener: (context, state) {},
      child: BlocBuilder<AccountBloc, AccountState>(
        bloc: accountBloc,
        builder: (context, state) {
          if (state is AccountLoadingState) {
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else if (state is AccountLoadedState) {
            return Scaffold(
              backgroundColor: Theme.of(context).primaryColor,
              appBar: AppBar(
                elevation: 0.0,
                leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back),
                  color: ColorResources.colorFFFFFF,
                ),
                title: Text_Widget(
                  text: StringResource.Accounts,
                  fontSize: FontSize.twentyfive,
                  colour: ColorResources.colorFFFFFF,
                  fontWeight: FontWeights.bold,
                ),
                actions: [
                  IconButton(onPressed: () {}, icon: Icon(Icons.settings))
                ],
              ),
              body: SingleChildScrollView(
                child: DefaultTabController(
                  length: 2,
                  child: Column(
                    children: [
                      Center(
                        child: Stack(
                          children: [
                            SizedBox(height: 16),
                            tabBarValue == 0
                                ? Center(
                                    child: Container(
                                      alignment: Alignment.center,
                                      width: MediaQuery.of(context).size.width -
                                          76,
                                      height: 360,
                                      decoration: BoxDecoration(
                                        image: new DecorationImage(
                                          image:
                                              new AssetImage(ImageResource.bg1),
                                          fit: BoxFit.fill,
                                        ),
                                        //borderRadius: BorderRadius.circular(15),

                                        border: Border.all(
                                          width: 1,
                                          color: ColorResources.colorFFFFFF,
                                        ),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15)),
                                      ),
                                      child: Column(
                                        children: [
                                          ListTile(
                                            leading: CircleAvatar(
                                              radius: 23,
                                            ),
                                            title: Text_Widget(
                                              text: "Prince Pockets",
                                              fontSize: FontSize.thirteen,
                                              colour:
                                                  ColorResources.colorFFFFFF,
                                              fontWeight: FontWeights.normal,
                                            ),
                                            subtitle: Text_Widget(
                                              text: "Good to see you back!",
                                              fontSize: FontSize.ten,
                                              colour:
                                                  ColorResources.colorFFFFFF,
                                              fontWeight: FontWeights.normal,
                                            ),
                                            trailing: Wrap(
                                              spacing:
                                                  12, // space between two icons
                                              children: <Widget>[
                                                Icon(
                                                  Icons.search,
                                                  color: ColorResources
                                                      .colorFFFFFF,
                                                  size: 30,
                                                ), // icon-1
                                                GestureDetector(
                                                  onTap: () {
                                                    setState(() {});
                                                  },
                                                  child: Icon(
                                                    Icons
                                                        .notifications_outlined,
                                                    color: ColorResources
                                                        .colorFFFFFF,
                                                    size: 30,
                                                  ),
                                                ), // icon-2
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            width: double.infinity,
                                            height: 235,
                                            child: ListView(
                                              scrollDirection: Axis.horizontal,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 13),
                                                  child: Container(
                                                    width: 204,
                                                    height: 234,
                                                    decoration: BoxDecoration(
                                                      image: DecorationImage(
                                                        image: AssetImage(
                                                            ImageResource
                                                                .containerMask),
                                                        fit: BoxFit.cover,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  20)),
                                                      gradient: LinearGradient(
                                                        colors: [
                                                          ColorResources
                                                              .colorFFFFFF,
                                                          ColorResources
                                                              .color4F0437,
                                                          ColorResources
                                                              .colorFFFFFF
                                                        ],
                                                      ),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              13.0),
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text_Widget(
                                                            text: StringResource
                                                                .PocketsWallet,
                                                            fontSize: FontSize
                                                                .sixteen,
                                                            colour:
                                                                ColorResources
                                                                    .color4F0437,
                                                            fontWeight:
                                                                FontWeights
                                                                    .normal,
                                                          ),
                                                          Text_Widget(
                                                            text:
                                                                "4336620203007654",
                                                            fontSize:
                                                                FontSize.eleven,
                                                            colour:
                                                                ColorResources
                                                                    .color4F0437,
                                                            fontWeight:
                                                                FontWeights
                                                                    .normal,
                                                          ),
                                                          SizedBox(height: 26),
                                                          Text_Widget(
                                                            text: StringResource
                                                                .WalletBalance,
                                                            fontSize:
                                                                FontSize.eleven,
                                                            colour:
                                                                ColorResources
                                                                    .color4F0437,
                                                            fontWeight:
                                                                FontWeights
                                                                    .normal,
                                                          ),
                                                          SizedBox(height: 4),
                                                          Text_Widget(
                                                            text: "₹0.00",
                                                            fontSize: FontSize
                                                                .nineteen,
                                                            colour:
                                                                ColorResources
                                                                    .color222222,
                                                            fontWeight:
                                                                FontWeights
                                                                    .normal,
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
                                                                child:
                                                                    Container(
                                                                  height: 38,
                                                                  width: 100,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            15),
                                                                    color: ColorResources
                                                                        .colorFF781F,
                                                                    border:
                                                                        Border
                                                                            .all(
                                                                      color: ColorResources
                                                                          .colorFF781F,
                                                                      width: 1,
                                                                    ),
                                                                  ),
                                                                  child: Center(
                                                                    child:
                                                                        Text_Widget(
                                                                      text: StringResource
                                                                          .Accounts,
                                                                      fontSize:
                                                                          FontSize
                                                                              .eleven,
                                                                      colour: ColorResources
                                                                          .colorFFFFFF,
                                                                      fontWeight:
                                                                          FontWeights
                                                                              .normal,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                  width: 14.63),
                                                              Text(
                                                                'Statement',
                                                                style:
                                                                    TextStyle(
                                                                  color: ColorResources
                                                                      .color222222,
                                                                  fontSize:
                                                                      FontSize
                                                                          .eleven,
                                                                  fontWeight:
                                                                      FontWeights
                                                                          .normal,
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
                                                              fontSize: FontSize
                                                                  .eleven,
                                                              fontWeight:
                                                                  FontWeights
                                                                      .normal,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 13),
                                                  child: Container(
                                                    width: 204,
                                                    height: 234,
                                                    decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                          image: AssetImage(
                                                              ImageResource
                                                                  .containerFitz),
                                                          fit: BoxFit.cover,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    20)),
                                                        color: ColorResources
                                                            .color060145),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              13.0),
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text_Widget(
                                                            text: StringResource
                                                                .LinkyourBankAccount,
                                                            fontSize: FontSize
                                                                .sixteen,
                                                            colour:
                                                                ColorResources
                                                                    .colorFFFFFF,
                                                            fontWeight:
                                                                FontWeights
                                                                    .normal,
                                                          ),
                                                          SizedBox(height: 6.5),
                                                          Text_Widget(
                                                            text: StringResource
                                                                .Duisauteiruredolorinreprehenderitinvoluptate,
                                                            fontSize:
                                                                FontSize.eleven,
                                                            colour:
                                                                ColorResources
                                                                    .colorFFFFFF,
                                                            fontWeight:
                                                                FontWeights
                                                                    .normal,
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
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            15),
                                                                color: ColorResources
                                                                    .colorED2020,
                                                                border:
                                                                    Border.all(
                                                                  color: ColorResources
                                                                      .colorED2020,
                                                                  width: 1,
                                                                ),
                                                              ),
                                                              child: Center(
                                                                child:
                                                                    Text_Widget(
                                                                  text: StringResource
                                                                      .Accounts,
                                                                  fontSize:
                                                                      FontSize
                                                                          .eleven,
                                                                  colour: ColorResources
                                                                      .colorFFFFFF,
                                                                  fontWeight:
                                                                      FontWeights
                                                                          .normal,
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
                                        ],
                                      ),
                                    ),
                                  )
                                : Center(
                                    child: Container(
                                      alignment: Alignment.center,
                                      width: 240,
                                      height: 315,
                                      decoration: BoxDecoration(
                                        image: new DecorationImage(
                                          image: new AssetImage(ImageCardValue),
                                          fit: BoxFit.cover,
                                        ),
                                        border: Border.all(
                                          width: 1,
                                          color: ColorResources.colorFFFFFF,
                                        ),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(23.5)),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text_Widget(
                                            text: StringResource.PocketsWallet,
                                            fontSize: FontSize.twentytwo,
                                            colour: ColorResources.colorFFFFFF,
                                            fontWeight: FontWeight.w700,
                                          ),
                                          Text_Widget(
                                            text: "4336620203007654",
                                            fontSize: FontSize.sixteen,
                                            colour: ColorResources.colorFFFFFF,
                                            fontWeight: FontWeight.w400,
                                          ),
                                          SizedBox(height: 67),
                                          GestureDetector(
                                            onTap: () {},
                                            child: Container(
                                              height: 47,
                                              width: 189,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                color: ColorResources
                                                    .color00000040,
                                                border: Border.all(
                                                  color: ColorResources
                                                      .colorFFFFFF,
                                                  width: 1,
                                                ),
                                              ),
                                              child: Center(
                                                child: Text_Widget(
                                                  text: StringResource.Accounts,
                                                  fontSize: FontSize.eleven,
                                                  colour: ColorResources
                                                      .colorFFFFFF,
                                                  fontWeight:
                                                      FontWeights.normal,
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 20)
                                        ],
                                      ),
                                    ),
                                  ),
                            customModelBottomSheet(context)
                          ],
                        ),
                      ),
                    ],
                  ),
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

  Container customModelBottomSheet(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context, listen: false);
    return Container(
      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height - 442),
      height: 392,
      color: Colors.transparent,
      child: Container(
        decoration: new BoxDecoration(
            color: Colors.white,
            borderRadius: new BorderRadius.only(
                topLeft: const Radius.circular(23.0),
                topRight: const Radius.circular(23.0))),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24.0,
                vertical: 16,
              ),
              child: Column(
                children: [
                  Container(
                    height: 44,
                    width: 334,
                    decoration: BoxDecoration(
                      color: ColorResources.colorBFCBD720,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 4,
                        vertical: 6,
                      ),
                      child: TabBar(
                        onTap: (index) {
                          setState(() {
                            tabBarValue = index;
                          });
                          print(index);
                        },
                        isScrollable: false,
                        indicator: BoxDecoration(
                          color: ColorResources.colorFFFFFF,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        labelColor: ColorResources.color222222,
                        labelStyle: TextStyle(
                            fontSize: FontSize.sixteen,
                            fontWeight: FontWeight.w700),
                        tabs: [
                          Tab(text: StringResource.AppTheme),
                          Tab(text: StringResource.CardTheme),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 300,
                    child: TabBarView(
                      children: [
                        Container(
                            height: 250,
                            child: Column(
                              children: [
                                SizedBox(height: 40),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      children: [
                                        Stack(
                                          alignment: Alignment.topRight,
                                          children: [
                                            Container(
                                              child: selectedValue == 1
                                                  ? Icon(
                                                      Icons.check_circle,
                                                      color: ColorResources
                                                          .color10CB00,
                                                    )
                                                  : SizedBox(),
                                            ),
                                            Container(
                                              padding: EdgeInsets.all(5.0),
                                              child: GestureDetector(
                                                onTap: () {
                                                  themeNotifier
                                                      .setTheme(defaultTheme);
                                                  print("1");

                                                  setState(() {
                                                    selectedValue = 1;
                                                    SharedPreferences
                                                            .getInstance()
                                                        .then((pref) {
                                                      pref.setInt('themeKey',
                                                          selectedValue);
                                                    });
                                                  });
                                                },
                                                child: Container(
                                                  height: 65,
                                                  decoration: BoxDecoration(
                                                    color: ColorResources
                                                        .colorBFCBD720,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12),
                                                  ),
                                                  child: Image.asset(
                                                      ImageResource
                                                          .groupCircle),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 6),
                                        Text_Widget(
                                          text: "Theme 1",
                                          fontSize: FontSize.twelve,
                                          colour: ColorResources.color222222,
                                          fontWeight: FontWeights.normal,
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Stack(
                                          alignment: Alignment.topRight,
                                          children: [
                                            Container(
                                              child: selectedValue == 2
                                                  ? Icon(
                                                      Icons.check_circle,
                                                      color: ColorResources
                                                          .color10CB00,
                                                    )
                                                  : SizedBox(),
                                            ),
                                            Container(
                                              padding: EdgeInsets.all(5.0),
                                              child: GestureDetector(
                                                onTap: () {
                                                  themeNotifier
                                                      .setTheme(blueTheme);

                                                  setState(() {
                                                    selectedValue = 2;
                                                    SharedPreferences
                                                            .getInstance()
                                                        .then((pref) {
                                                      pref.setInt('themeKey',
                                                          selectedValue);
                                                    });
                                                  });
                                                },
                                                child: Container(
                                                  height: 65,
                                                  decoration: BoxDecoration(
                                                    color: ColorResources
                                                        .colorBFCBD720,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12),
                                                  ),
                                                  child: Image.asset(
                                                      ImageResource
                                                          .groupCircle),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 6),
                                        Text_Widget(
                                          text: "Theme 2",
                                          fontSize: FontSize.twelve,
                                          colour: ColorResources.color222222,
                                          fontWeight: FontWeights.normal,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(height: 20),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      children: [
                                        Stack(
                                          alignment: Alignment.topRight,
                                          children: [
                                            Container(
                                              child: selectedValue == 3
                                                  ? Icon(
                                                      Icons.check_circle,
                                                      color: ColorResources
                                                          .color10CB00,
                                                    )
                                                  : SizedBox(),
                                            ),
                                            Container(
                                              padding: EdgeInsets.all(5.0),
                                              child: GestureDetector(
                                                onTap: () {
                                                  themeNotifier
                                                      .setTheme(spookyTheme);

                                                  setState(() {
                                                    selectedValue = 3;
                                                    SharedPreferences
                                                            .getInstance()
                                                        .then((pref) {
                                                      pref.setInt('themeKey',
                                                          selectedValue);
                                                    });
                                                  });
                                                },
                                                child: Container(
                                                  height: 65,
                                                  decoration: BoxDecoration(
                                                    color: ColorResources
                                                        .colorBFCBD720,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12),
                                                  ),
                                                  child: Image.asset(
                                                      ImageResource
                                                          .groupCircle),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 6),
                                        Text_Widget(
                                          text: "Theme 3",
                                          fontSize: FontSize.twelve,
                                          colour: ColorResources.color222222,
                                          fontWeight: FontWeights.normal,
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Stack(
                                          alignment: Alignment.topRight,
                                          children: [
                                            Container(
                                              child: selectedValue == 4
                                                  ? Icon(
                                                      Icons.check_circle,
                                                      color: ColorResources
                                                          .color10CB00,
                                                    )
                                                  : SizedBox(),
                                            ),
                                            Container(
                                              padding: EdgeInsets.all(5.0),
                                              child: GestureDetector(
                                                onTap: () {
                                                  themeNotifier
                                                      .setTheme(pinkTheme);

                                                  setState(() {
                                                    selectedValue = 4;
                                                    SharedPreferences
                                                            .getInstance()
                                                        .then((pref) {
                                                      pref.setInt('themeKey',
                                                          selectedValue);
                                                    });
                                                  });
                                                },
                                                child: Container(
                                                  height: 65,
                                                  decoration: BoxDecoration(
                                                    color: ColorResources
                                                        .colorBFCBD720,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12),
                                                  ),
                                                  child: Image.asset(
                                                      ImageResource
                                                          .groupCircle),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 6),
                                        Text_Widget(
                                          text: "Theme 4",
                                          fontSize: FontSize.twelve,
                                          colour: ColorResources.color222222,
                                          fontWeight: FontWeights.normal,
                                        ),
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            )),
                        Container(
                          height: 250,
                          child: Column(
                            children: [
                              SizedBox(height: 33),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text_Widget(
                                    text: StringResource.SelectyourCardTheme,
                                    fontSize: FontSize.twelve,
                                    colour: ColorResources.color787878,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  Row(
                                    children: [
                                      Text_Widget(
                                        text: StringResource.AllTheme,
                                        fontSize: FontSize.fourteen,
                                        colour: ColorResources.color222222,
                                        fontWeight: FontWeight.w700,
                                      ),
                                      SizedBox(width: 14),
                                      Icon(
                                        Icons.keyboard_arrow_down,
                                        color: ColorResources.color787878,
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 12),
                              SizedBox(
                                width: double.infinity,
                                height: 230,
                                child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: 3,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 12),
                                        child: GestureDetector(
                                          onTap: () async {
                                            SharedPreferences prefs =
                                                await SharedPreferences
                                                    .getInstance();
                                            setState(() {
                                              ImageCardValue =
                                                  cardThemeList[index]['image'];

                                              selectedCardValue = index;
                                            });
                                            prefs.setString(
                                                'cardValueKey', ImageCardValue);
                                            prefs.setInt('cardValueIndexKey',
                                                selectedCardValue);
                                          },
                                          child: Container(
                                            width: 158,
                                            height: 227,
                                            decoration: BoxDecoration(
                                              image: new DecorationImage(
                                                image: new AssetImage(
                                                    cardThemeList[index]
                                                        ['image']),
                                                fit: BoxFit.cover,
                                              ),
                                              border: Border.all(
                                                width: 1,
                                                color:
                                                    ColorResources.colorFFFFFF,
                                              ),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(15)),
                                            ),
                                            child: selectedCardValue == index
                                                ? Center(
                                                    child: Icon(
                                                    Icons.check_circle,
                                                    color: ColorResources
                                                        .color10CB00,
                                                    size: 40,
                                                  ))
                                                : SizedBox(),
                                          ),
                                        ),
                                      );
                                    }),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Future<dynamic> bottomsheet(BuildContext context) {
  //   final themeNotifier = Provider.of<ThemeNotifier>(context, listen: false);
  //   return showModalBottomSheet(
  //     shape: RoundedRectangleBorder(
  //       borderRadius: BorderRadius.only(
  //           topLeft: const Radius.circular(23.0),
  //           topRight: const Radius.circular(23.0)),
  //     ),
  //     context: context,
  //     builder: (context) => BlocListener<ThemeBloc, ThemeState>(
  //       bloc: themeBloc,
  //       listener: (context, state) {},
  //       child: Container(
  //         height: 392,
  //         color: Colors.transparent,
  //         child: new Container(
  //           decoration: new BoxDecoration(
  //               color: Colors.white,
  //               borderRadius: new BorderRadius.only(
  //                   topLeft: const Radius.circular(23.0),
  //                   topRight: const Radius.circular(23.0))),
  //           child: Column(
  //             children: [
  //               DefaultTabController(
  //                 length: 2,
  //                 child: Padding(
  //                   padding: const EdgeInsets.symmetric(
  //                     horizontal: 24.0,
  //                     vertical: 16,
  //                   ),
  //                   child: Column(
  //                     children: [
  //                       Container(
  //                         height: 44,
  //                         width: 334,
  //                         decoration: BoxDecoration(
  //                           color: ColorResources.colorBFCBD720,
  //                           borderRadius: BorderRadius.circular(12),
  //                         ),
  //                         child: Padding(
  //                           padding: const EdgeInsets.symmetric(
  //                             horizontal: 4,
  //                             vertical: 6,
  //                           ),
  //                           child: TabBar(
  //                             indicator: BoxDecoration(
  //                               color: ColorResources.colorFFFFFF,
  //                               borderRadius: BorderRadius.circular(12),
  //                             ),
  //                             labelColor: ColorResources.color222222,
  //                             labelStyle: TextStyle(
  //                                 fontSize: FontSize.sixteen,
  //                                 fontWeight: FontWeight.w700),
  //                             tabs: [
  //                               Tab(text: StringResource.AppTheme),
  //                               Tab(text: StringResource.CardTheme),
  //                             ],
  //                           ),
  //                         ),
  //                       ),
  //                       SizedBox(
  //                         height: 300,
  //                         child: TabBarView(
  //                           children: [
  //                             Container(
  //                                 height: 250,
  //                                 child: Column(
  //                                   children: [
  //                                     SizedBox(height: 40),
  //                                     Row(
  //                                       mainAxisAlignment:
  //                                           MainAxisAlignment.spaceBetween,
  //                                       children: [
  //                                         Column(
  //                                           children: [
  //                                             Stack(
  //                                               alignment: Alignment.topRight,
  //                                               children: [
  //                                                 Container(
  //                                                   child: selectedValue == 1
  //                                                       ? Icon(
  //                                                           Icons.check_circle,
  //                                                           color: ColorResources
  //                                                               .color10CB00,
  //                                                         )
  //                                                       : SizedBox(),
  //                                                 ),
  //                                                 Container(
  //                                                   padding:
  //                                                       EdgeInsets.all(5.0),
  //                                                   child: GestureDetector(
  //                                                     onTap: () {
  //                                                       themeNotifier.setTheme(
  //                                                           defaultTheme);
  //                                                       print("1");

  //                                                       setState(() {
  //                                                         selectedValue = 1;
  //                                                         SharedPreferences
  //                                                                 .getInstance()
  //                                                             .then((pref) {
  //                                                           pref.setInt(
  //                                                               'themeKey',
  //                                                               selectedValue);
  //                                                         });
  //                                                       });
  //                                                     },
  //                                                     child: Container(
  //                                                       height: 65,
  //                                                       decoration:
  //                                                           BoxDecoration(
  //                                                         color: ColorResources
  //                                                             .colorBFCBD720,
  //                                                         borderRadius:
  //                                                             BorderRadius
  //                                                                 .circular(12),
  //                                                       ),
  //                                                       child: Image.asset(
  //                                                           ImageResource
  //                                                               .groupCircle),
  //                                                     ),
  //                                                   ),
  //                                                 ),
  //                                               ],
  //                                             ),
  //                                             SizedBox(height: 6),
  //                                             Text_Widget(
  //                                               text: "Theme 1",
  //                                               fontSize: FontSize.twelve,
  //                                               colour:
  //                                                   ColorResources.color222222,
  //                                               fontWeight: FontWeights.normal,
  //                                             ),
  //                                           ],
  //                                         ),
  //                                         Column(
  //                                           children: [
  //                                             Stack(
  //                                               alignment: Alignment.topRight,
  //                                               children: [
  //                                                 Container(
  //                                                   child: selectedValue == 2
  //                                                       ? Icon(
  //                                                           Icons.check_circle,
  //                                                           color: ColorResources
  //                                                               .color10CB00,
  //                                                         )
  //                                                       : SizedBox(),
  //                                                 ),
  //                                                 Container(
  //                                                   padding:
  //                                                       EdgeInsets.all(5.0),
  //                                                   child: GestureDetector(
  //                                                     onTap: () {
  //                                                       themeNotifier.setTheme(
  //                                                           blueTheme);

  //                                                       setState(() {
  //                                                         selectedValue = 2;
  //                                                         SharedPreferences
  //                                                                 .getInstance()
  //                                                             .then((pref) {
  //                                                           pref.setInt(
  //                                                               'themeKey',
  //                                                               selectedValue);
  //                                                         });
  //                                                       });
  //                                                     },
  //                                                     child: Container(
  //                                                       height: 65,
  //                                                       decoration:
  //                                                           BoxDecoration(
  //                                                         color: ColorResources
  //                                                             .colorBFCBD720,
  //                                                         borderRadius:
  //                                                             BorderRadius
  //                                                                 .circular(12),
  //                                                       ),
  //                                                       child: Image.asset(
  //                                                           ImageResource
  //                                                               .groupCircle),
  //                                                     ),
  //                                                   ),
  //                                                 ),
  //                                               ],
  //                                             ),
  //                                             SizedBox(height: 6),
  //                                             Text_Widget(
  //                                               text: "Theme 2",
  //                                               fontSize: FontSize.twelve,
  //                                               colour:
  //                                                   ColorResources.color222222,
  //                                               fontWeight: FontWeights.normal,
  //                                             ),
  //                                           ],
  //                                         ),
  //                                       ],
  //                                     ),
  //                                     SizedBox(height: 20),
  //                                     Row(
  //                                       mainAxisAlignment:
  //                                           MainAxisAlignment.spaceBetween,
  //                                       children: [
  //                                         Column(
  //                                           children: [
  //                                             Stack(
  //                                               alignment: Alignment.topRight,
  //                                               children: [
  //                                                 Container(
  //                                                   child: selectedValue == 3
  //                                                       ? Icon(
  //                                                           Icons.check_circle,
  //                                                           color: ColorResources
  //                                                               .color10CB00,
  //                                                         )
  //                                                       : SizedBox(),
  //                                                 ),
  //                                                 Container(
  //                                                   padding:
  //                                                       EdgeInsets.all(5.0),
  //                                                   child: GestureDetector(
  //                                                     onTap: () {
  //                                                       themeNotifier.setTheme(
  //                                                           spookyTheme);

  //                                                       setState(() {
  //                                                         selectedValue = 3;
  //                                                         SharedPreferences
  //                                                                 .getInstance()
  //                                                             .then((pref) {
  //                                                           pref.setInt(
  //                                                               'themeKey',
  //                                                               selectedValue);
  //                                                         });
  //                                                       });
  //                                                     },
  //                                                     child: Container(
  //                                                       height: 65,
  //                                                       decoration:
  //                                                           BoxDecoration(
  //                                                         color: ColorResources
  //                                                             .colorBFCBD720,
  //                                                         borderRadius:
  //                                                             BorderRadius
  //                                                                 .circular(12),
  //                                                       ),
  //                                                       child: Image.asset(
  //                                                           ImageResource
  //                                                               .groupCircle),
  //                                                     ),
  //                                                   ),
  //                                                 ),
  //                                               ],
  //                                             ),
  //                                             SizedBox(height: 6),
  //                                             Text_Widget(
  //                                               text: "Theme 3",
  //                                               fontSize: FontSize.twelve,
  //                                               colour:
  //                                                   ColorResources.color222222,
  //                                               fontWeight: FontWeights.normal,
  //                                             ),
  //                                           ],
  //                                         ),
  //                                         Column(
  //                                           children: [
  //                                             Stack(
  //                                               alignment: Alignment.topRight,
  //                                               children: [
  //                                                 Container(
  //                                                   child: selectedValue == 4
  //                                                       ? Icon(
  //                                                           Icons.check_circle,
  //                                                           color: ColorResources
  //                                                               .color10CB00,
  //                                                         )
  //                                                       : SizedBox(),
  //                                                 ),
  //                                                 Container(
  //                                                   padding:
  //                                                       EdgeInsets.all(5.0),
  //                                                   child: GestureDetector(
  //                                                     onTap: () {
  //                                                       themeNotifier.setTheme(
  //                                                           pinkTheme);

  //                                                       setState(() {
  //                                                         selectedValue = 4;
  //                                                         SharedPreferences
  //                                                                 .getInstance()
  //                                                             .then((pref) {
  //                                                           pref.setInt(
  //                                                               'themeKey',
  //                                                               selectedValue);
  //                                                         });
  //                                                       });
  //                                                     },
  //                                                     child: Container(
  //                                                       height: 65,
  //                                                       decoration:
  //                                                           BoxDecoration(
  //                                                         color: ColorResources
  //                                                             .colorBFCBD720,
  //                                                         borderRadius:
  //                                                             BorderRadius
  //                                                                 .circular(12),
  //                                                       ),
  //                                                       child: Image.asset(
  //                                                           ImageResource
  //                                                               .groupCircle),
  //                                                     ),
  //                                                   ),
  //                                                 ),
  //                                               ],
  //                                             ),
  //                                             SizedBox(height: 6),
  //                                             Text_Widget(
  //                                               text: "Theme 4",
  //                                               fontSize: FontSize.twelve,
  //                                               colour:
  //                                                   ColorResources.color222222,
  //                                               fontWeight: FontWeights.normal,
  //                                             ),
  //                                           ],
  //                                         ),
  //                                       ],
  //                                     )
  //                                   ],
  //                                 )),
  //                             Container()
  //                           ],
  //                         ),
  //                       )
  //                     ],
  //                   ),
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }
}
