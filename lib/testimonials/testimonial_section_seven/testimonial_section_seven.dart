import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_testimonial_package/testimonials/testimonial_section_seven/section_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// ignore: must_be_immutable
class TestimonialSeven extends StatefulWidget {
  TestimonialSeven({
    Key? key,
    this.isSlider = true,
    required this.data,
    this.iconData = Icons.star,
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
    this.outerContainerColor = Colors.green,
    this.iconSize = 18.0,
    this.dotHeight = 8,
    this.dotWidth = 8,
    this.imagePath =
        'https://tvcontract.com/wp-content/uploads/2018/01/Deiah_Riley_WFTS.jpg',
    this.isAssetImage = false,
    this.navWidgetLeft = const CircleAvatar(
      radius: 18,
      child: Icon(
        Icons.arrow_back_ios,
        size: 18,
      ),
    ),
    this.navWidgetRight = const CircleAvatar(
      radius: 18,
      child: Icon(
        Icons.arrow_forward_ios,
        size: 18,
      ),
    ),
  }) : super(key: key);
  bool isSlider;
  final List<dynamic> data;
  //Define compulsory
  //<Class Name>(
  //String? title,
  //String? subtitle,
  //IconData? iconData,
  //String? image,
  //double? iconSize,
  //)
  IconData iconData;

  double carouselHeight;
  double outerContainerHeight;
  double outerContainerWidth;
  Color outerContainerColor;
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
  double dotHeight;
  double dotWidth;
  Widget navWidgetLeft;
  Widget navWidgetRight;
  String imagePath;
  bool isAssetImage;

  @override
  State<TestimonialSeven> createState() => _TestimonialSevenState();
}

class _TestimonialSevenState extends State<TestimonialSeven> {
  final controller = CarouselController();

  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    List items = [
      ...widget.data,
    ];
    var widgets = items.map(
      (e) => SectionWidget(
        title: e.title,
        subtitle: e.subtitle ?? 'Subtitle ww',
        iconData: e.iconData ?? widget.iconData,
        imagePath: e.image ?? widget.imagePath,
        iconSize: e.iconSize ?? widget.iconSize,
        bottomTextWidth: widget.bottomTextWidth,
        imageContainerHeight: widget.imageContainerHeight,
        imageContainerWidth: widget.imageContainerWidth,
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
        ? Stack(
            children: [
              Container(
                height: widget.outerContainerHeight,
                color: widget.outerContainerColor,
              ),
              CarouselSlider(
                items: widgets.toList(),
                options: CarouselOptions(
                  enableInfiniteScroll: false,
                  viewportFraction: 1,
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
                bottom: 0,
                left: 140,
                right: 0,
                top: 275,
                child: AnimatedSmoothIndicator(
                  onDotClicked: (index) {
                    controller.animateToPage(index);
                  },
                  effect: SlideEffect(
                    dotWidth: widget.dotWidth,
                    dotHeight: widget.dotHeight,
                    dotColor: Colors.grey[400]!,
                    activeDotColor: Colors.blueAccent,
                  ),
                  activeIndex: activeIndex,
                  count: items.length,
                ),
              ),
              Positioned(
                top: 140,
                left: 8,
                child: InkWell(
                  onTap: () {
                    controller.previousPage();
                  },
                  child: widget.navWidgetLeft,
                ),
              ),
              Positioned(
                top: 140,
                right: 8,
                child: InkWell(
                  onTap: () {
                    controller.nextPage();
                  },
                  child: widget.navWidgetRight,
                ),
              )
            ],
          )
        : SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ...widgets.toList(),
              ],
            ),
          );
  }
}
