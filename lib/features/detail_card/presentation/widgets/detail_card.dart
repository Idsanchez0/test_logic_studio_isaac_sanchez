import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_isaac/core/ui/design/atoms/text/body/md_p.dart';

import '../../../../core/ui/utils/colors/colors.dart';
import '../controller/detail_card_controller.dart';

class DetailCard extends StatefulWidget {
  const DetailCard({super.key, required this.ref});
  final WidgetRef ref;
  @override
  State<DetailCard> createState() => _DetailCard();
}

class _DetailCard extends State<DetailCard> {
  @override
  Widget build(BuildContext context) {
    var state = widget.ref.watch(detailCardController);
    return state.dataDetail == null
        ? Container()
        : Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      child: RichText(
                          text: TextSpan(children: [
                    WidgetSpan(
                        child: MdP(
                            title: 'Nombre: ',
                            color: colors.neutral400,
                            align: TextAlign.justify,
                            fontWeight: FontWeight.bold)),
                    WidgetSpan(
                        child: MdP(
                            title: state.dataDetail!.name.toString(),
                            color: Colors.white,
                            align: TextAlign.justify,
                            fontWeight: FontWeight.w500))
                  ])))
                ],
              ),
              SizedBox(
                height: 10.sp,
              ),
              if (state.dataDetail!.attribute != null) ...[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                        child: RichText(
                            text: TextSpan(children: [
                      WidgetSpan(
                          child: MdP(
                              title: 'Atributo: ',
                              color: colors.neutral400,
                              align: TextAlign.justify,
                              fontWeight: FontWeight.bold)),
                      WidgetSpan(
                          child: MdP(
                              title: state.dataDetail!.attribute.toString(),
                              color: Colors.white,
                              align: TextAlign.justify,
                              fontWeight: FontWeight.w500))
                    ])))
                  ],
                ),
                SizedBox(
                  height: 10.sp,
                ),
              ],
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      child: RichText(
                          text: TextSpan(children: [
                    WidgetSpan(
                        child: MdP(
                            title: 'Descripción: ',
                            color: colors.neutral400,
                            align: TextAlign.start,
                            fontWeight: FontWeight.bold)),
                    WidgetSpan(
                        child: MdP(
                            title: state.dataDetail!.desc.toString(),
                            color: Colors.white,
                            align: TextAlign.start,
                            fontWeight: FontWeight.w500))
                  ])))
                ],
              ),
            ],
          );
  }
}
