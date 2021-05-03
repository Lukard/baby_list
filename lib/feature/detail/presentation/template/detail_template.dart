import 'package:baby_list/core/domain/model/baby_list.dart';
import 'package:baby_list/xds/template/frame.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class DetailTemplate extends StatelessWidget {
  final Item item;
  final bool isBooking;
  final VoidCallback? onBook;

  const DetailTemplate({
    Key? key,
    required this.item,
    required this.isBooking,
    this.onBook,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Frame(
      title: item.title,
      child: Column(
        children: [
          CachedNetworkImage(imageUrl: item.image),
          Text(item.description ?? ''),
          Text('${item.price} €'),
          item.available > 0
              ? Column(
                  children: [
                    Text('${item.available} disponibles'),
                    isBooking
                        ? CircularProgressIndicator()
                        : ElevatedButton(
                            onPressed: onBook,
                            child: Text('Reservar'),
                          ),
                  ],
                )
              : Text(
                  'Gente maravillosa ya ha reservado este regalo. Vuelve a la lista, seguro que encuentras algún artículo de tu agrado.',
                ),
        ],
      ),
    );
  }
}
