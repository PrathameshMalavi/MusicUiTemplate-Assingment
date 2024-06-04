
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:music_app_ui/model/Album.dart';
import 'package:music_app_ui/widgets/otherWidgets.dart';

import '../model/User.dart';
import '../widgets/dynamicAppBar.dart';

class HomeUI extends StatefulWidget {
  const HomeUI({super.key});

  @override
  State<HomeUI> createState() => _HomeUIState();
}

class _HomeUIState extends State<HomeUI> with SingleTickerProviderStateMixin {
  bool _appBarVisible = false;
  late bool _bannerVisible;
  bool searchSection = false;
  late final AnimationController _controller;
  double scrollvalue = 75;

  final List<String> items = ["Outdoor" ,"Outdoor", "Outdoor" ,"Outdoor","Outdoor"];

  ScrollController? _scrollController;

  List<User> userList = [
    User(
        profileImg: "assets/data/user.png",
        name: "Yashika",
        age: "29",
        country: "India",
        isFollowing: true),
    User(
        profileImg: "assets/data/user.png",
        name: "Yashika",
        age: "29",
        country: "India",
        isFollowing: false),
    User(
        profileImg: "assets/data/user.png",
        name: "Yashika",
        age: "29",
        country: "India",
        isFollowing: false),
    User(
        profileImg: "assets/data/user.png",
        name: "Yashika",
        age: "29",
        country: "India",
        isFollowing: false),
    User(
        profileImg: "assets/data/user.png",
        name: "Yashika",
        age: "29",
        country: "India",
        isFollowing: false),
    User(
        profileImg: "assets/data/user.png",
        name: "Yashika",
        age: "29",
        country: "India",
        isFollowing: false),
    User(
        profileImg: "assets/data/user.png",
        name: "Yashika",
        age: "29",
        country: "India",
        isFollowing: false),
    User(
        profileImg: "assets/data/user.png",
        name: "Yashika",
        age: "29",
        country: "India",
        isFollowing: false),
    User(
        profileImg: "assets/data/user.png",
        name: "Yashika",
        age: "29",
        country: "India",
        isFollowing: false),User(
        profileImg: "assets/data/user.png",
        name: "Yashika",
        age: "29",
        country: "India",
        isFollowing: false),
    User(
        profileImg: "assets/data/user.png",
        name: "Yashika",
        age: "29",
        country: "India",
        isFollowing: false),


  ];

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController?.addListener(_scrollListener);

