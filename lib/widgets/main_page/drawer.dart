import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gmp/bloc/films_bloc/films_bloc.dart';
import 'package:flutter_gmp/constants/language_type.dart';
import 'package:flutter_gmp/generated/l10n.dart';
import 'package:flutter_gmp/main.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String language = S.of(context).language;
    final FilmsBloc bloc = BlocProvider.of<FilmsBloc>(context);

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(S.of(context).switchLanguageLabel),
          ),
          if (language != LanguageType.en)
            ListTile(
              title: const Text('Switch to English'),
              onTap: () {
                bloc.add(
                  const SwitchLanguageEvent(language: LanguageType.en),
                );
              },
            ),
          if (language != LanguageType.ru)
            ListTile(
              title: const Text('Switch to Russian'),
              onTap: () {
                bloc.add(
                  const SwitchLanguageEvent(language: LanguageType.ru),
                );
              },
            ),
        ],
      ),
    );
  }
}
