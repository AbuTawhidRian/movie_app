import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movie_app/controller/new_movies_controller.dart';
import 'package:movie_app/controller/upcoming_movies_controller.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../constants.dart';
import '../custom_component/search_field_widget.dart';
import 'package:glassmorphism/glassmorphism.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final NewMoviesController newMoviesController = NewMoviesController();
  final UpComingMoviesController upComingMoviesController =
      UpComingMoviesController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    newMoviesController.getPath();
    upComingMoviesController.getPath();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Constants.kBlackColor,
      extendBody: true,
      body: SizedBox(
        height: screenHeight,
        width: screenWidth,
        child: Stack(
          children: [
            Positioned(
              top: -100,
              left: -100,
              child: Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Constants.kGreenColor.withOpacity(0.5),
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
              top: screenHeight * 0.4,
              right: -88,
              child: Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Constants.kPinkColor.withOpacity(0.5),
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
              bottom: -100,
              left: -100,
              child: Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Constants.kCyanColor.withOpacity(0.5),
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
            SafeArea(
              child: ListView(
                children: [
                  const SizedBox(height: 24),
                  const Text(
                    'What would you\nlike to watch?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 28,
                        color: Constants.kWhiteColor,
                        fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 30),
                  const SearchFieldWidget(
                    padding: EdgeInsets.symmetric(
                      horizontal: 25,
                    ),
                  ),
                  const SizedBox(height: 39),
                  Padding(
                    padding: const EdgeInsets.only(left: 25.0),
                    child: Text(
                      'Popular Movies',
                      style: TextStyle(
                        color: Constants.kWhiteColor.withOpacity(0.6),
                        fontSize: 17,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    height: 160,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: newMoviesController.imagePath.length,
                      itemBuilder: (context, index) {
                        final String mask;
                        if (index == 0) {
                          mask = Constants.kMaskFirst;
                        } else if (index ==
                            newMoviesController.imagePath.length - 2) {
                          mask = Constants.kMaskMiddle;
                        } else {
                          mask = Constants.kMaskLast;
                        }
                        return GestureDetector(
                          child: Container(
                            margin: EdgeInsets.only(left: index == 0 ? 20 : 0),
                            height: 160,
                            width: 142,
                            child: MaskedImage(
                                asset: newMoviesController
                                    .imagePath[index].newMovie,
                                mask: mask),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 35),
                  Padding(
                    padding: const EdgeInsets.only(left: 25.0),
                    child: Text(
                      'Upcoming Movies',
                      style: TextStyle(
                        color: Constants.kWhiteColor.withOpacity(0.6),
                        fontSize: 17,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    height: 160,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: upComingMoviesController.imagePath.length,
                      itemBuilder: (context, index) {
                        final String mask;
                        if (index == 0) {
                          mask = Constants.kMaskFirst;
                        } else if (index ==
                            upComingMoviesController.imagePath.length - 2) {
                          mask = Constants.kMaskMiddle;
                        } else {
                          mask = Constants.kMaskLast;
                        }
                        return GestureDetector(
                          child: Container(
                            margin: EdgeInsets.only(left: index == 0 ? 20 : 0),
                            height: 160,
                            width: 142,
                            child: MaskedImage(
                                asset: upComingMoviesController
                                    .imagePath[index].upComingMovie,
                                mask: mask),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
        height: 64,
        width: 64,
        padding: const EdgeInsets.all(4),
        margin: const EdgeInsets.only(top: 40),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Constants.kPinkColor.withOpacity(0.2),
              Constants.kGreenColor.withOpacity(0.2),
            ],
          ),
        ),
        child: Container(
          height: 60,
          width: 60,
          padding: const EdgeInsets.all(4),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Constants.kPinkColor,
                Constants.kGreenColor,
              ],
            ),
          ),
          child: RawMaterialButton(
            onPressed: () {},
            shape: const CircleBorder(),
            fillColor: const Color(0xff404c57),
            child: SvgPicture.asset(Constants.kIconPlus),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: GlassmorphicContainer(
        linearGradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Constants.kWhiteColor.withOpacity(.10),
            Constants.kWhiteColor.withOpacity(.10),
          ],
        ),
        borderGradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Constants.kPinkColor,
            Constants.kGreenColor,
          ],
        ),
        border: 0,
        borderRadius: 0,
        height: 92,
        width: screenWidth,
        blur: 30,
        child: BottomAppBar(
          color: Colors.transparent,
          notchMargin: 6,
          elevation: 0,
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(Constants.kIconHome),
                  ),
                ),
                Expanded(
                  child: IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(Constants.kIconPlayTv),
                  ),
                ),
                const Expanded(child: Text('')),
                Expanded(
                  child: IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(Constants.kIconCategories),
                  ),
                ),
                Expanded(
                  child: IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(Constants.kIconDownload),
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

class MaskedImage extends StatelessWidget {
  final String asset;
  final String mask;

  const MaskedImage({Key? key, required this.asset, required this.mask})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return FutureBuilder<List>(
        future: _createShaderAndImage(
            asset, mask, constraints.maxWidth, constraints.maxHeight),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return const SizedBox.shrink();
          return ShaderMask(
            blendMode: BlendMode.dstATop,
            shaderCallback: (rect) => snapshot.data![0],
            child: snapshot.data![1],
          );
        },
      );
    });
  }

  Future<List> _createShaderAndImage(
      String asset, String mask, double w, double h) async {
    ByteData data = await rootBundle.load(asset);
    ByteData maskData = await rootBundle.load(mask);

    Codec codec = await instantiateImageCodec(maskData.buffer.asUint8List(),
        targetWidth: w.toInt(), targetHeight: h.toInt());
    FrameInfo fi = await codec.getNextFrame();

    ImageShader shader = ImageShader(
        fi.image, TileMode.clamp, TileMode.clamp, Matrix4.identity().storage);
    Image image = Image.memory(data.buffer.asUint8List(),
        fit: BoxFit.cover, width: w, height: h);
    return [shader, image];
  }
}
