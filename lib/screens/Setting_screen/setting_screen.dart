import 'dart:io';

import 'package:assessment/Widget/text_widget.dart';
import 'package:assessment/data/more_option_list.dart';
import 'package:assessment/screens/Setting_screen/bloc/settings_bloc.dart';
import 'package:assessment/screens/refer_earn_screen/refer_earn_screen.dart';
import 'package:assessment/utils/color_resource.dart';
import 'package:assessment/utils/font.dart';
import 'package:assessment/utils/image_resource.dart';
import 'package:assessment/utils/string_resource.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsScreen extends StatefulWidget {
  SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late SettingsBloc settingsBloc;
  late bool switchValue = false;
  File? image;
  String path = "";
  Future pickImageFromGallery() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemporary = File(image.path);

      setState(() {
        this.image = imageTemporary;
        this.path = image.path;
      });
      print(path);
      prefs.setString('profileImage', path);
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    settingsBloc = SettingsBloc()..add(SettingsInitailEvent());
    print(list.length);
    getImage();
  }

  getImage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      this.path = prefs.getString('profileImage') ?? "";
      this.switchValue = prefs.getBool('fingerAuth') ?? false;
      print(path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SettingsBloc, SettingsState>(
      bloc: settingsBloc,
      listener: (context, state) {},
      child: BlocBuilder<SettingsBloc, SettingsState>(
        bloc: settingsBloc,
        builder: (context, state) {
          if (state is SettingsLoadingState) {
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else if (state is SettingsLoadedState) {
            return Scaffold(
              backgroundColor: ColorResources.colorFAFAFA,
              appBar: AppBar(
                leading: Icon(
                  Icons.arrow_back,
                  color: ColorResources.colorFFFFFF,
                ),
                title: Text_Widget(
                  text: StringResource.Settings,
                  fontSize: FontSize.twentyfive,
                  colour: ColorResources.colorFFFFFF,
                  fontWeight: FontWeights.bold,
                ),
              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    color: ColorResources.colorFAFAFA,
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 16.0),
                          width: double.infinity,
                          height: 175,
                          child: Stack(
                            children: [
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                  width: double.infinity,
                                  height: 135,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.white,
                                    border: Border.all(
                                      color: ColorResources.colorFFFFFF,
                                      width: 1,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: FontSize.twelve,
                                        left: FontSize.twentyfour),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text_Widget(
                                          text: StringResource.Overview,
                                          fontSize: FontSize.twelve,
                                          colour: ColorResources.color787878,
                                          fontWeight: FontWeights.normal,
                                        ),
                                        Text_Widget(
                                          text: StringResource.Jones,
                                          fontSize: FontSize.twentyfour,
                                          colour: ColorResources.color222222,
                                          fontWeight: FontWeights.normal,
                                        ),
                                        SizedBox(height: FontSize.seventeen),
                                        Container(
                                          height: 47,
                                          width: 122,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            color: Colors.white,
                                            border: Border.all(
                                              color: ColorResources.colorFF781F,
                                              width: 1,
                                            ),
                                          ),
                                          child: Center(
                                            child: Text_Widget(
                                              text: StringResource.Accounts,
                                              fontSize: FontSize.sixteen,
                                              colour:
                                                  ColorResources.color222222,
                                              fontWeight: FontWeights.normal,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.topRight,
                                child: Container(
                                  margin: EdgeInsets.only(right: 16.0),
                                  width: 107,
                                  height: 105,
                                  child: Stack(
                                    children: [
                                      path != ""
                                          ? ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(52.5),
                                              child: Image.file(
                                                File(path),
                                                width: 160,
                                                height: 160,
                                                fit: BoxFit.cover,
                                              ),
                                            )
                                          : CircleAvatar(
                                              backgroundImage: AssetImage(
                                                  ImageResource.profile),
                                              radius: 52.5,
                                            ),
                                      Align(
                                        alignment: Alignment.bottomCenter,
                                        child: GestureDetector(
                                          onTap: () =>
                                              pickImageFromGallery(), //sendotp,
                                          child: Container(
                                            width: 78,
                                            height: 18,
                                            decoration: BoxDecoration(
                                              color: ColorResources.color641653,
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      FontSize.thirty),
                                            ),
                                            child: Center(
                                              child: Text_Widget(
                                                text:
                                                    StringResource.ViewProfile,
                                                fontSize: FontSize.ten,
                                                colour:
                                                    ColorResources.colorFFFFFF,
                                                fontWeight: FontWeights.normal,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        // SizedBox(height: FontSize.thirtytwo),
                        // Padding(
                        //   padding: const EdgeInsets.only(left: FontSize.twelve),
                        //   child: Align(
                        //     alignment: Alignment.centerLeft,
                        //     child: Text_Widget(
                        //       text: StringResource.Security,
                        //       fontSize: FontSize.twenty,
                        //       colour: ColorResources.color222222,
                        //       fontWeight: FontWeights.bold,
                        //     ),
                        //   ),
                        // ),
                        // SizedBox(height: FontSize.twelve),
                        // Container(
                        //   width: double.infinity,
                        //   height: 120,
                        //   decoration: BoxDecoration(
                        //     borderRadius: BorderRadius.circular(15),
                        //     color: Colors.white,
                        //     border: Border.all(
                        //       color: ColorResources.colorFFFFFF,
                        //       width: 1,
                        //     ),
                        //   ),
                        //   child: Column(
                        //     children: [
                        //       ListTile(
                        //         leading: Image.asset(ImageResource.faceIcon),
                        //         title: Text_Widget(
                        //           text: StringResource.SecurewithFaceID,
                        //           fontSize: FontSize.sixteen,
                        //           colour: ColorResources.color222222,
                        //           fontWeight: FontWeights.normal,
                        //         ),
                        //         trailing: CupertinoSwitch(
                        //           trackColor: ColorResources.color222222,
                        //           activeColor: ColorResources.color641653,
                        //           value: switchValue,
                        //           onChanged: (newvalue) {
                        //             setState(() {
                        //               switchValue = newvalue;
                        //               showDialog(
                        //                 context: context,
                        //                 builder: (_) => AlertDialog(
                        //                   title: const Text(StringResource
                        //                       .SwichChangeSuccessfully),
                        //                   content: Text(
                        //                       StringResource.Switchvalueis +
                        //                           switchValue.toString()),
                        //                 ),
                        //               );
                        //             });
                        //           },
                        //         ),
                        //       ),
                        //       ListTile(
                        //         leading: Image.asset(ImageResource.changeIcon),
                        //         title: Text_Widget(
                        //           text: StringResource.ChangePasscode,
                        //           fontSize: FontSize.sixteen,
                        //           colour: ColorResources.color222222,
                        //           fontWeight: FontWeights.normal,
                        //         ),
                        //         trailing: Icon(
                        //           FontAwesomeIcons.chevronRight,
                        //           color: ColorResources.colorFF781F,
                        //           size: FontSize.sixteen,
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        // SizedBox(height: FontSize.thirtytwo),
                        // Padding(
                        //   padding: const EdgeInsets.only(left: FontSize.twelve),
                        //   child: Align(
                        //     alignment: Alignment.centerLeft,
                        //     child: Text_Widget(
                        //       text: StringResource.Support,
                        //       fontSize: FontSize.twenty,
                        //       colour: ColorResources.color222222,
                        //       fontWeight: FontWeights.normal,
                        //     ),
                        //   ),
                        // ),
                        // SizedBox(height: FontSize.twelve),
                        // Container(
                        //   width: double.infinity,
                        //   height: 120,
                        //   decoration: BoxDecoration(
                        //     borderRadius: BorderRadius.circular(15),
                        //     color: Colors.white,
                        //     border: Border.all(
                        //       color: ColorResources.colorFFFFFF,
                        //       width: 1,
                        //     ),
                        //   ),
                        //   child: Column(
                        //     children: [
                        //       ListTile(
                        //         leading: Image.asset(ImageResource.faqIcon),
                        //         title: Text_Widget(
                        //           text: StringResource.FAQ,
                        //           fontSize: FontSize.sixteen,
                        //           colour: ColorResources.color222222,
                        //           fontWeight: FontWeights.normal,
                        //         ),
                        //         trailing: Icon(
                        //           FontAwesomeIcons.chevronRight,
                        //           color: ColorResources.colorFF781F,
                        //           size: FontSize.sixteen,
                        //         ),
                        //       ),
                        //       ListTile(
                        //         leading: Image.asset(ImageResource.supportIcon),
                        //         title: Text_Widget(
                        //           text: StringResource.Support,
                        //           fontSize: FontSize.sixteen,
                        //           colour: ColorResources.color222222,
                        //           fontWeight: FontWeights.bold,
                        //         ),
                        //         trailing: Icon(
                        //           FontAwesomeIcons.chevronRight,
                        //           color: ColorResources.colorFF781F,
                        //           size: FontSize.sixteen,
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: list.length,
                            itemBuilder: (contex, i) {
                              return Column(
                                children: [
                                  SizedBox(height: FontSize.thirtytwo),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: FontSize.twelve),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text_Widget(
                                        text: list[i][StringResource.name],
                                        fontSize: FontSize.twenty,
                                        colour: ColorResources.color222222,
                                        fontWeight: FontWeights.normal,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: FontSize.twelve),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Colors.white,
                                      border: Border.all(
                                        color: ColorResources.colorFFFFFF,
                                        width: 1,
                                      ),
                                    ),
                                    child: ListView.builder(
                                      physics: NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemCount: list[i]
                                              [StringResource.listItem]
                                          .length,
                                      itemBuilder: (context, index) {
                                        return GestureDetector(
                                          onTap: () {
                                            if (list[i][StringResource.listItem]
                                                        [index]
                                                    [StringResource.text] ==
                                                StringResource.ReferandEarn) {
                                              Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          ReferearnScreen()));
                                            }
                                          },
                                          child: ListTile(
                                            leading: Image.asset(list[i]
                                                    [StringResource.listItem]
                                                [index][StringResource.image]),
                                            title: Text_Widget(
                                              text: list[i]
                                                      [StringResource.listItem]
                                                  [index][StringResource.text],
                                              fontSize: FontSize.sixteen,
                                              colour: list[i]
                                                      [StringResource.listItem][
                                                  index][StringResource.colour],
                                              fontWeight: FontWeights.normal,
                                            ),
                                            trailing: list[i][StringResource
                                                            .listItem][index]
                                                        [StringResource.text] ==
                                                    StringResource
                                                        .SecurewithFaceID
                                                ? CupertinoSwitch(
                                                    trackColor: ColorResources
                                                        .color222222,
                                                    activeColor: ColorResources
                                                        .color641653,
                                                    value: switchValue,
                                                    onChanged:
                                                        (newvalue) async {
                                                      SharedPreferences prefs =
                                                          await SharedPreferences
                                                              .getInstance();
                                                      prefs.setBool(
                                                          'fingerAuth',
                                                          newvalue);

                                                      setState(() {
                                                        switchValue = newvalue;
                                                        showDialog(
                                                          context: context,
                                                          builder: (_) =>
                                                              AlertDialog(
                                                            title: const Text(
                                                                StringResource
                                                                    .SwichChangeSuccessfully),
                                                            content: Text(StringResource
                                                                    .Switchvalueis +
                                                                switchValue
                                                                    .toString()),
                                                          ),
                                                        );
                                                      });
                                                    },
                                                  )
                                                : Icon(
                                                    list[i][StringResource
                                                            .listItem][index]
                                                        [StringResource.icon],
                                                    color: ColorResources
                                                        .colorFF781F,
                                                    size: FontSize.sixteen,
                                                  ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              );
                            }),
                      ],
                    ),
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
}
