import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ui_design/styles/app_icons.dart';
import 'package:ui_design/widget/ui_helper.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff111111),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(Icons.arrow_back, color: Colors.white),
                      const Text(
                        'Flights',
                        style: TextStyle(
                          fontFamily: 'JetBrains',
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset(
                          AppIcon.icSearch,
                          width: 28,
                          height: 28,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    height: 60,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color(0xff1D1D1D),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      children: [
                        Container(
                          height: 48,
                          width: MediaQuery.of(context).size.width * 0.5 - 25,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Center(
                            child: Text(
                              'List',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'JetBrains',
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Center(
                            child: Text(
                              'Map',
                              style: const TextStyle(
                                color: Color(0xffFFFFFF),
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'JetBrains',
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    height: 150,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0xff1D1D1D),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 75, left: 16),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            AppIcon.icAir,
                            height: 40,
                            width: 40,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              'LH1782',
                              style: TextStyle(
                                color: Color(0XFFFDFDFD),
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'JetBrains',
                              ),
                            ),
                          ),
                          SizedBox(width: 145),
                          Container(
                            height: 22,
                            width: 45,
                            decoration: BoxDecoration(
                              color: Color(0xff282828),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8,top: 2),
                              child: Text(
                                '7842',
                                style: TextStyle(color: Color(0xffFDFDFD),
                                fontSize: 12
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 8),
                          Container(
                            height: 22,
                            width: 62,
                            decoration: BoxDecoration(
                              color: Color(0xff282828),
                              borderRadius: BorderRadius.circular(20),
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
      ),
    );
  }
}
