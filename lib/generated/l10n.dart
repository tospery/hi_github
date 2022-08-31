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

  /// `home`
  String get home {
    return Intl.message(
      'home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `HiGithub`
  String get appName {
    return Intl.message(
      'HiGithub',
      name: 'appName',
      desc: '',
      args: [],
    );
  }

  /// `Powered by Flutter`
  String get appPowered {
    return Intl.message(
      'Powered by Flutter',
      name: 'appPowered',
      desc: '',
      args: [],
    );
  }

  /// `HiGithub By Flutter`
  String get appSlogan {
    return Intl.message(
      'HiGithub By Flutter',
      name: 'appSlogan',
      desc: '',
      args: [],
    );
  }

  /// `personal`
  String get personal {
    return Intl.message(
      'personal',
      name: 'personal',
      desc: '',
      args: [],
    );
  }

  /// `oauthLogin`
  String get oauthLogin {
    return Intl.message(
      'oauthLogin',
      name: 'oauthLogin',
      desc: '',
      args: [],
    );
  }

  /// `accessToken`
  String get accessToken {
    return Intl.message(
      'accessToken',
      name: 'accessToken',
      desc: '',
      args: [],
    );
  }

  /// `confirm`
  String get confirm {
    return Intl.message(
      'confirm',
      name: 'confirm',
      desc: '',
      args: [],
    );
  }

  /// `ok`
  String get ok {
    return Intl.message(
      'ok',
      name: 'ok',
      desc: '',
      args: [],
    );
  }

  /// `cancel`
  String get cancel {
    return Intl.message(
      'cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `username`
  String get username {
    return Intl.message(
      'username',
      name: 'username',
      desc: '',
      args: [],
    );
  }

  /// `password`
  String get password {
    return Intl.message(
      'password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `login`
  String get login {
    return Intl.message(
      'login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `event`
  String get event {
    return Intl.message(
      'event',
      name: 'event',
      desc: '',
      args: [],
    );
  }

  /// `star`
  String get star {
    return Intl.message(
      'star',
      name: 'star',
      desc: '',
      args: [],
    );
  }

  /// `read and agree`
  String get readAndAgree {
    return Intl.message(
      'read and agree',
      name: 'readAndAgree',
      desc: '',
      args: [],
    );
  }

  /// `user agreement`
  String get userAgreement {
    return Intl.message(
      'user agreement',
      name: 'userAgreement',
      desc: '',
      args: [],
    );
  }

  /// `privacy policy`
  String get privacyPolicy {
    return Intl.message(
      'privacy policy',
      name: 'privacyPolicy',
      desc: '',
      args: [],
    );
  }

  /// `please agree to the agreement first`
  String get termTips {
    return Intl.message(
      'please agree to the agreement first',
      name: 'termTips',
      desc: '',
      args: [],
    );
  }

  /// `joined on {date}`
  String joinedOn(Object date) {
    return Intl.message(
      'joined on $date',
      name: 'joinedOn',
      desc: '',
      args: [date],
    );
  }

  /// `repositories`
  String get repositories {
    return Intl.message(
      'repositories',
      name: 'repositories',
      desc: '',
      args: [],
    );
  }

  /// `followers`
  String get followers {
    return Intl.message(
      'followers',
      name: 'followers',
      desc: '',
      args: [],
    );
  }

  /// `following`
  String get following {
    return Intl.message(
      'following',
      name: 'following',
      desc: '',
      args: [],
    );
  }

  /// `setting`
  String get setting {
    return Intl.message(
      'setting',
      name: 'setting',
      desc: '',
      args: [],
    );
  }

  /// `about`
  String get about {
    return Intl.message(
      'about',
      name: 'about',
      desc: '',
      args: [],
    );
  }

  /// `feedback`
  String get feedback {
    return Intl.message(
      'feedback',
      name: 'feedback',
      desc: '',
      args: [],
    );
  }

  /// `nickname`
  String get nickname {
    return Intl.message(
      'nickname',
      name: 'nickname',
      desc: '',
      args: [],
    );
  }

  /// `bio`
  String get bio {
    return Intl.message(
      'bio',
      name: 'bio',
      desc: '',
      args: [],
    );
  }

  /// `team`
  String get team {
    return Intl.message(
      'team',
      name: 'team',
      desc: '',
      args: [],
    );
  }

  /// `city`
  String get city {
    return Intl.message(
      'city',
      name: 'city',
      desc: '',
      args: [],
    );
  }

  /// `blog`
  String get blog {
    return Intl.message(
      'blog',
      name: 'blog',
      desc: '',
      args: [],
    );
  }

  /// `exitLogin`
  String get exitLogin {
    return Intl.message(
      'exitLogin',
      name: 'exitLogin',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure to logout?`
  String get alertLogoutMessage {
    return Intl.message(
      'Are you sure to logout?',
      name: 'alertLogoutMessage',
      desc: '',
      args: [],
    );
  }

  /// `click to login`
  String get clickToLogin {
    return Intl.message(
      'click to login',
      name: 'clickToLogin',
      desc: '',
      args: [],
    );
  }

  /// `test`
  String get test {
    return Intl.message(
      'test',
      name: 'test',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'zh', countryCode: 'CN'),
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
