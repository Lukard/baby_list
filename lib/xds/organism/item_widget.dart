import 'package:baby_list/core/domain/model/baby_list.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ItemWidget extends StatelessWidget {
  final Item item;
  final GestureTapCallback? onTap;

  const ItemWidget({
    Key? key,
    required this.item,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: CachedNetworkImage(imageUrl: item.image),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  if (item.description != null)
                    Text(item.description!)
                  else
                    Text(""),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "${item.price} €",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(child: Container()),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Theme.of(context).accentColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(4.0),
                  bottomRight: Radius.circular(4.0),
                ),
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "${item.available} disponibles",
                    style: Theme.of(context)
                        .textTheme
                        .button
                        ?.copyWith(color: Colors.white),
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
