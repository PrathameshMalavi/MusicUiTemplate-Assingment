import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../model/Album.dart';

class Widgets {
  static showText(String text, bool flag, VoidCallback _onTapFunction) {
    return RichText(
      text: TextSpan(
        text: flag ? text.substring(0, 100) + "..." : text,
        style: GoogleFonts.getFont(
          'Roboto Condensed',
          fontWeight: FontWeight.w400,
          fontSize: 16,
          color: Color(0xFF000000),
        ),
        children: <TextSpan>[
          TextSpan(
            text: flag ? "Read more" : "Read less",
            recognizer: TapGestureRecognizer()..onTap = _onTapFunction,
            style: GoogleFonts.getFont(
              'Roboto Condensed',
              fontWeight: FontWeight.w400,
              fontSize: 16,
              height: 1.3,
              color: Color(0xFFEF456F),
            ),
          ),
        ],
      ),
    );
  }

  static backArrow(bool flag) {
    return Container(
      decoration: BoxDecoration(
        color: flag ? Color(0x1A000000) : Color(0xB2000000),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        width: 27,
        height: 27,
        child: SizedBox(
          width: 24,
          height: 24,
          child: SvgPicture.asset("assets/icons/arrow_left_3_x2.svg"),
        ),
      ),
    );
  }

