import 'package:baby_list/feature/welcome/domain/bloc/welcome_bloc.dart';
import 'package:baby_list/get_it.dart';
import 'package:baby_list/xds/template/frame.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Welcome extends StatelessWidget {
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
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius:
                          const BorderRadius.all(const Radius.circular(32.0)),
                    ),
                    contentPadding: EdgeInsets.symmetric(horizontal: 24.0),
                    hintText: '¿Cómo te llamas?',
                  ),
                  onChanged: (text) => bloc.add(WelcomeEvent.nameTyped(text)),
                ),
              ),
              BlocBuilder<WelcomeBloc, WelcomeState>(
                builder: (context, state) {
                  return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32.0),
                      ),
                    ),
                    onPressed: state.when(
                      nonAbleToSubmit: () => null,
                      ableToSubmit: () => () => bloc.add(WelcomeEvent.submit()),
                      userLoggedIn: (userId) => null,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text('¡Quiero regalar!'),
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
