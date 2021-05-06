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
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              children: [
                Text(
                  'Bienvenid@',
                  style: Theme.of(context).textTheme.headline1,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset('asset/image/loby.webp'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    'En primer lugar queremos darte las gracias por ayudar a esta familia con el recien nacido. Es un momento muy especial que nunca olvidarán y seguro querran compartilo con los seres queridos más cercanos. Para acceder a la lista de regalos solo tienes que escribir a continuación el código de lista.',
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 32.0, bottom: 16.0),
                  child: StadiumTextField(
                    hintText: 'Introduce el código de lista',
                    onChanged: (text) =>
                        bloc.add(LobyEvent.listCodeTyped(text)),
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
        ),
      ),
    );
  }
}
