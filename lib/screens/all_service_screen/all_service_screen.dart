import 'dart:developer';

import 'package:assessment/Widget/text_widget.dart';
import 'package:assessment/data/more_option_list.dart';
import 'package:assessment/screens/all_service_screen/bloc/service_bloc.dart';
import 'package:assessment/utils/color_resource.dart';
import 'package:assessment/utils/font.dart';
import 'package:assessment/utils/string_resource.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search_page/search_page.dart';

class ServiceScreen extends StatefulWidget {
  ServiceScreen({Key? key}) : super(key: key);

  @override
  _ServiceScreenState createState() => _ServiceScreenState();
}

class _ServiceScreenState extends State<ServiceScreen> {
  late ServiceBloc serviceBloc;

  @override
  void initState() {
    super.initState();
    serviceBloc = ServiceBloc()..add(ServiceInitailEvent());
    print(allServiceList[0]['listItem'][0].image.toString());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ServiceBloc, ServiceState>(
      bloc: serviceBloc,
      listener: (context, state) {},
      child: BlocBuilder<ServiceBloc, ServiceState>(
        bloc: serviceBloc,
        builder: (context, state) {
          if (state is ServiceLoadingState) {
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else if (state is ServiceLoadedState) {
            return Scaffold(
              backgroundColor: ColorResources.colorFFFFFF,
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
                  text: StringResource.AllServices,
                  fontSize: FontSize.twentyfive,
                  colour: ColorResources.colorFFFFFF,
                  fontWeight: FontWeights.bold,
                ),
                actions: [
                  IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () => showSearch(
                        context: context,
                        delegate: SearchPage<dynamic>(
                          searchLabel: 'Search Contact',
                          builder: (service) => Center(
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Card(
                                child: SizedBox(
                                    height: 350,
                                    child: GridView.count(
                                        crossAxisCount: 4,
                                        crossAxisSpacing: 0,
                                        mainAxisSpacing: 8.0,
                                        children: List.generate(8, (index) {
                                          return Container(
                                            child: Center(
                                              child: Image.asset(service.image),
                                            ),
                                          );
                                        }))),
                              ),
                            ),
                          ),
                          filter: (service) => [
                            service.image.toString().toLowerCase(),
                          ],
                          items: allServiceList[0]['listItem'] +
                              allServiceList[1]['listItem'],
                        )),
                  ),
                ],
              ),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height - 110,
                      child: ListView.builder(
                          itemCount: newAllServiceList.length,
                          itemBuilder: (BuildContext context, int i) {
                            return Padding(
                              padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                              child: Card(
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    children: [
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Text_Widget(
                                          text: newAllServiceList[i]
                                              .titleName
                                              .toString(),
                                          fontSize: FontSize.twenty,
                                          colour: ColorResources.color222222,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      SizedBox(
                                          height:
                                              (newAllServiceList[i].noOfRow *
                                                  90.0),
                                          child: GridView.count(
                                              crossAxisCount: 4,
                                              crossAxisSpacing: 0,
                                              mainAxisSpacing: 8.0,
                                              children: List.generate(
                                                  newAllServiceList[i]
                                                              .ListOfIcons
                                                              .length <
                                                          (newAllServiceList[i]
                                                                      .noOfRow *
                                                                  4) -
                                                              1
                                                      ? newAllServiceList[i]
                                                          .ListOfIcons
                                                          .length
                                                      : (newAllServiceList[i]
                                                              .noOfRow *
                                                          4), (index) {
                                                return newAllServiceList[i]
                                                            .ListOfIcons
                                                            .length >
                                                        (newAllServiceList[i]
                                                                    .noOfRow *
                                                                4) -
                                                            2
                                                    ? Container(
                                                        width: 74,
                                                        child: index >
                                                                (newAllServiceList[i]
                                                                            .noOfRow *
                                                                        4) -
                                                                    2
                                                            ? GestureDetector(
                                                                onTap: () =>
                                                                    customModalBottomSheet(
                                                                        context,
                                                                        i),
                                                                child: (newAllServiceList[i].ListOfIcons.length -
                                                                            (newAllServiceList[i].noOfRow *
                                                                                4) -
                                                                            1 <=
                                                                        0)
                                                                    ? SizedBox()
                                                                    : Align(
                                                                        alignment:
                                                                            Alignment.bottomCenter,
                                                                        child:
                                                                            Container(
                                                                          child:
                                                                              Column(
                                                                            children: [
                                                                              Container(
                                                                                width: 36,
                                                                                height: 36,
                                                                                decoration: BoxDecoration(
                                                                                  color: ColorResources.colorFFF3E9,
                                                                                  borderRadius: BorderRadius.circular(20),
                                                                                ),
                                                                                child: Center(
                                                                                  child: Text_Widget(
                                                                                    text: "+" + (newAllServiceList[i].ListOfIcons.length - (newAllServiceList[i].noOfRow * 4)).toString(),
                                                                                    fontSize: FontSize.sixteen,
                                                                                    colour: ColorResources.colorFA3245,
                                                                                    fontWeight: FontWeight.w700,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Text_Widget(
                                                                                text: 'more',
                                                                                fontSize: FontSize.fourteen,
                                                                                colour: ColorResources.color222222,
                                                                                fontWeight: FontWeight.w400,
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ),
                                                              )
                                                            : Column(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Center(
                                                                    child: Image.asset(newAllServiceList[
                                                                            i]
                                                                        .ListOfIcons[
                                                                            index]
                                                                        .icon),
                                                                  ),
                                                                  Center(
                                                                    child:
                                                                        Text_Widget(
                                                                      text: newAllServiceList[
                                                                              i]
                                                                          .ListOfIcons[
                                                                              index]
                                                                          .name,
                                                                      colour: ColorResources
                                                                          .color222222,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                      fontSize:
                                                                          FontSize
                                                                              .twelve,
                                                                    ),
                                                                  )
                                                                ],
                                                              ),
                                                      )
                                                    : Container(
                                                        width: 74,
                                                        child: Column(
                                                          children: [
                                                            Center(
                                                              child: Image.asset(
                                                                  newAllServiceList[
                                                                          i]
                                                                      .ListOfIcons[
                                                                          index]
                                                                      .icon),
                                                            ),
                                                            Center(
                                                              child:
                                                                  Text_Widget(
                                                                text: newAllServiceList[
                                                                        i]
                                                                    .ListOfIcons[
                                                                        index]
                                                                    .name,
                                                                colour: ColorResources
                                                                    .color222222,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                fontSize:
                                                                    FontSize
                                                                        .twelve,
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      );
                                              }))),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
                    // SizedBox(
                    //   height: MediaQuery.of(context).size.height - 110,
                    //   child: ListView.builder(
                    //       itemCount: allServiceList.length,
                    //       itemBuilder: (BuildContext context, int i) {
                    //         return Padding(
                    //           padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                    //           child: Card(
                    //             child: Padding(
                    //               padding: const EdgeInsets.all(16.0),
                    //               child: Column(
                    //                 children: [
                    //                   Align(
                    //                     alignment: Alignment.topLeft,
                    //                     child: Text_Widget(
                    //                       text: allServiceList[i]['name'],
                    //                       fontSize: FontSize.twenty,
                    //                       colour: ColorResources.color222222,
                    //                       fontWeight: FontWeight.w700,
                    //                     ),
                    //                   ),
                    //                   SizedBox(
                    //                       height: (i == 2 ? 80 : 181),
                    //                       child: GridView.count(
                    //                           crossAxisCount: 4,
                    //                           crossAxisSpacing: 0,
                    //                           mainAxisSpacing: 8.0,
                    //                           children: List.generate(
                    //                               allServiceList[i]['listItem']
                    //                                           .length <
                    //                                       (i == 2 ? 3 : 7)
                    //                                   ? allServiceList[i]
                    //                                           ['listItem']
                    //                                       .length
                    //                                   : (i == 2 ? 4 : 8),
                    //                               (index) {
                    //                             return allServiceList[i]
                    //                                             ['listItem']
                    //                                         .length >
                    //                                     (i == 2 ? 2 : 6)
                    //                                 ? Container(
                    //                                     width: 74,
                    //                                     child: index >
                    //                                             (i == 2 ? 2 : 6)
                    //                                         ? GestureDetector(
                    //                                             onTap: () =>
                    //                                                 customModalBottomSheet(
                    //                                                     context,
                    //                                                     i),
                    //                                             child: (allServiceList[i]['listItem'].length -
                    //                                                         (i == 2
                    //                                                             ? 3
                    //                                                             : 7) <=
                    //                                                     0)
                    //                                                 ? SizedBox()
                    //                                                 : Container(
                    //                                                     child:
                    //                                                         Column(
                    //                                                       children: [
                    //                                                         Container(
                    //                                                           width: 36,
                    //                                                           height: 36,
                    //                                                           decoration: BoxDecoration(
                    //                                                             color: ColorResources.colorFFF3E9,
                    //                                                             borderRadius: BorderRadius.circular(20),
                    //                                                           ),
                    //                                                           child: Center(
                    //                                                             child: Text_Widget(
                    //                                                               text: "+" + (allServiceList[i]['listItem'].length - (i == 2 ? 4 : 8)).toString(),
                    //                                                               fontSize: FontSize.sixteen,
                    //                                                               colour: ColorResources.colorFA3245,
                    //                                                               fontWeight: FontWeight.w700,
                    //                                                             ),
                    //                                                           ),
                    //                                                         ),
                    //                                                         Text_Widget(
                    //                                                           text: 'more',
                    //                                                           fontSize: FontSize.fourteen,
                    //                                                           colour: ColorResources.color222222,
                    //                                                           fontWeight: FontWeight.w400,
                    //                                                         ),
                    //                                                       ],
                    //                                                     ),
                    //                                                   ),
                    //                                           )
                    //                                         : Center(
                    //                                             child: Image.asset(
                    //                                                 allServiceList[i]['listItem']
                    //                                                         [
                    //                                                         index]
                    //                                                     .image),
                    //                                           ),
                    //                                   )
                    //                                 : Container(
                    //                                     width: 74,
                    //                                     child: Center(
                    //                                       child: Image.asset(
                    //                                           allServiceList[i][
                    //                                                       'listItem']
                    //                                                   [index]
                    //                                               .image),
                    //                                     ),
                    //                                   );
                    //                           }))),
                    //                 ],
                    //               ),
                    //             ),
                    //           ),
                    //         );
                    //       }),
                    // ),

                    //===============================================
                    // Padding(
                    //   padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                    //   child: Card(
                    //     child: Padding(
                    //       padding: const EdgeInsets.all(16.0),
                    //       child: Column(
                    //         children: [
                    //           Align(
                    //             alignment: Alignment.topLeft,
                    //             child: Text_Widget(
                    //               text: allServiceList[0]['name'],
                    //               fontSize: FontSize.twenty,
                    //               colour: ColorResources.color222222,
                    //               fontWeight: FontWeight.w700,
                    //             ),
                    //           ),
                    //           SizedBox(
                    //               height: 181,
                    //               child: GridView.count(
                    //                   crossAxisCount: 4,
                    //                   crossAxisSpacing: 0,
                    //                   mainAxisSpacing: 8.0,
                    //                   children: List.generate(
                    //                       allServiceList[0]['listItem'].length >
                    //                               6
                    //                           ? allServiceList[0]['listItem']
                    //                               .length
                    //                           : 8, (index) {
                    //                     return allServiceList[0]['listItem']
                    //                                 .length >
                    //                             6
                    //                         ? Container(
                    //                             width: 74,
                    //                             child: index > 6
                    //                                 ? GestureDetector(
                    //                                     onTap: () =>
                    //                                         customModalBottomSheet(
                    //                                             context, 0),
                    //                                     child: Container(
                    //                                       child: Column(
                    //                                         children: [
                    //                                           Container(
                    //                                             width: 36,
                    //                                             height: 36,
                    //                                             decoration:
                    //                                                 BoxDecoration(
                    //                                               color: ColorResources
                    //                                                   .colorFFF3E9,
                    //                                               borderRadius:
                    //                                                   BorderRadius
                    //                                                       .circular(
                    //                                                           20),
                    //                                             ),
                    //                                             child: Center(
                    //                                               child:
                    //                                                   Text_Widget(
                    //                                                 text: "+" +
                    //                                                     (allServiceList[0]['listItem'].length -
                    //                                                             7)
                    //                                                         .toString(),
                    //                                                 fontSize:
                    //                                                     FontSize
                    //                                                         .sixteen,
                    //                                                 colour: ColorResources
                    //                                                     .colorFA3245,
                    //                                                 fontWeight:
                    //                                                     FontWeight
                    //                                                         .w700,
                    //                                               ),
                    //                                             ),
                    //                                           ),
                    //                                           Text_Widget(
                    //                                             text: 'more',
                    //                                             fontSize: FontSize
                    //                                                 .fourteen,
                    //                                             colour: ColorResources
                    //                                                 .color222222,
                    //                                             fontWeight:
                    //                                                 FontWeight
                    //                                                     .w400,
                    //                                           ),
                    //                                         ],
                    //                                       ),
                    //                                     ),
                    //                                   )
                    //                                 : Center(
                    //                                     child: Image.asset(
                    //                                         allServiceList[0][
                    //                                                     'listItem']
                    //                                                 [index]
                    //                                             .image),
                    //                                   ),
                    //                           )
                    //                         : Container(
                    //                             width: 74,
                    //                             child: Center(
                    //                               child: Image.asset(
                    //                                   allServiceList[0]
                    //                                               ['listItem']
                    //                                           [index]
                    //                                       .image),
                    //                             ),
                    //                           );
                    //                   }))),
                    //         ],
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    // Padding(
                    //   padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                    //   child: Card(
                    //     child: Padding(
                    //       padding: const EdgeInsets.all(16.0),
                    //       child: Column(
                    //         children: [
                    //           Align(
                    //             alignment: Alignment.topLeft,
                    //             child: Text_Widget(
                    //               text: allServiceList[1]['name'],
                    //               fontSize: FontSize.twenty,
                    //               colour: ColorResources.color222222,
                    //               fontWeight: FontWeight.w700,
                    //             ),
                    //           ),
                    //           SizedBox(
                    //               height: 181,
                    //               child: GridView.count(
                    //                   crossAxisCount: 4,
                    //                   crossAxisSpacing: 0,
                    //                   mainAxisSpacing: 8.0,
                    //                   children: List.generate(
                    //                       allServiceList[1]['listItem'].length <
                    //                               7
                    //                           ? allServiceList[1]['listItem']
                    //                               .length
                    //                           : 8, (index) {
                    //                     return allServiceList[1]['listItem']
                    //                                 .length >
                    //                             6
                    //                         ? Container(
                    //                             width: 74,
                    //                             child: index > 6
                    //                                 ? GestureDetector(
                    //                                     onTap: () =>
                    //                                         customModalBottomSheet(
                    //                                             context, 1),
                    //                                     child: Container(
                    //                                       child: Column(
                    //                                         children: [
                    //                                           Container(
                    //                                             width: 36,
                    //                                             height: 36,
                    //                                             decoration:
                    //                                                 BoxDecoration(
                    //                                               color: ColorResources
                    //                                                   .colorFFF3E9,
                    //                                               borderRadius:
                    //                                                   BorderRadius
                    //                                                       .circular(
                    //                                                           20),
                    //                                             ),
                    //                                             child: Center(
                    //                                               child:
                    //                                                   Text_Widget(
                    //                                                 text: "+" +
                    //                                                     (allServiceList[1]['listItem'].length -
                    //                                                             7)
                    //                                                         .toString(),
                    //                                                 fontSize:
                    //                                                     FontSize
                    //                                                         .sixteen,
                    //                                                 colour: ColorResources
                    //                                                     .colorFA3245,
                    //                                                 fontWeight:
                    //                                                     FontWeight
                    //                                                         .w700,
                    //                                               ),
                    //                                             ),
                    //                                           ),
                    //                                           Text_Widget(
                    //                                             text: 'more',
                    //                                             fontSize: FontSize
                    //                                                 .fourteen,
                    //                                             colour: ColorResources
                    //                                                 .color222222,
                    //                                             fontWeight:
                    //                                                 FontWeight
                    //                                                     .w400,
                    //                                           ),
                    //                                         ],
                    //                                       ),
                    //                                     ),
                    //                                   )
                    //                                 : Center(
                    //                                     child: Image.asset(
                    //                                         allServiceList[1][
                    //                                                     'listItem']
                    //                                                 [index]
                    //                                             .image),
                    //                                   ),
                    //                           )
                    //                         : Container(
                    //                             width: 74,
                    //                             child: Center(
                    //                               child: Image.asset(
                    //                                   allServiceList[1]
                    //                                               ['listItem']
                    //                                           [index]
                    //                                       .image),
                    //                             ),
                    //                           );
                    //                   }))),
                    //         ],
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    // Padding(
                    //   padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                    //   child: Card(
                    //     child: Padding(
                    //       padding: const EdgeInsets.all(16.0),
                    //       child: Column(
                    //         children: [
                    //           Align(
                    //             alignment: Alignment.topLeft,
                    //             child: Text_Widget(
                    //               text: allServiceList[2]['name'],
                    //               fontSize: FontSize.twenty,
                    //               colour: ColorResources.color222222,
                    //               fontWeight: FontWeight.w700,
                    //             ),
                    //           ),
                    //           SizedBox(
                    //               height: 80,
                    //               child: GridView.count(
                    //                   crossAxisCount: 4,
                    //                   crossAxisSpacing: 0,
                    //                   mainAxisSpacing: 8.0,
                    //                   children: List.generate(
                    //                       allServiceList[2]['listItem'].length <
                    //                               3
                    //                           ? allServiceList[2]['listItem']
                    //                               .length
                    //                           : 4, (index) {
                    //                     if (allServiceList[2]['listItem']
                    //                             .length >
                    //                         3) {
                    //                       return Container(
                    //                         width: 74,
                    //                         child: index > 2
                    //                             ? GestureDetector(
                    //                                 onTap: () =>
                    //                                     customModalBottomSheet(
                    //                                         context, 2),
                    //                                 child: Container(
                    //                                   child: Column(
                    //                                     children: [
                    //                                       Container(
                    //                                         width: 36,
                    //                                         height: 36,
                    //                                         decoration:
                    //                                             BoxDecoration(
                    //                                           color: ColorResources
                    //                                               .colorFFF3E9,
                    //                                           borderRadius:
                    //                                               BorderRadius
                    //                                                   .circular(
                    //                                                       20),
                    //                                         ),
                    //                                         child: Center(
                    //                                           child:
                    //                                               Text_Widget(
                    //                                             text: "+" +
                    //                                                 (allServiceList[2]['listItem'].length -
                    //                                                         3)
                    //                                                     .toString(),
                    //                                             fontSize:
                    //                                                 FontSize
                    //                                                     .sixteen,
                    //                                             colour: ColorResources
                    //                                                 .colorFA3245,
                    //                                             fontWeight:
                    //                                                 FontWeight
                    //                                                     .w700,
                    //                                           ),
                    //                                         ),
                    //                                       ),
                    //                                       Text_Widget(
                    //                                         text: 'more',
                    //                                         fontSize: FontSize
                    //                                             .fourteen,
                    //                                         colour:
                    //                                             ColorResources
                    //                                                 .color222222,
                    //                                         fontWeight:
                    //                                             FontWeight.w400,
                    //                                       ),
                    //                                     ],
                    //                                   ),
                    //                                 ),
                    //                               )
                    //                             : Column(
                    //                                 mainAxisAlignment:
                    //                                     MainAxisAlignment
                    //                                         .center,
                    //                                 crossAxisAlignment:
                    //                                     CrossAxisAlignment
                    //                                         .center,
                    //                                 children: [
                    //                                   Image.asset(allServiceList[
                    //                                               2]['listItem']
                    //                                           [index]
                    //                                       .image),
                    //                                   SizedBox(height: 8),
                    //                                   Expanded(
                    //                                     child: Align(
                    //                                       alignment: Alignment
                    //                                           .topCenter,
                    //                                       child: Center(
                    //                                         child: Text_Widget(
                    //                                           text: allServiceList[
                    //                                                       2][
                    //                                                   'listItem'][0]
                    //                                               .title,
                    //                                           fontSize: FontSize
                    //                                               .fourteen,
                    //                                           colour:
                    //                                               ColorResources
                    //                                                   .color222222,
                    //                                           fontWeight:
                    //                                               FontWeight
                    //                                                   .w400,
                    //                                         ),
                    //                                       ),
                    //                                     ),
                    //                                   ),
                    //                                 ],
                    //                               ),
                    //                       );
                    //                     } else {
                    //                       return Container(
                    //                         width: 74,
                    //                         child: Column(
                    //                           mainAxisAlignment:
                    //                               MainAxisAlignment.center,
                    //                           crossAxisAlignment:
                    //                               CrossAxisAlignment.center,
                    //                           children: [
                    //                             Image.asset(allServiceList[2]
                    //                                     ['listItem'][1]
                    //                                 .image),
                    //                             SizedBox(height: 8),
                    //                             Expanded(
                    //                               child: Align(
                    //                                 alignment:
                    //                                     Alignment.topCenter,
                    //                                 child: Center(
                    //                                   child: Text_Widget(
                    //                                     text: allServiceList[2]
                    //                                                 ['listItem']
                    //                                             [index]
                    //                                         .title,
                    //                                     fontSize:
                    //                                         FontSize.fourteen,
                    //                                     colour: ColorResources
                    //                                         .color222222,
                    //                                     fontWeight:
                    //                                         FontWeight.w400,
                    //                                   ),
                    //                                 ),
                    //                               ),
                    //                             ),
                    //                           ],
                    //                         ),
                    //                       );
                    //                     }
                    //                   }))),
                    //         ],
                    //       ),
                    //     ),
                    //   ),
                    // ),
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

  Future<dynamic> customModalBottomSheet(BuildContext context, int i) {
    return showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
          ),
        ),
        builder: (BuildContext bContext) {
          return new Container(
              decoration: new BoxDecoration(
                  color: Colors.white,
                  borderRadius: new BorderRadius.circular(32)),
              child: Wrap(
                children: [
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
                          text: StringResource.Bank,
                          fontSize: FontSize.twenty,
                          colour: ColorResources.color222222,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  SizedBox(height: 5),
                  new Center(
                    child: SizedBox(
                        height: 350,
                        child: GridView.count(
                            crossAxisCount: 4,
                            crossAxisSpacing: 0,
                            mainAxisSpacing: 8.0,
                            children: List.generate(
                                newAllServiceList[i].ListOfIcons.length,
                                (index) {
                              return Container(
                                child: Column(
                                  children: [
                                    Center(
                                      child: Image.asset(newAllServiceList[i]
                                          .ListOfIcons[index]
                                          .icon),
                                    ),
                                    Center(
                                      child: Text_Widget(
                                        text: newAllServiceList[i]
                                            .ListOfIcons[index]
                                            .name,
                                        colour: ColorResources.color222222,
                                        fontWeight: FontWeight.w400,
                                        fontSize: FontSize.twelve,
                                      ),
                                    )
                                  ],
                                ),
                              );
                            }))),
                  ),
                ],
              ));
        });
  }
}
