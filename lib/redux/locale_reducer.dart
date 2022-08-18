import 'package:flutter/material.dart';
import 'package:hi_flutter/hi_flutter.dart';

final localeReducer = combineReducers<Locale?>([
  TypedReducer<Locale?, RefreshLocaleAction>(_refresh),
]);

class RefreshLocaleAction {
  final Locale? locale;

  RefreshLocaleAction(this.locale);
}

Locale? _refresh(Locale? locale, RefreshLocaleAction action) {
  locale = action.locale;
  return locale;
}
