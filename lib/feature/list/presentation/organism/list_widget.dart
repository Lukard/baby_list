import 'package:baby_list/core/domain/model/baby_list.dart';
import 'package:baby_list/xds/organism/item_widget.dart';
import 'package:flutter/material.dart';

typedef OnItemTap = void Function(Item item);

class ListWidget extends StatelessWidget {
  final List<Category> list;
  final OnItemTap onItemTap;

  ListWidget({
    Key? key,
    required this.list,
    required this.onItemTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(16.0),
      itemCount: list.length,
      itemBuilder: (context, index) {
        int itemsPerRow = MediaQuery.of(context).size.width.toInt() ~/ 200;
        double itemWidth = MediaQuery.of(context).size.width / itemsPerRow;
        double itemHeight = itemWidth + 120;
        String title = list[index].title;
        List<Item> items = list[index].items;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.headline3,
            ),
            GridView.count(
              shrinkWrap: true,
              childAspectRatio: itemWidth / itemHeight,
              crossAxisCount: MediaQuery.of(context).size.width.toInt() ~/ 200,
              children: List.generate(
                items.length,
                (index) => ItemWidget(
                  item: items[index],
                  onTap: () => onItemTap(items[index]),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
