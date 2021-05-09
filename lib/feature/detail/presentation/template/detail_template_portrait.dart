import 'package:baby_list/core/domain/model/baby_list.dart';
import 'package:baby_list/feature/detail/presentation/organism/item_column.dart';
import 'package:baby_list/feature/detail/presentation/organism/participation.dart';
import 'package:baby_list/xds/atom/stadium_button.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class DetailTemplatePortrait extends StatelessWidget {
  final Item item;
  final bool isBooking;
  final VoidCallback? onBook;
  final VoidCallback? onMoreInfo;

  const DetailTemplatePortrait({
    Key? key,
    required this.item,
    required this.isBooking,
    this.onBook,
    this.onMoreInfo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        CachedNetworkImage(imageUrl: item.image),
        Column(
          children: [
            Expanded(child: Container()),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Theme.of(context).canvasColor,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(16.0),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(context).shadowColor.withAlpha(64),
                    blurRadius: 8.0,
                  ),
                ],
              ),
              child: Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: ItemColumn(
                    item: item,
                    isBooking: isBooking,
                    onBook: onBook,
                    onMoreInfo: onMoreInfo,
                  )),
            ),
          ],
        ),
      ],
    );
  }
}
