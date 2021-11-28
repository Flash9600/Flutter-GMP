import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gmp/bloc/films_bloc/films_bloc.dart';
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
          if (language != 'en-EN')
            ListTile(
              title: const Text('Switch to English'),
              onTap: () {
                MyApp.of(context)
                    ?.setLocale(const Locale.fromSubtags(languageCode: 'en'));
                bloc.add(const FilmsFetchedEvent());
                Navigator.pop(context);
              },
            ),
          if (language != 'ru-RU')
            ListTile(
              title: const Text('Switch to Russian'),
              onTap: () {
                MyApp.of(context)
                    ?.setLocale(const Locale.fromSubtags(languageCode: 'ru'));
                bloc.add(const FilmsFetchedEvent());
                Navigator.pop(context);
              },
            ),
        ],
      ),
    );
  }
}
