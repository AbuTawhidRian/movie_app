import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/constants.dart';
import 'package:movie_app/custom_component/custom_outline_gradient.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Constants.kBlackColor,
      extendBody: true,
      body: SizedBox(
        width: screenWidth,
        height: screenHeight,
        child: Stack(
          children: [
            Positioned(
              top: screenHeight * 0.1,
              left: -88,
              child: Container(
                height: 200,
                width: 200,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Constants.kPinkColor,
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 200,
                    sigmaY: 200,
                  ),
                  child: Container(
                    height: 166,
                    width: 166,
                    color: Colors.transparent,
                  ),
                ),
              ),
            ),
            Positioned(
              top: screenHeight * 0.3,
              right: -100,
              child: Container(
                height: 200,
                width: 200,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Constants.kGreenColor,
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 200,
                    sigmaY: 200,
                  ),
                  child: Container(
                    height: 200,
                    width: 200,
                    color: Colors.transparent,
                  ),
                ),
              ),
            ),
            SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: screenHeight * 0.07,
                  ),
                  CustomOutlineGradient(
                    strokeWidth: 4,
                    radius: screenWidth * 0.8,
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Constants.kPinkColor,
                          Constants.kPinkColor.withOpacity(0.1),
                          Constants.kGreenColor.withOpacity(.2),
                          Constants.kGreenColor.withOpacity(.6),
                        ],
                        stops: const [
                          0.1,
                          0.37,
                          0.6,
                          0.7
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.all(4),
                      child: Container(
                        height: screenHeight * 0.4,
                        width: screenWidth * 0.85,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            alignment: Alignment.centerLeft,
                            fit: BoxFit.cover,
                            //alignment: Alignment.center,
                            image: AssetImage(
                                'assets/images/first_page_image.png'),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.07,
                  ),
                  Text(
                    'Watch movies in\nVirtual Reality',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: screenHeight <= 667 ? 18 : 34,
                        fontWeight: FontWeight.w700,
                        color: Constants.kWhiteColor.withOpacity(0.85)),
                  ),
                  SizedBox(
                    height: screenHeight * 0.02,
                  ),
                  Text(
                    'Download and watch offline\nwherever you are',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: screenHeight <= 667 ? 12 : 16,
                        color: Constants.kWhiteColor.withOpacity(0.75)),
                  ),
                  SizedBox(
                    height: screenHeight * 0.05,
                  ),
                  CustomOutlineGradient(
                    strokeWidth: 5,
                    radius: 20,
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Constants.kPinkColor,
                        Constants.kGreenColor,
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(2),
                      child: Container(
                        height: 38,
                        width: 180,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Constants.kPinkColor.withOpacity(0.5),
                              Constants.kGreenColor.withOpacity(0.5),
                            ],
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                                color: Constants.kWhiteColor, fontSize: 14),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                        3,
                        (index) => Container(
                              height: 7,
                              width: 7,
                              margin: EdgeInsets.symmetric(
                                horizontal: 4,
                              ),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: index == 0
                                    ? Constants.kGreenColor
                                    : Constants.kWhiteColor.withOpacity(.2),
                              ),
                            )),
                  ),
                  SizedBox(
                    height: screenHeight * 0.03,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
