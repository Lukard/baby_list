import 'package:baby_list/feature/welcome/domain/bloc/welcome_bloc.dart';
import 'package:baby_list/get_it.dart';
import 'package:baby_list/xds/atom/stadium_button.dart';
import 'package:baby_list/xds/atom/stadium_text_field.dart';
import 'package:baby_list/xds/template/frame.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WelcomeBloc bloc = getIt<WelcomeBloc>();
    return BlocProvider(
      create: (context) => bloc,
      child: Frame(
        title: 'Encantado de concerte',
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Nos alegra mucho verte por aquí'),
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: StadiumTextField(
                  hintText: '¿Cómo te llamas?',
                  onChanged: (text) => bloc.add(WelcomeEvent.nameTyped(text)),
                ),
              ),
              BlocBuilder<WelcomeBloc, WelcomeState>(
                builder: (context, state) {
                  return StadiumButton(
                    text: '¡Quiero regalar!',
                    onPressed: state.when(
                      nonAbleToSubmit: () => null,
                      ableToSubmit: () => () => bloc.add(WelcomeEvent.submit()),
                      userLoggedIn: (userId) => null,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
