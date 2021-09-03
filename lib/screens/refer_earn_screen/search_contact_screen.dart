import 'package:assessment/Widget/text_widget.dart';
import 'package:assessment/screens/refer_earn_screen/bloc/referearn_bloc.dart';
import 'package:assessment/utils/color_resource.dart';
import 'package:assessment/utils/font.dart';
import 'package:assessment/utils/string_resource.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchContact extends StatefulWidget {
  SearchContact({Key? key}) : super(key: key);

  @override
  _SearchContactState createState() => _SearchContactState();
}

class _SearchContactState extends State<SearchContact> {
  TextEditingController searchController = new TextEditingController();
  late ReferearnBloc referearnBloc;

  @override
  void initState() {
    super.initState();

    referearnBloc = ReferearnBloc()..add(SearchInitailEvent());
  }

  List<Contact> searchList = [];

  void runFilter(String enteredKeyword) {
    List<Contact> results = [];
    searchList = [];

    if (enteredKeyword.isEmpty) {
      results = referearnBloc.foundUsers;
    } else {
      results = referearnBloc.foundUsers
          .where((user) => user.displayName
              .toString()
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
    }
    setState(() {
      searchList = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ReferearnBloc, ReferearnState>(
      bloc: referearnBloc,
      listener: (context, state) {
        // TODO: implement listener
      },
      child: BlocBuilder<ReferearnBloc, ReferearnState>(
        bloc: referearnBloc,
        builder: (context, state) {
          if (state is SearchLoadingState) {
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else if (state is SearchLoadedState) {
            return Scaffold(
              body: Column(
                children: [
                  Container(
                    height: 80,
                    color: ColorResources.color641653,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: TextField(
                        controller: searchController,
                        onChanged: (value) => runFilter(value),
                        style: TextStyle(
                          color: ColorResources.colorFFFFFF,
                          fontSize: FontSize.eighteen,
                          fontWeight: FontWeight.w600,
                        ),
                        decoration: new InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          suffixIcon: IconButton(
                            onPressed: () {
                              searchController.clear();
                            },
                            icon: Icon(Icons.clear,
                                color: ColorResources.colorFFFFFF),
                          ),
                          icon: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(Icons.arrow_back,
                                color: ColorResources.colorFFFFFF),
                          ),
                          hintText: StringResource.Searchbynumberorname,
                          hintStyle: TextStyle(
                            color: Colors.white54,
                            fontSize: FontSize.eighteen,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  searchList == []
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : Expanded(
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: searchList.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                  title: Text(
                                      searchList[index].displayName.toString()),
                                  subtitle: Text(searchList[index]
                                      .phones!
                                      .elementAt(0)
                                      .value
                                      .toString()),
                                  leading: (searchList[index].avatar != null &&
                                          searchList[index].avatar!.length > 0)
                                      ? CircleAvatar(
                                          backgroundColor:
                                              ColorResources.colorFF781F,
                                          backgroundImage: MemoryImage(
                                              searchList[index].avatar!),
                                        )
                                      : CircleAvatar(
                                          backgroundColor:
                                              ColorResources.colorFF781F,
                                          child: Center(
                                            child: Text_Widget(
                                              text:
                                                  searchList[index].initials(),
                                              fontSize: FontSize.eighteen,
                                              colour:
                                                  ColorResources.colorFFFFFF,
                                              fontWeight: FontWeights.normal,
                                            ),
                                          ),
                                        ),
                                  trailing: Text_Widget(
                                    text: StringResource.Invite,
                                    fontSize: FontSize.fourteen,
                                    colour: ColorResources.colorFF781F,
                                    fontWeight: FontWeights.normal,
                                  ),
                                  onTap: () {
                                    // Navigator.push(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //         builder: (context) => SingleMultiple()));
                                  });
                            },
                          ),
                        ),
                ],
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
