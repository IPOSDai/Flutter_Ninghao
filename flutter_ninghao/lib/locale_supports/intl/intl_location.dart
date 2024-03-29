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
    name: 'tabbar_explore',
    desc: 'tabbar explore',
  );

  String get tabbar_history => Intl.message(
    'History',
    name: 'tabbar_history',
    desc: 'tabbar history',
  );

  String get tabbar_demos => Intl.message(
    'Demos',
    name: 'tabbar_demos',
    desc: 'tabbar demos',
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

// flutter pub pub run intl_translation:extract_to_arb --output-dir=lib/locale_supports/intl lib/locale_supports/intl/intl_location.dart

// flutter pub pub run intl_translation:generate_from_arb --generated-file-prefix=locale_demo_ --output-dir=lib/locale_supports/intl/ --no-use-deferred-loading lib/locale_supports/intl/intl_location.dart lib/locale_supports/intl/intl_*.arb