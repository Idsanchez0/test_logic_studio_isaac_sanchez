import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../atoms/body/sm_p.dart';

class ImageCard extends StatefulWidget {
  final String imagePath;
  final String title;
  const ImageCard({super.key, required this.imagePath, required this.title});
  @override
  State<ImageCard> createState() => _ImageCard();
}

class _ImageCard extends State<ImageCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20.sp),
      height: 200.sp,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(widget.imagePath), fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(12.sp)),
      alignment: Alignment.bottomCenter,
      child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.7),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(12.sp),
                bottomRight: Radius.circular(12.sp),
              )),
          child: SmP(
              title: widget.title,
              color: Colors.white,
              align: TextAlign.center,
              fontWeight: FontWeight.bold)),
    );
  }
}
