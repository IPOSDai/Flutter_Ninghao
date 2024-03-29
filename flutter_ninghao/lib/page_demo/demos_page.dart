import 'package:flutter/material.dart';
import "../help.dart";

import 'package:flutter_ninghao/page_demo/widget_demo/form_page.dart';
import 'package:flutter_ninghao/page_demo/widget_demo/buttons_page.dart';
import 'package:flutter_ninghao/page_demo/widget_demo/popupmenu_page.dart';
import 'package:flutter_ninghao/page_demo/widget_demo/input_page.dart';
import 'package:flutter_ninghao/page_demo/widget_demo/dialog_page.dart';
import 'package:flutter_ninghao/page_demo/widget_demo/mdc_page.dart';
import 'package:flutter_ninghao/page_demo/widget_demo/data_table_page.dart';

import 'package:flutter_ninghao/page_demo/widget_demo/state_manage_page.dart';
import 'package:flutter_ninghao/page_demo/widget_demo/stream_page.dart';
import 'package:flutter_ninghao/rxdart_demo/rxdart_page.dart';

import 'package:flutter_ninghao/page_demo/bloc_page.dart';
import 'package:flutter_ninghao/page_demo/http_page.dart';
import 'package:flutter_ninghao/page_demo/animation_page.dart';
import 'package:flutter_ninghao/page_demo/i18n_page.dart';

import '../widges/listview_item.dart';


class DemosPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        elevation: 0.0,
        title: Text("DEMOS"),
        leading: MenuIconButton(),
      ),
      body: ListView(
        children: <Widget>[
          ListViewItem(
            height: 54.0,
            title: 'Form Input Demo',
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (BuildContext context) {
                    return FormPage();
                  })
              );
            },
          ),

          ListViewItem(
            height: 54.0,
            title: 'Buttons Demo',
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (BuildContext context) {
                    return ButtonDemoPage();
                  })
              );
            },
          ),

          ListViewItem(
            height: 54.0,
            title: 'Popup Menu Demo',
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (BuildContext context) {
                    return PopupMenuPage();
                  })
              );
            },
          ),

          ListViewItem(
            height: 54.0,
            title: 'Input Demo',
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (BuildContext context) {
                    return InputDemoPage();
                  })
              );
            },
          ),

          ListViewItem(
            height: 54.0,
            title: 'Dialog Demo',
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (BuildContext context) {
                    return DialogDemoPage();
                  })
              );
            },
          ),

          Container(
            color: Colors.transparent,
            height: 20.0,
          ),

          ListViewItem(
            height: 54.0,
            title: 'MDC Demo',
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (BuildContext context) {
                    return MDCDemoPage();
                  })
              );
            },
          ),

          ListViewItem(
            height: 54.0,
            title: 'MDC DataTable Demo',
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (BuildContext context) {
                    return DataTableDemoPage();
                  })
              );
            },
          ),

          ListViewItem(
            height: 54.0,
            title: 'StateManage Demo',
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (BuildContext context) {
                    return StateManageDemoPage();
                  })
              );
            },
          ),

          ListViewItem(
            height: 54.0,
            title: 'Stream Demo',
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (BuildContext context) {
                    return StreamDemoPage();
                  })
              );
            },
          ),

          ListViewItem(
            height: 54.0,
            title: 'RxDart Demo',
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (BuildContext context) {
                    return RxDartDemoPage();
                  })
              );
            },
          ),

          Container(
            color: Colors.transparent,
            height: 20.0,
          ),

          ListViewItem(
            height: 54.0,
            title: 'Block Demo',
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (BuildContext context) {
                    return BlocDemoPage();
                  })
              );
            },
          ),

          ListViewItem(
            height: 54.0,
            title: 'Animation Demo',
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (BuildContext context) {
                    return AnimationDemoPage();
                  })
              );
            },
          ),

          ListViewItem(
            height: 54.0,
            title: 'i18n Demo',
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (BuildContext context) {
                    return I18nDemoPage();
                  })
              );
            },
          ),

        ],
      ),
    );
  }
}
