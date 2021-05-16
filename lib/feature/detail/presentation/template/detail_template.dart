import 'package:baby_list/core/domain/model/baby_list.dart';
import 'package:baby_list/feature/detail/presentation/template/detail_template_landscape.dart';
import 'package:baby_list/feature/detail/presentation/template/detail_template_portrait.dart';
import 'package:flutter/material.dart';

class DetailTemplate extends StatelessWidget {
  final Item item;
  final bool isBooking;
  final bool didAtLeastOneBooking;
  final VoidCallback? onBook;
  final VoidCallback? onDiscard;
  final VoidCallback? onMoreInfo;

  const DetailTemplate({
    Key? key,
    required this.item,
    required this.isBooking,
    required this.didAtLeastOneBooking,
    this.onBook,
    this.onDiscard,
    this.onMoreInfo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    double aspectRatio = width / height;

    if (aspectRatio <= 1) {
      return DetailTemplatePortrait(
        item: item,
        isBooking: isBooking,
        didAtLeastOneBooking: didAtLeastOneBooking,
        onBook: onBook,
        onDiscard: onDiscard,
        onMoreInfo: onMoreInfo,
      );
    } else {
      return DetailTemplateLandscape(
        item: item,
        isBooking: isBooking,
        didAtLeastOneBooking: didAtLeastOneBooking,
        onBook: onBook,
        onDiscard: onDiscard,
        onMoreInfo: onMoreInfo,
      );
    }
  }
}
