import 'package:baby_list/feature/signup/domain/bloc/signup_bloc.dart';
import 'package:baby_list/feature/signup/presentation/molecule/background_image.dart';
import 'package:baby_list/feature/signup/presentation/organism/signup_form.dart';
import 'package:baby_list/get_it.dart';
import 'package:baby_list/xds/template/frame.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SignupBloc bloc = getIt<SignupBloc>();
    return Frame(
      child: Stack(
        fit: StackFit.expand,
        children: [
          BackgroundImage(image: 'asset/image/signup_background.webp'),
          BlocProvider(
            create: (context) => bloc,
            child: BlocBuilder<SignupBloc, SignupState>(
              builder: (context, state) {
                if (state is Error) {
                  WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
                    final SnackBar snackBar =
                        SnackBar(content: Text(state.message ?? ''));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  });
                }
                return SignUpForm(
                  onSubmit: (username, email, password) {
                    bloc.add(SignupEvent.submit(username, email, password));
                  },
                  isSending: state is Sending,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
