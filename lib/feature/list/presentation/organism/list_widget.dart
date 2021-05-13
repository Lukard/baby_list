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
            padding: const EdgeInsets.only(top: 56.0, bottom: 8.0),
            child: Column(
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.headline1,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 8.0,
                    left: 8.0,
                    right: 8.0,
                  ),
                  child: Text(
                    'Aquí tienes la lista de todos las cosas que necesitan los padres para poderle brindar la mejor atención a su bebé. Busca entre estos objetos los que más te gusten y desees contribuir para preparar la mejor llegada al mundo del bebé.',
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ),
              ],
            ),
          );
        } else {
          int itemsPerRow = MediaQuery.of(context).size.width.toInt() ~/ 200;
          double itemWidth = MediaQuery.of(context).size.width / itemsPerRow;
          double itemHeight = itemWidth + 180;
          String categoryTitle = list[index - 1].title;
          List<Item> items = list[index - 1].items;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 32.0,
                  bottom: 8.0,
                  left: 8.0,
                  right: 8.0,
                ),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Theme.of(context).primaryColor,
                      width: 1.0,
                      style: BorderStyle.solid,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 8.0,
                    ),
                    child: Text(
                      categoryTitle,
                      style: Theme.of(context).textTheme.headline3,
                    ),
                  ),
                ),
              ),
              GridView.count(
                primary: false,
                padding: EdgeInsets.all(0),
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