    _controller = AnimationController(
      duration: Duration(milliseconds: 400),
      vsync: this,
    );

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Container(
            child: Column(
              children: [
                _appBarVisible ? Container() : Widgets.mainBanner(),
                Visibility(
                    visible: !searchSection,
                    child: Column(
                      children: [
                        Widgets.example(),
                        //shoCategoryWidget(),
                        Container(
                          margin: EdgeInsets.only(left: 20),
                          child: Row(
                            children: [
                              category("Outdoor"),category("Outdoor"),category("Outdoor"),category("Outdoor"),category("+1")
                            ],
                          ),
                        ),
                        Widgets.medialib(),
                        Widgets.homePageOtions(),
                      ],
                    )),
                searchWidgetFunctionality(context, userList),
              ],
            ),
          ),
        ),
      ),
      // floatingActionButton: FloatingActionButton.extended(
      //   label: Text(_appBarVisible ? 'Hide' : 'Show'),
      //   onPressed: () => setState(() => _appBarVisible = !_appBarVisible),
      // ),
      appBar: _appBarVisible
          ? Widgets.appBar(
              Album(
                  imageSrc: 'assets/data/banner.png',
                  albumName: 'The Weekand',
                  members: '+11k',
                  albumDestription: ''),
              context,
              true,
              showBottomSheet)
          : Widgets.banner(),
      // appBar:_appBarVisible? SlidingAppBar(
      //   controller: _controller,
      //   visible: _appBarVisible,
      //   data: Album(imageSrc: 'assets/data/banner.png', albumName: 'The Weekand', members: '+11k', albumDestription: '' ),
      //   showBottomSheet: showBottomSheet,
      //   child: AppBar(title: Text('AppBar')),
      // ) : Widgets.banner(),
    );
  }

  // _scrollListener() {
  //   if (_scrollController?.position.userScrollDirection == ScrollDirection.forward) {
  //     setState(() {
  //       setState(() => _appBarVisible = false);
  //     });
  //   }
  //   if (_scrollController?.position.userScrollDirection == ScrollDirection.reverse) {
  //     setState(() {
  //       setState(() => _appBarVisible = true);
  //     });
  //   }
  // }

  _scrollListener() {
    if (_scrollController!.position.pixels <= scrollvalue) {
      setState(() {
        setState(() => _appBarVisible = false);
      });
    }
    if (_scrollController!.position.pixels >= scrollvalue) {
      setState(() {
        setState(() => _appBarVisible = true);
      });
    }
  }

  shoCategoryWidget() {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: items.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        // final int itemsLeft = items.length - index - 1;
        // final String itemsLeftText =
        //     itemsLeft > 0 ? '+$itemsLeft' : 'Last item';

        return SizedBox(
          width: 100,
          child: category(items[index]),
        );
      },
    );
  }

  category(String text) {
    return SizedBox(
      child: Container(
        margin: EdgeInsets.only(right: 5),
        padding: EdgeInsets.fromLTRB(10, 2, 10, 2),
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xFFEF456F)),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          text,
          style: GoogleFonts.getFont(
            'Roboto Condensed',
            fontWeight: FontWeight.w400,
            fontSize: 13,
            color: Color(0xFFEF456F),
          ),
        ),
      ),
    );
  }

  searchWidgetFunctionality(BuildContext context, List<User> userList) {
    return Container(
      //height: MediaQuery.sizeOf(context).height,
      child: Column(
        children: [
          searchSection ? searchSectionMembers() : membersSection(),
          Container(
            height: 8,
          ),
          ListView.builder(
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.fromLTRB(0, 0, 20, 16),
                child: SizedBox(
                  width: 320,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 20,
                          ),
                          ClipOval(
                            child: SizedBox.fromSize(
                              size: Size.fromRadius(25), // Image radius
                              child: Image.asset(userList[index].profileImg,
                                  fit: BoxFit.cover),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(10, 3.5, 0, 4.5),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  margin: EdgeInsets.fromLTRB(0, 0, 0, 5),
                                  child: Text(
                                    userList[index].name,
                                    style: GoogleFonts.getFont(
                                      'Roboto Condensed',
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                      color: Color(0xFF000000),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.fromLTRB(0, 0, 2.3, 0),
                                  child: Text(
                                    '${userList[index].age}, ${userList[index].country}',
                                    style: GoogleFonts.getFont(
                                      'Roboto Condensed',
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12,
                                      height: 1,
                                      color: Color(0xFF494949),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Expanded(child: Container()),
                      InkWell(
                        onTap: () {
                          if (userList[index].isFollowing) {
                            setState(() {
                              userList[index].isFollowing = false;
                            });
                          } else {
                            setState(() {
                              userList[index].isFollowing = true;
                            });
                            print(userList[index].isFollowing);
                          }
                          setState(() {
                            userList;
                          });
                        },
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          decoration: BoxDecoration(
                            color: userList[index].isFollowing
                                ? Colors.grey
                                : Color.fromRGBO(236, 87, 87, 1.0),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Container(
                            width: 70,
                            child: Text(
                              textAlign: TextAlign.center,
                              userList[index].isFollowing ? 'Following' : 'Add',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            itemCount: userList.length,
          )
        ],
      ),
    );
  }

  membersSection() {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 0, 10, 8),
      child: SizedBox(
        width: 320,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(0, 4, 0, 1),
              child: Text(
                'Members',
                style: GoogleFonts.getFont(
                  'Roboto Condensed',
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: Color(0xFF000000),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Color(0xFFE9E9EB),
                borderRadius: BorderRadius.circular(20),
              ),
              child: InkWell(
                onTap: () {
                  setState(() {
                    searchSection = true;
                    _appBarVisible = true;
                    scrollvalue = 0;
                  });
                },
                child: Container(
                  width: 28,
                  height: 28,
                  padding: EdgeInsets.fromLTRB(3.7, 3.7, 3.7, 3.7),
                  child: SizedBox(
                    width: 24,
                    height: 24,
                    child: SvgPicture.asset(
                      'assets/icons/search_normal_1_x2.svg',
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  searchSectionMembers() {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 10, 6, 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(0, 0, 16, 0),
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xFFE9E9EB),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Container(
                width: 260,
                padding: EdgeInsets.fromLTRB(13, 9, 13, 7),
                child: Text(
                  'Search member',
                  style: GoogleFonts.getFont(
                    'Roboto Condensed',
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: Color(0xFF494949),
                  ),
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                searchSection = false;
                scrollvalue = 75;
              });
            },
            child: Container(
              margin: EdgeInsets.fromLTRB(5, 9, 0, 7),
              child: Text(
                'Cancel',
                style: GoogleFonts.getFont(
                  'Roboto Condensed',
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  color: Color(0xFF000000),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  showBottomSheet() {
    showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 200,
            decoration: BoxDecoration(
              color: Color(0xFFFFFFFF),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Container(
              padding: EdgeInsets.fromLTRB(20, 12, 20, 0),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xFF494949),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Container(
                      width: 88,
                      height: 5,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Widgets.bottomSheetOptions(
                            'assets/icons/link_x2.svg', 'Invite'),
                        Widgets.bottomSheetOptions(
                            'assets/icons/user_add_1_2_x2.svg', 'Add member'),
                        Widgets.bottomSheetOptions(
                            'assets/icons/user_add_x2.svg', 'Add Group'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
