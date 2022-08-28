import 'package:flutter/material.dart';
import 'package:redux_epics_hi/redux_epics_hi.dart';

final localeReducer = combineReducers<Locale?>([
  TypedReducer<Locale?, RefreshLocaleAction>(_refreshLocale),
]);

Locale? _refreshLocale(Locale? locale, RefreshLocaleAction action) {
  locale = action.locale;
  return locale;
}

class RefreshLocaleAction {
  final Locale? locale;

  RefreshLocaleAction(this.locale);
}
