import 'package:baby_list/core/navigation/list_arguments.dart';
import 'package:baby_list/feature/list/domain/bloc/list_bloc.dart';
import 'package:baby_list/feature/list/presentation/organism/list_widget.dart';
import 'package:baby_list/get_it.dart';
import 'package:baby_list/xds/template/frame.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BabyList extends StatelessWidget {
  const BabyList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ListArguments? arguments =
        ModalRoute.of(context)?.settings.arguments as ListArguments?;
    ListBloc bloc = getIt<ListBloc>()..add(ListEvent.Init(arguments));
    return BlocProvider(
      create: (context) => bloc,
      child: BlocBuilder<ListBloc, ListState>(
        builder: (context, state) {
          return Frame(
            title: state.when(
              data: (listId, list) => list.title,
              loading: () => '',
              error: (_) => 'Error',
            ),
            child: Center(
              child: state.when(
                data: (listId, list) => ListWidget(
                  list: list.categories,
                  onItemTap: (item) =>
                      bloc.add(ListEvent.ItemTap(listId, item)),
                ),
                loading: () => Center(child: CircularProgressIndicator()),
                error: (error) => Center(child: Text(error.toString())),
              ),
            ),
          );
        },
      ),
    );
  }
}
