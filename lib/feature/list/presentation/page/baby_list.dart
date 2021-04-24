import 'package:baby_list/feature/list/domain/bloc/list_bloc.dart';
import 'package:baby_list/feature/list/domain/bloc/event/list_event.dart';
import 'package:baby_list/feature/list/domain/bloc/state/list_state.dart';
import 'package:baby_list/feature/list/presentation/organism/list_widget.dart';
import 'package:baby_list/get_it.dart';
import 'package:baby_list/xds/template/frame.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BabyList extends StatelessWidget {
  BabyList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ListBloc>()..add(Init()),
      child: BlocBuilder<ListBloc, ListState>(
        builder: (context, state) {
          return Frame(
            title: state.when(
              data: (list) => list.title,
              loading: () => '',
              error: (_) => 'Error',
            ),
            child: Center(
              child: state.when(
                data: (list) => ListWidget(list: list.categories),
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
