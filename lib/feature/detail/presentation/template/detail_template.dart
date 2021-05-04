import 'package:baby_list/core/domain/model/baby_list.dart';
import 'package:baby_list/feature/detail/presentation/organism/participation.dart';
import 'package:baby_list/xds/atom/stadium_button.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class DetailTemplate extends StatelessWidget {
  final Item item;
  final bool isBooking;
  final VoidCallback? onBook;
  final VoidCallback? onMoreInfo;

  const DetailTemplate({
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.title,
                      style: Theme.of(context).textTheme.headline1,
                    ),
                    item.description != null
                        ? Text(
                            item.description!,
                            style: Theme.of(context).textTheme.bodyText2,
                          )
                        : Container(),
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: Divider(),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: Row(
                        children: [
                          Text(
                            'Precio aproximado: ',
                            style: Theme.of(context).textTheme.headline4,
                          ),
                          Text(
                            '${item.price} €',
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: Participation(
                        participants: item.bookings
                                ?.map((booking) => booking.name)
                                .toList() ??
                            [],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 32.0),
                      child: StadiumButton(
                        text: 'Más información',
                        onPressed: onMoreInfo,
                      ),
                    ),
                    Container(
                      height: 64.0,
                    ),
                    item.available > 0
                        ? Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Text(
                                  '¡Rápido! Solo quedan ${item.available} disponibles.',
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                              ),
                              isBooking
                                  ? CircularProgressIndicator()
                                  : StadiumButton(
                                      text: 'Reservar',
                                      onPressed: onBook,
                                      shouldFillAllWidth: true,
                                      isRelevant: true,
                                    )
                            ],
                          )
                        : Text(
                            'Gente maravillosa ya ha reservado este regalo. Vuelve a la lista, seguro que encuentras algún artículo de tu agrado.',
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
