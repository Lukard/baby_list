import 'package:baby_list/core/domain/model/baby_list.dart';
import 'package:baby_list/feature/detail/presentation/organism/item_column.dart';
import 'package:baby_list/feature/detail/presentation/organism/participation.dart';
import 'package:baby_list/xds/atom/stadium_button.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class DetailTemplateLandscape extends StatelessWidget {
  final Item item;
  final bool isBooking;
  final VoidCallback? onBook;
  final VoidCallback? onMoreInfo;

  const DetailTemplateLandscape({
    Key? key,
    required this.item,
    required this.isBooking,
    this.onBook,
    this.onMoreInfo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(56.0),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: AspectRatio(
                aspectRatio: 1,
                child: CachedNetworkImage(
                  imageUrl: item.image,
                  imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.contain,
                      ),
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            Container(width: 48.0),
            Expanded(
              flex: 1,
              child: Card(
                elevation: 8.0,
                child: Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: ItemColumn(
                    item: item,
                    isBooking: isBooking,
                    onBook: onBook,
                    onMoreInfo: onMoreInfo,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
