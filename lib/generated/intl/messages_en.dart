// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(date) => "joined on ${date}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "about": MessageLookupByLibrary.simpleMessage("about"),
        "accessToken": MessageLookupByLibrary.simpleMessage("accessToken"),
        "alertLogoutMessage":
            MessageLookupByLibrary.simpleMessage("Are you sure to logout?"),
        "appname": MessageLookupByLibrary.simpleMessage("hi github"),
        "bio": MessageLookupByLibrary.simpleMessage("bio"),
        "blog": MessageLookupByLibrary.simpleMessage("blog"),
        "cancel": MessageLookupByLibrary.simpleMessage("cancel"),
        "city": MessageLookupByLibrary.simpleMessage("city"),
        "clickToLogin": MessageLookupByLibrary.simpleMessage("click to login"),
        "confirm": MessageLookupByLibrary.simpleMessage("confirm"),
        "event": MessageLookupByLibrary.simpleMessage("event"),
        "exitLogin": MessageLookupByLibrary.simpleMessage("exitLogin"),
        "feedback": MessageLookupByLibrary.simpleMessage("feedback"),
        "followers": MessageLookupByLibrary.simpleMessage("followers"),
        "following": MessageLookupByLibrary.simpleMessage("following"),
        "home": MessageLookupByLibrary.simpleMessage("home"),
        "joinedOn": m0,
        "login": MessageLookupByLibrary.simpleMessage("login"),
        "nickname": MessageLookupByLibrary.simpleMessage("nickname"),
        "oauthLogin": MessageLookupByLibrary.simpleMessage("oauthLogin"),
        "ok": MessageLookupByLibrary.simpleMessage("ok"),
        "password": MessageLookupByLibrary.simpleMessage("password"),
        "personal": MessageLookupByLibrary.simpleMessage("personal"),
        "privacyPolicy": MessageLookupByLibrary.simpleMessage("privacy policy"),
        "readAndAgree": MessageLookupByLibrary.simpleMessage("read and agree"),
        "repositories": MessageLookupByLibrary.simpleMessage("repositories"),
        "setting": MessageLookupByLibrary.simpleMessage("setting"),
        "star": MessageLookupByLibrary.simpleMessage("star"),
        "team": MessageLookupByLibrary.simpleMessage("team"),
        "termTips": MessageLookupByLibrary.simpleMessage(
            "please agree to the agreement first"),
        "test": MessageLookupByLibrary.simpleMessage("test"),
        "userAgreement": MessageLookupByLibrary.simpleMessage("user agreement"),
        "username": MessageLookupByLibrary.simpleMessage("username")
      };
}
