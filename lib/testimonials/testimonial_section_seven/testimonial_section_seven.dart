import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class TestimonialSeven extends StatefulWidget {
  TestimonialSeven({
    Key? key,
    this.isSlider = true,
    this.carouselHeight = 320,
  }) : super(key: key);
  bool isSlider;
  double carouselHeight;

  @override
  State<TestimonialSeven> createState() => _TestimonialSevenState();
}

class _TestimonialSevenState extends State<TestimonialSeven> {
  var iconSize = 18.0;

  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget sectionWidget = Stack(
      children: [
        Container(
          height: 320,
          width: 280,
          color: Colors.white,
        ),
        Positioned(
          left: 20,
          top: 20,
          child: Container(
            height: 100,
            width: 100,
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
            height: 100,
            width: 100,
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
        Positioned(
          left: 135,
          top: 45,
          child: Column(
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
        ),
        const Positioned(
          left: 15,
          top: 190,
          child: SizedBox(
            width: 220,
            child: Text(
              "I loved the customer service you guys provided me. That was very nice and patient with questions I had. I"
              " would really like definitely come back here. Thank you for yours service",
            ),
          ),
        ),
      ],
    );

    List<Widget> items = [sectionWidget, sectionWidget, sectionWidget];

    return widget.isSlider
        ? Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Stack(
              children: [
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
                  bottom: 10,
                  left: 130,
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
