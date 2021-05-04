import 'package:baby_list/core/domain/model/baby_list.dart';
import 'package:baby_list/xds/organism/item_widget.dart';
import 'package:flutter/material.dart';

typedef OnItemTap = void Function(Item item);

class ListWidget extends StatelessWidget {
  final String title;
  final List<Category> list;
  final OnItemTap onItemTap;

  ListWidget({
    Key? key,
    required this.title,
    required this.list,
    required this.onItemTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(16.0),
      itemCount: list.length + 1,
      itemBuilder: (context, index) {
        if (index == 0) {
          return Padding(
            padding: const EdgeInsets.only(top: 56.0),
            child: Text(
              title,
              style: Theme.of(context).textTheme.headline1,
            ),
          );
        } else {
          int itemsPerRow = MediaQuery.of(context).size.width.toInt() ~/ 200;
          double itemWidth = MediaQuery.of(context).size.width / itemsPerRow;
          double itemHeight = itemWidth + 120;
          String categoryTitle = list[index - 1].title;
          List<Item> items = list[index - 1].items;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                categoryTitle,
                style: Theme.of(context).textTheme.headline3,
              ),
              GridView.count(
                shrinkWrap: true,
                childAspectRatio: itemWidth / itemHeight,
                crossAxisCount:
                    MediaQuery.of(context).size.width.toInt() ~/ 200,
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
        }
      },
    );
  }
}
