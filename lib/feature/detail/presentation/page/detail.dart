import 'package:baby_list/feature/detail/domain/bloc/detail_bloc.dart';
import 'package:baby_list/feature/detail/presentation/template/detail_template.dart';
import 'package:baby_list/get_it.dart';
import 'package:baby_list/xds/template/frame.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Detail extends StatelessWidget {
  final String listId;
  final String itemId;

  const Detail({
    Key? key,
    required this.listId,
    required this.itemId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DetailBloc bloc = getIt<DetailBloc>();
    return BlocProvider(
      create: (context) =>
          bloc..add(DetailEvent.started(listId: listId, itemId: itemId)),
      child: BlocBuilder<DetailBloc, DetailState>(
        builder: (context, state) {
          return state.when(initial: () {
            return Frame(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }, booking: (item) {
            return Frame(
              child: DetailTemplate(
                item: item,
                isBooking: true,
              ),
            );
          }, data: (listId, item) {
            return Frame(
              child: DetailTemplate(
                item: item,
                isBooking: false,
                onBook: () =>
                    bloc.add(DetailEvent.booked(listId: listId, item: item)),
                onMoreInfo: () =>
                    bloc.add(DetailEvent.moreInformation(item.link)),
              ),
            );
          });
        },
      ),
    );
  }
}
