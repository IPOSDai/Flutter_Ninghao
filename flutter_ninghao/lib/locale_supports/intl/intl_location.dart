import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show SynchronousFuture;

import 'locale_demo_messages_all.dart';

class IntlDemoLocalizations {
  String get title => Intl.message(
    'hello',
    name: 'title',
    desc: 'demo localizations',
  );

  String get tabbar_home => Intl.message(
    'Home',
    name: 'tabbar_home',
    desc: 'tabbar home',
  );

  String get tabbar_explore => Intl.message(
    'Explore',
    name: 'tabbar_home',
    desc: 'tabbar home',
  );

  String get tabbar_home => Intl.message(
    'Home',
    name: 'tabbar_home',
    desc: 'tabbar home',
  );

  String get tabbar_home => Intl.message(
    'Home',
    name: 'tabbar_home',
    desc: 'tabbar home',
  );


  String greet(String name) => Intl.message(
    'hello $name',
    name: 'greet',
    desc: 'greet someone.',
    args: [name],
  );

  static IntlDemoLocalizations of(BuildContext context) {
    return Localizations.of<IntlDemoLocalizations>(
      context,
      IntlDemoLocalizations,
    );
  }


  static Future<IntlDemoLocalizations> load(Locale locale) {
    // TODO: implement load
    final String name =
       locale.countryCode.isEmpty ? locale.languageCode : locale.toString();

    final String localeName = Intl.canonicalizedLocale(name);

    return initializeMessages(localeName).then((bool _) {
      Intl.defaultLocale = localeName;
      return IntlDemoLocalizations();
    });

  }
}

class IntlDemoLocalizationsDelegate extends LocalizationsDelegate<IntlDemoLocalizations> {
  IntlDemoLocalizationsDelegate();

  @override
  Future<IntlDemoLocalizations> load(Locale locale) {
    // TODO: implement load
    return IntlDemoLocalizations.load(locale);
  }

  @override
  bool isSupported(Locale locale) {
    // TODO: implement isSupported
    return true;
  }

  @override
  bool shouldReload(LocalizationsDelegate<IntlDemoLocalizations> old) {
    // TODO: implement shouldReload
    return false;
  }
}