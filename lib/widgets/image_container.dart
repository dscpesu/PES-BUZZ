import 'package:flutter/material.dart';

class ImageContainer extends StatelessWidget {
  const ImageContainer({
    Key? key,
    this.height,
    required this.borderRadius,
    required this.width,
    required this.imageUrl,
    this.padding,
    this.margin,
    this.child,
    this.boxShadow,
  }) : super(key: key);

  final double width;
  final double? height;
  final String imageUrl;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final BorderRadius? borderRadius;
  final Widget? child;
  final List<BoxShadow>? boxShadow;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
        boxShadow: boxShadow,
      ),
      child: child,
    );
  }
}
