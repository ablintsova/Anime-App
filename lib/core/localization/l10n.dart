// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Top Rated Anime`
  String get topAnimeSectionTitle {
    return Intl.message(
      'Top Rated Anime',
      name: 'topAnimeSectionTitle',
      desc: '',
      args: [],
    );
  }

  /// `Why do you even care about what other people think?`
  String get emptyTopAnimeListMessage {
    return Intl.message(
      'Why do you even care about what other people think?',
      name: 'emptyTopAnimeListMessage',
      desc: '',
      args: [],
    );
  }

  /// `Explore Genres`
  String get genresSectionTitle {
    return Intl.message(
      'Explore Genres',
      name: 'genresSectionTitle',
      desc: '',
      args: [],
    );
  }

  /// `Hmm, I guess, anime is it's own genre...`
  String get emptyGenreListMessage {
    return Intl.message(
      'Hmm, I guess, anime is it\'s own genre...',
      name: 'emptyGenreListMessage',
      desc: '',
      args: [],
    );
  }

  /// `See all`
  String get seeAllButtonText {
    return Intl.message(
      'See all',
      name: 'seeAllButtonText',
      desc: '',
      args: [],
    );
  }

  /// `Year`
  String get year {
    return Intl.message(
      'Year',
      name: 'year',
      desc: '',
      args: [],
    );
  }

  /// `Title`
  String get title {
    return Intl.message(
      'Title',
      name: 'title',
      desc: '',
      args: [],
    );
  }

  /// `Japanese title`
  String get japaneseTitle {
    return Intl.message(
      'Japanese title',
      name: 'japaneseTitle',
      desc: '',
      args: [],
    );
  }

  /// `Episodes`
  String get episodes {
    return Intl.message(
      'Episodes',
      name: 'episodes',
      desc: '',
      args: [],
    );
  }

  /// `Score`
  String get score {
    return Intl.message(
      'Score',
      name: 'score',
      desc: '',
      args: [],
    );
  }

  /// `Synopsis`
  String get synopsis {
    return Intl.message(
      'Synopsis',
      name: 'synopsis',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en', countryCode: 'EN'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
