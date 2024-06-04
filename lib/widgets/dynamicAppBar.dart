import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:music_app_ui/widgets/otherWidgets.dart';

import '../model/Album.dart';

class SlidingAppBar extends StatelessWidget implements PreferredSizeWidget {
  SlidingAppBar({
    required this.data,
    required this.child,
    required this.controller,
    required this.visible,
    required this.showBottomSheet,
  });

  final Album data;
  final PreferredSizeWidget child;
  final AnimationController controller;
  final bool visible;
  final VoidCallback showBottomSheet;

  @override
  Size get preferredSize => child.preferredSize;

  @override
  Widget build(BuildContext context) {
    visible ? controller.reverse() : controller.forward();
    return SlideTransition(
      position: Tween<Offset>(begin: Offset.zero, end: Offset(0, -1)).animate(
        CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn),
      ),
      child: AppBar(
        backgroundColor: Color(0xFFC32422), //Color(0xFFC32422),
        title: Container(
          width: MediaQuery.sizeOf(context).width,
          child: Row(
            children: [
              Container(
                width: 3,
              ),
              Widgets.backArrow(visible),
              Container(
                width: 10,
              ),
              SizedBox(
                width: 50,
                height: 48,
                child: Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFFACB31),
                      borderRadius: BorderRadius.circular(200),
                    ),
                    width: 50,
                    height: 48,
                    child: Container(
                      child: ClipOval(
                        child: Image.asset("assets/data/banner.png",
                            fit: BoxFit.fill),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(8, 4, 0, 6),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 3),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          data.albumName,
                          style: GoogleFonts.getFont(
                            'Roboto Condensed',
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                            color: Color(0xFFFFFFFF),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: Text(
                        'Community • ${data.members} Members',
                        style: GoogleFonts.getFont(
                          'Roboto Condensed',
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                          color: Color(0xFFFFFFFF),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(child: Container()),
              Widgets.moreOption(visible, showBottomSheet),
            ],
          ),
        ),
      ),
      // child: Container(
      //
      //   margin: EdgeInsets.fromLTRB(0, 10, 0, 22),
      //   child: Stack(
      //     children: [
      //       Container(
      //         decoration: BoxDecoration(
      //           color: Color(0xFFC32422),
      //         ),
      //         child: Container(
      //             padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
      //             child: Row(
      //               children: [
      //                 Widgets.backArrow(visible),
      //                 Widgets.moreOption(visible),
      //               ],
      //             )
      //         ),
      //       ),
      //       // ClipRect(
      //       //   child: BackdropFilter(
      //       //     filter: ImageFilter.blur(
      //       //       sigmaX: 2,
      //       //       sigmaY: 2,
      //       //     ),
      //       //     child: Container(
      //       //       decoration: BoxDecoration(
      //       //         color: Color(0xFFC32422),
      //       //       ),
      //       //       child: Container(
      //       //         padding: EdgeInsets.fromLTRB(10, 5, 20, 5),
      //       //         child: Row(
      //       //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //       //           crossAxisAlignment: CrossAxisAlignment.start,
      //       //           children: [
      //       //             SizedBox(
      //       //               width: 240,
      //       //               height: 75,
      //       //               child: Container(
      //       //                 padding: EdgeInsets.fromLTRB(0, 13, 0, 13),
      //       //                 child: Stack(
      //       //                   clipBehavior: Clip.none,
      //       //                   children: [
      //       //                     Widgets.backArrow(visible),
      //       //                     Positioned(
      //       //                       right: 0,
      //       //                       bottom: 0,
      //       //                       child: SizedBox(
      //       //                         width: 200,
      //       //                         height: 50,
      //       //                         child: Row(
      //       //                           mainAxisAlignment: MainAxisAlignment.start,
      //       //                           crossAxisAlignment: CrossAxisAlignment.start,
      //       //                           children: [
      //       //                             Container(
      //       //                               margin: EdgeInsets.fromLTRB(0, 0, 8, 0),
      //       //                               child: Container(
      //       //                                 decoration: BoxDecoration(
      //       //                                   color: Color(0xFFFACB31),
      //       //                                   borderRadius:
      //       //                                       BorderRadius.circular(200),
      //       //                                 ),
      //       //                                 child: Container(
      //       //                                   width: 50,
      //       //                                   height: 50,
      //       //                                   child: Positioned(
      //       //                                     right: -18,
      //       //                                     bottom: -3,
      //       //                                     child: Container(
      //       //                                       child: Container(
      //       //                                         width: 86,
      //       //                                         height: 55,
      //       //                                         child:
      //       //                                             Image.asset(data.imageSrc),
      //       //                                       ),
      //       //                                     ),
      //       //                                   ),
      //       //                                 ),
      //       //                               ),
      //       //                             ),
      //       //                             Container(
      //       //                               margin: EdgeInsets.fromLTRB(0, 6, 0, 4),
      //       //                               child: Column(
      //       //                                 mainAxisAlignment:
      //       //                                     MainAxisAlignment.start,
      //       //                                 crossAxisAlignment:
      //       //                                     CrossAxisAlignment.start,
      //       //                                 children: [
      //       //                                   Container(
      //       //                                     margin:
      //       //                                         EdgeInsets.fromLTRB(0, 0, 0, 3),
      //       //                                     child: Align(
      //       //                                       alignment: Alignment.topLeft,
      //       //                                       child: Text(
      //       //                                         data.albumName,
      //       //                                         style: GoogleFonts.getFont(
      //       //                                           'Roboto Condensed',
      //       //                                           fontWeight: FontWeight.w600,
      //       //                                           fontSize: 20,
      //       //                                           color: Color(0xFFFFFFFF),
      //       //                                         ),
      //       //                                       ),
      //       //                                     ),
      //       //                                   ),
      //       //                                   Container(
      //       //                                     margin:
      //       //                                         EdgeInsets.fromLTRB(6, 0, 0, 0),
      //       //                                     child: Text(
      //       //                                       'Community • ${data.members} Members',
      //       //                                       style: GoogleFonts.getFont(
      //       //                                         'Roboto Condensed',
      //       //                                         fontWeight: FontWeight.w600,
      //       //                                         fontSize: 12,
      //       //                                         color: Color(0xFFFFFFFF),
      //       //                                       ),
      //       //                                     ),
      //       //                                   ),
      //       //                                 ],
      //       //                               ),
      //       //                             ),
      //       //                           ],
      //       //                         ),
      //       //                       ),
      //       //                     ),
      //       //                   ],
      //       //                 ),
      //       //               ),
      //       //             ),
      //       //             Widgets.moreOption(visible),
      //       //           ],
      //       //         ),
      //       //       ),
      //       //     ),
      //       //   ),
      //       // ),
      //     ],
      //   ),
      // ),
    );
  }


}
