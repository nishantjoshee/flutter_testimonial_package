import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class TestimonialSeven extends StatefulWidget {
  TestimonialSeven({
    Key? key,
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

  @override
  State<TestimonialSeven> createState() => _TestimonialSevenState();
}

class _TestimonialSevenState extends State<TestimonialSeven> {
  var iconSize = 18.0;

  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget sectionWidget = Container(
      margin: EdgeInsets.only(
        right: widget.outerConatinerMarginRight,
        bottom: widget.outerConatinerMarginBottom,
        left: widget.outerConatinerMarginLeft,
        top: widget.outerConatinerMarginTop,
      ),
      color: Colors.white,
      height: widget.outerContainerHeight,
      width: widget.outerContainerWidth,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Stack(
                children: [
                  SizedBox(
                    height: widget.imageContainerHeight + 50,
                    width: widget.imageContainerWidth + 50,
                  ),
                  Positioned(
                    left: 20,
                    top: 20,
                    child: Container(
                      height: widget.imageContainerHeight,
                      width: widget.imageContainerWidth,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1.0,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 8,
                    top: 32,
                    child: Container(
                      color: Colors.blue,
                      height: widget.imageContainerHeight,
                      width: widget.imageContainerWidth,
                      child: CachedNetworkImage(
                        fit: BoxFit.cover,
                        imageUrl:
                            'https://tvcontract.com/wp-content/uploads/2018/01/Deiah_Riley_WFTS.jpg',
                        errorWidget: (BuildContext context, string, dynamic) {
                          return const Icon(Icons.error);
                        },
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Row(
                    children: [
                      ...List.generate(
                        5,
                        (index) => Icon(
                          Icons.star,
                          size: iconSize,
                          color: const Color(0xffF0416D),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    'Delia Riley',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text('Finance Manager'),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 40),
            child: SizedBox(
              width: widget.bottomTextWidth,
              child: const Text(
                "I loved the customer service you guys provided me. That was very nice and patient with questions I had. I"
                " would really like definitely come back here. Thank you for yours service",
              ),
            ),
          ),
        ],
      ),
    );

    List<Widget> items = [sectionWidget, sectionWidget, sectionWidget];

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
