import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/services/services.dart';
import '../../../../core/ui/design/atoms/text/body/lg_p.dart';
import '../../../../core/ui/design/atoms/text/body/sm_p.dart';
import '../controller/detail_pokemon_controller.dart';

class DetailCard extends StatefulWidget {
  const DetailCard({super.key, required this.ref});
  final WidgetRef ref;
  @override
  State<DetailCard> createState() => _DetailCard();
}

class _DetailCard extends State<DetailCard> {
  @override
  Widget build(BuildContext context) {
    var state = widget.ref.watch(detailPokemonController);
    return state.dataDetail == null
        ? Container()
        : Table(
            children: [
              TableRow(children: [
                TableCell(
                    child: Column(
                  children: [
                    LgP(
                      title: services
                          .decimetersToMeters(state.dataDetail!.height.toInt()),
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      align: TextAlign.center,
                    ),
                    const SmP(
                        title: 'Height',
                        color: Colors.white,
                        align: TextAlign.center,
                        fontWeight: FontWeight.w500)
                  ],
                )),
                TableCell(child: Container()),
                TableCell(
                    child: Column(
                  children: [
                    LgP(
                      title: services.hectogramsToKilograms(
                          state.dataDetail!.weight.toInt()),
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      align: TextAlign.center,
                    ),
                    const SmP(
                        title: 'Weight',
                        color: Colors.white,
                        align: TextAlign.center,
                        fontWeight: FontWeight.w500)
                  ],
                ))
              ])
            ],
          );
  }
}
