import 'package:baby_list/core/navigation/detail_arguments.dart';
import 'package:baby_list/feature/detail/domain/bloc/detail_bloc.dart';
import 'package:baby_list/feature/detail/presentation/template/detail_template.dart';
import 'package:baby_list/get_it.dart';
import 'package:baby_list/xds/template/frame.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Detail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DetailArguments? arguments =
        ModalRoute.of(context)?.settings.arguments as DetailArguments?;

    DetailBloc bloc = getIt<DetailBloc>();
    return BlocProvider(
      create: (context) => bloc..add(DetailEvent.started(arguments)),
      child: BlocBuilder<DetailBloc, DetailState>(
        builder: (context, state) {
          return state.when(initial: () {
            return Frame(
              title: 'Detalle',
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }, booking: (item) {
            return DetailTemplate(
              item: item,
              isBooking: true,
            );
          }, data: (item) {
            return DetailTemplate(
              item: item,
              isBooking: false,
              onBook: () => bloc.add(DetailEvent.booked(item)),
            );
          });
        },
      ),
    );
  }
}
