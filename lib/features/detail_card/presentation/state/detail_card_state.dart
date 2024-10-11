import 'package:test_isaac/features/detail_card/domain/detail_card.dart';

class DetailCardState {
  final DetailCard? dataDetail;
  final String? option;
  DetailCardState({this.dataDetail, this.option});

  DetailCardState copyWith({DetailCard? dataDetail, String? option}) {
    return DetailCardState(
        dataDetail: dataDetail ?? this.dataDetail,
        option: option ?? this.option);
  }
}
