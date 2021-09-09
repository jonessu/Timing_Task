import 'package:assessment/Widget/text_widget.dart';
import 'package:assessment/screens/all_service_screen/bloc/service_bloc.dart';
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
  late ServiceBloc serviceBloc;

  @override
  void initState() {
    super.initState();

    serviceBloc = ServiceBloc()..add(SearchInitailEvent());
  }

  List<Contact> searchList = [];

  void runFilter(String enteredKeyword) {
    List<Contact> results = [];
    searchList = [];
    if (enteredKeyword.isEmpty) {
      //results = serviceBloc.foundUsers;
    } else {
      // results = serviceBloc.foundUsers
      //     .where((user) => user.displayName
      //         .toString()
      //         .toLowerCase()
      //         .contains(enteredKeyword.toLowerCase()))
      //     .toList();
    }
    setState(() {
      searchList = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ServiceBloc, ServiceState>(
      bloc: serviceBloc,
      listener: (context, state) {},
      child: BlocBuilder<ServiceBloc, ServiceState>(
        bloc: serviceBloc,
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
                              return SizedBox();
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
