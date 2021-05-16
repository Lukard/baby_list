import 'package:baby_list/core/domain/model/baby_list.dart';
import 'package:baby_list/feature/detail/presentation/molecule/booking_area.dart';
import 'package:baby_list/feature/detail/presentation/organism/participation.dart';
import 'package:baby_list/xds/atom/stadium_button.dart';
import 'package:flutter/material.dart';

class ItemColumn extends StatelessWidget {
  final Item item;
  final bool isBooking;
  final bool didAtLeastOneBooking;
  final VoidCallback? onBook;
  final VoidCallback? onDiscard;
  final VoidCallback? onMoreInfo;

  const ItemColumn({
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
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          item.title,
          style: Theme.of(context).textTheme.headline1,
        ),
        if (item.description != null)
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              item.description!,
              style: Theme.of(context).textTheme.bodyText2,
            ),
          ),
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
          padding: const EdgeInsets.only(top: 8.0),
          child: Participation(
            participants:
                item.bookings?.map((booking) => booking.name).toList() ?? [],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: StadiumButton(
            text: 'Más información',
            onPressed: onMoreInfo,
          ),
        ),
        Container(
          height: 64.0,
        ),
        BookingArea(
          isBooking: isBooking,
          didAtLeastOneBooking: didAtLeastOneBooking,
          remainingBookings: item.available,
          onBook: onBook,
          onDiscard: onDiscard,
        ),
      ],
    );
  }
}
