import 'package:baby_list/feature/loby/domain/bloc/loby_bloc.dart';
import 'package:baby_list/get_it.dart';
import 'package:baby_list/xds/atom/stadium_button.dart';
import 'package:baby_list/xds/atom/stadium_text_field.dart';
import 'package:baby_list/xds/template/frame.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Loby extends StatelessWidget {
  Loby({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LobyBloc bloc = getIt<LobyBloc>();
    return BlocProvider(
      create: (context) => bloc,
      child: Frame(
        title: '¿Qué quieres hacer?',
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: StadiumTextField(
                hintText: 'Introduce el código de lista',
                onChanged: (text) => bloc.add(LobyEvent.listCodeTyped(text)),
              ),
            ),
            BlocBuilder<LobyBloc, LobyState>(
              builder: (context, state) {
                return state.when(
                  nonAbleToSubmit: () => StadiumButton(
                    text: 'Ver la lista de regalos',
                  ),
                  ableToSubmit: () {
                    return StadiumButton(
                      text: 'Ver la lista de regalos',
                      onPressed: () => bloc.add(LobyEvent.submit()),
                    );
                  },
                  loadingList: () => CircularProgressIndicator(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
