import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_testimonial_package/testimonials/testimonial_section_seven/section_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class TestimonialSeven extends StatefulWidget {
  TestimonialSeven({
    Key? key,
    required this.data,
    this.isSlider = true,
    this.carouselHeight = 320,
    this.outerContainerHeight = 320,
    this.outerContainerWidth = 280,
    this.imageContainerHeight = 100,
    this.imageContainerWidth = 100,
    this.bottomTextWidth = 240,
    this.indicatorPositionBottom = 0,
    this.indicatorPositionLeft = 140,
    this.indicatorPositionRight = 0,
    this.indicatorPositionTop = 275,
    this.outerConatinerMarginBottom = 5,
    this.outerConatinerMarginLeft = 5,
    this.outerConatinerMarginRight = 5,
    this.outerConatinerMarginTop = 0,
    this.iconSize = 18.0,
    this.iconData = Icons.star,
    this.imagePath =
        'https://tvcontract.com/wp-content/uploads/2018/01/Deiah_Riley_WFTS.jpg',
    this.isAssetImage = false,
  }) : super(key: key);
  bool isSlider;
  double carouselHeight;
  double outerContainerHeight;
  double outerContainerWidth;
  double imageContainerHeight;
  double imageContainerWidth;
  double bottomTextWidth;

  double indicatorPositionBottom;
  double indicatorPositionTop;
  double indicatorPositionLeft;
  double indicatorPositionRight;
  double outerConatinerMarginRight;
  double outerConatinerMarginLeft;
  double outerConatinerMarginTop;
  double outerConatinerMarginBottom;
  double iconSize;
  IconData iconData;
  String imagePath;
  bool isAssetImage;
  List data;

  @override
  State<TestimonialSeven> createState() => _TestimonialSevenState();
}

class _TestimonialSevenState extends State<TestimonialSeven> {
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    List items = [
      ...widget.data,
    ];
    var widgets = items.map(
      (e) => SectionWidget(
        title: e.title,
        subtitle: e.subtitle,
        description: e.description,
        iconData: widget.iconData,
        bottomTextWidth: widget.bottomTextWidth,
        iconSize: widget.iconSize,
        imageContainerHeight: widget.imageContainerHeight,
        imageContainerWidth: widget.imageContainerWidth,
        imagePath: widget.imagePath,
        isAssetImage: widget.isAssetImage,
        outerConatinerMarginBottom: widget.outerConatinerMarginBottom,
        outerConatinerMarginLeft: widget.outerConatinerMarginLeft,
        outerConatinerMarginRight: widget.outerConatinerMarginRight,
        outerConatinerMarginTop: widget.outerConatinerMarginTop,
        outerContainerHeight: widget.outerContainerHeight,
        outerContainerWidth: widget.outerContainerWidth,
      ),
    );

    return widget.isSlider
        ? Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Stack(
              children: [
                Container(
                  height: widget.carouselHeight,
                ),
                CarouselSlider(
                  items: items,
                  options: CarouselOptions(
                    enableInfiniteScroll: false,
                    height: widget.carouselHeight,
                    autoPlay: false,
                    onPageChanged: (index, reason) {
                      setState(() {
                        activeIndex = index;
                      });
                    },
                  ),
                ),
                Positioned(
                  bottom: widget.indicatorPositionBottom,
                  left: widget.indicatorPositionLeft,
                  right: widget.indicatorPositionRight,
                  top: widget.indicatorPositionTop,
                  child: AnimatedSmoothIndicator(
                    effect: SlideEffect(
                      dotWidth: 8,
                      dotHeight: 8,
                      dotColor: Colors.grey[400]!,
                      activeDotColor: Colors.blueAccent,
                    ),
                    activeIndex: activeIndex,
                    count: items.length,
                  ),
                ),
              ],
            ),
          )
        : Padding(
            padding: const EdgeInsets.only(left: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ...items,
              ],
            ),
          );
  }
}