  static moreOption(bool flag, VoidCallback bottomNavigation) {
    return GestureDetector(
      onTap: bottomNavigation,
      child: Container(
        decoration: BoxDecoration(
          color: flag ? Color(0x1A000000) : Color(0xB2000000),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Container(
          width: 27,
          height: 27,
          child: SizedBox(
            width: 24,
            height: 24,
            child: Icon(
              Icons.more_vert,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  static bottomSheetOptions(String iconSrc, String title) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 0, 0, 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(0, 0, 8, 0),
            width: 24,
            height: 24,
            child: SizedBox(
              width: 24,
              height: 24,
              child: SvgPicture.asset(
                iconSrc,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 4, 0, 1),
            child: Text(
              title,
              style: GoogleFonts.getFont(
                'Roboto Condensed',
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: Color(0xFF000000),
              ),
            ),
          ),
        ],
      ),
    );
  }

  static banner() {
    return PreferredSize(
      preferredSize: Size(100, 0), //width and height
      // The size the AppBar would prefer if there were no other constraints.
      child: SafeArea(
        child: Container(),
      ),
    );
  }

  static mainBanner() {
    return Stack(
      children: [
        Image.asset(
          "assets/data/banner.png",
          height: 280,
          fit: BoxFit.fill,
        ),
        Positioned(
          top: 18,
          left: 20,
          child: backArrow(false),
        ),
        Positioned(
          bottom: 0,
          child: Container(
            margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFFC32422),
                ),
                child: SizedBox(
                  width: 360,
                  child: Container(
                    padding: EdgeInsets.fromLTRB(20, 15, 20, 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(6, 0, 0, 7),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  'The Weeknd',
                                  style: GoogleFonts.getFont(
                                    'Roboto Condensed',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 22,
                                    color: Color(0xFFFFFFFF),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(6, 0, 0, 0),
                              child: Text(
                                'Community • +11K Members',
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
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 8, 0, 7),
                          width: 32,
                          height: 32,
                          child: Container(
                            width: 32,
                            height: 32,
                            padding: EdgeInsets.fromLTRB(8.4, 7.7, 9.2, 7.7),
                            decoration: BoxDecoration(
                              border: Border.all(color: Color(0xFFE9E9EB)),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: SizedBox(
                              width: 12.4,
                              height: 14.6,
                              child: SvgPicture.asset(
                                'assets/icons/share_normal_1_x2.svg',
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  static appBar(
    Album data,
    BuildContext context,
    bool visible,
    VoidCallback showBottomSheet,
  ) {
    return PreferredSize(
      preferredSize: Size(MediaQuery.sizeOf(context).width, 65),
      child: SafeArea(
        child: Container(
          height: 100,
          color: Color(0xFFC32422),
          padding: EdgeInsets.symmetric(vertical: 0, horizontal: 15),
          //width: MediaQuery.sizeOf(context).width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Container(
              //   width: 20,
              // ),
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
                      color: Color(0xFFC32422),
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
    );
  }



  static medialib() {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 20, 0, 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(0, 0, 0, 9),
            child: Align(
              alignment: Alignment.topLeft,
              child: SizedBox(
                width: 311.5,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 9.5, 0),
                      child: SizedBox(
                        width: 295,
                        child: Text(
                          'Media, docs and links',
                          style: GoogleFonts.getFont(
                            'Roboto Condensed',
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: Color(0xFF000000),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 1, 0, 4),
                      width: 7,
                      height: 14,
                      child: Container(
                        width: 7,
                        height: 14,
                        child: SizedBox(
                          width: 7,
                          height: 14,
                          child: Icon(Icons.arrow_forward_ios_rounded),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                mediaImage(),
                mediaImage(),
                mediaImage(),
                mediaImage(),
                mediaImage(),
                mediaImage(),
                mediaImage()
              ],
            ),
          )
        ],
      ),
    );
  }

  static mediaImage() {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 0, 6, 0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: SizedBox.fromSize(
          size: Size.fromRadius(48), // Image radius
          child: Image.asset(
            "assets/data/banner.png",
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  static homePageOtions() {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 0, 0, 5),
      child: Column(
        children: [
          Widgets.muteNotificationToggle(),
          Widgets.homePageOptionsIconsText(
              Colors.black, 'assets/icons/trash_1_x2.svg', 'Clear chat'),
          Widgets.homePageOptionsIconsText(
              Colors.black, 'assets/icons/private_1_x2.svg', 'Encryption'),
          Widgets.homePageOptionsIconsText(
              Colors.red, 'assets/icons/logout_x2.svg', 'Exit community'),
          Widgets.homePageOptionsIconsText(
              Colors.red, 'assets/icons/dislike_3_x2.svg', 'Report'),
        ],
      ),
    );
  }

  static muteNotificationToggle() {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 0, 0, 13),
      child: Align(
        alignment: Alignment.topLeft,
        child: SizedBox(
          width: 320,
          height: 25,
          child: Row(
            children: [
              SizedBox(
                height: 16,
                child: Text(
                  'Mute notification',
                  style: GoogleFonts.getFont(
                    'Roboto Condensed',
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: Color(0xFF000000),
                  ),
                ),
              ),
              Expanded(child: Container()),
              ToggleSwitch(
                minWidth: 25.0,
                cornerRadius: 20.0,
                borderWidth: 1,
                borderColor: [Color(0xFFAAABAB)],
                activeBgColors: [[Color(0xFFAAABAB)!], [Colors.black38!]],
                activeFgColor: Colors.white,
                inactiveBgColor: Color(0xFFFFFFFF),
                inactiveFgColor: Colors.white,
                initialLabelIndex: 0,
                totalSwitches: 2,
                labels: ['', ''],
                radiusStyle: true,
                onToggle: (index) {
                  print('switched to: $index');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  static homePageOptionsIconsText(Color color, String iconSrc, String title) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 0, 0, 13),
      child: Align(
        alignment: Alignment.topLeft,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 8, 0),
              width: 24,
              height: 24,
              child: SizedBox(
                width: 24,
                height: 24,
                child: SvgPicture.asset(iconSrc),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 5, 0, 3),
              child: Text(
                title,
                style: GoogleFonts.getFont(
                  'Roboto Condensed',
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  color: color,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static example() {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 15, 20, 35),
      child: RichText(
        text: TextSpan(
          text:
          'Lorem ipsum dolor sit amet, consectetur adipis-cing elit. Sed euismod vestibulum lacus, nec consequat nulla efficitur sit amet. Proin eu lorem libero. Sed id enim in urna tincidunt sodales. Vivamus vel semper ame...',
          style: GoogleFonts.getFont(
            'Roboto Condensed',
            fontWeight: FontWeight.w400,
            fontSize: 16,
            color: Color(0xFF000000),
          ),
          children: [
            TextSpan(
              text: 'Read more',
              style: GoogleFonts.getFont(
                'Roboto Condensed',
                fontWeight: FontWeight.w400,
                fontSize: 16,
                height: 1.3,
                color: Color(0xFFEF456F),
              ),
            ),
          ],
        ),
      ),
    );
  }

  exampleNew() {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 0, 0, 35),
      child: RichText(
        text: TextSpan(
          text:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed euismod vestibulum lacus, nec consequat nulla efficitur sit amet. Proin eu lorem libero. Sed id enim in urna tincidunt sodales. Vivamus vel semper ame...',
          style: GoogleFonts.getFont(
            'Roboto Condensed',
            fontWeight: FontWeight.w400,
            fontSize: 16,
            color: Color(0xFF000000),
          ),
          children: [
            TextSpan(
              text: 'Read more',
              style: GoogleFonts.getFont(
                'Roboto Condensed',
                fontWeight: FontWeight.w400,
                fontSize: 16,
                height: 1.3,
                color: Color(0xFFEF456F),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
