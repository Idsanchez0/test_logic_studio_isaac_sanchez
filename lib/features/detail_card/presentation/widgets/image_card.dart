import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/ui/utils/colors/color_generator.dart';

class ImageCard extends StatefulWidget {
  const ImageCard({
    super.key,
    required this.image,
  });
  final String image;
  @override
  State<ImageCard> createState() => _ImageCard();
}

class _ImageCard extends State<ImageCard> {
  Color colorCard = Colors.transparent;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () => validateColorCard());
  }

  validateColorCard() async {
    ColorsGenerator colorsGenerator = ColorsGenerator();
    Color colorCardGenerated =
        await colorsGenerator.generateCardColor(widget.image, true);
    if (mounted) {
      setState(() {
        colorCard = colorCardGenerated;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.sp, vertical: 5.sp),
      decoration: BoxDecoration(
          color: colorCard,
          image: DecorationImage(
              image: NetworkImage(widget.image),
              fit: BoxFit.contain,
              opacity: .95),
          borderRadius: BorderRadius.all(Radius.circular(15.sp))),
    );
  }
}
