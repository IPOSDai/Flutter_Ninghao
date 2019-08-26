import 'package:flutter/material.dart';
import 'package:flutter_ninghao/locale_supports/local_utils.dart';


class I18nDemoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Locale locale = Localizations.localeOf(context);

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        elevation: 0.0,
        title: Text("i18n Demo"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(locale.toString()),
            Text(
              Localizations.of(context, LocaleUtils).title,
              style: Theme.of(context).textTheme.title,
            ),
          ],
        ),
      ),
    );
  }
}
