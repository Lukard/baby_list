import 'package:baby_list/feature/list/domain/bloc/list_bloc.dart';
import 'package:baby_list/core/domain/model/baby_list.dart';
import 'package:baby_list/get_it.dart';
import 'package:baby_list/xds/organism/item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListWidget extends StatelessWidget {
  final String listId;
  final List<Category> list;

  ListWidget({Key? key, required this.listId, required this.list})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ListBloc bloc = getIt<ListBloc>();
    return BlocProvider(
      create: (context) => bloc,
      child: BlocBuilder<ListBloc, ListState>(
        builder: (context, state) {
          return ListView.builder(
            padding: EdgeInsets.all(16.0),
            itemCount: list.length,
            itemBuilder: (context, index) {
              int itemsPerRow =
                  MediaQuery.of(context).size.width.toInt() ~/ 200;
              double itemWidth =
                  MediaQuery.of(context).size.width / itemsPerRow;
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
                    crossAxisCount:
                        MediaQuery.of(context).size.width.toInt() ~/ 200,
                    children: List.generate(
                      items.length,
                      (index) => ItemWidget(
                        item: items[index],
                        onTap: () =>
                            bloc.add(ListEvent.ItemTap(listId, items[index])),
                      ),
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
