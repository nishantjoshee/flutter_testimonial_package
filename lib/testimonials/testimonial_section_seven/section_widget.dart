import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class SectionWidget extends StatefulWidget {
  SectionWidget({
    Key? key,
    this.title = 'Katy Perry',
    this.subtitle = 'Subtitle',
    this.description =
        "I loved the customer service you guys provided me. That was very nice and patient with questions I had. I"
            " would really like definitely come back here. Thank you for yours service",
    this.outerContainerHeight = 320,
    this.outerContainerWidth = 280,
    this.imageContainerHeight = 100,
    this.imageContainerWidth = 100,
    this.bottomTextWidth = 240,
    this.outerConatinerMarginBottom = 5,
    this.outerConatinerMarginLeft = 5,
    this.outerConatinerMarginRight = 5,
    this.outerConatinerMarginTop = 0,
    this.iconSize = 18.0,
    this.iconData = Icons.star,
    this.imagePath =
        'https://tvcontract.com/wp-content/uploads/2018/01/Deiah_Riley_WFTS.jpg',
    this.isAssetImage = false,
    this.titleStyle = const TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 20,
    ),
    this.subtitleStyle = const TextStyle(
      fontWeight: FontWeight.w200,
      fontSize: 18,
    ),
    this.iconCount = 5,
  }) : super(key: key);
  String title;
  String subtitle;
  String description;

  double outerContainerHeight;
  double outerContainerWidth;
  double imageContainerHeight;
  double imageContainerWidth;
  double bottomTextWidth;

  double outerConatinerMarginRight;
  double outerConatinerMarginLeft;
  double outerConatinerMarginTop;
  double outerConatinerMarginBottom;
  double iconSize;
  IconData iconData;
  String imagePath;
  bool isAssetImage;
  TextStyle titleStyle;
  TextStyle subtitleStyle;
  int iconCount;
  @override
  State<SectionWidget> createState() => _SectionWidgetState();
}

class _SectionWidgetState extends State<SectionWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
                      child: widget.isAssetImage
                          ? Image.asset(widget.imagePath)
                          : CachedNetworkImage(
                              fit: BoxFit.cover,
                              imageUrl: widget.imagePath,
                              errorWidget:
                                  (BuildContext context, string, dynamic) {
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
                        widget.iconCount,
                        (index) => Icon(
                          widget.iconData,
                          size: widget.iconSize,
                          color: const Color(0xffF0416D),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    widget.title,
                    style: widget.titleStyle,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    widget.subtitle,
                    style: widget.subtitleStyle,
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 40),
            child: SizedBox(
              width: widget.bottomTextWidth,
              child: Text(
                widget.description,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
