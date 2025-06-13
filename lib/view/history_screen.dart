import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../l10n/app_localizations.dart';
class HistoryScreen extends StatelessWidget {
  final Box historyBox = Hive.box('history');

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(title: Text(l10n.history)),
      body: ValueListenableBuilder(
        valueListenable: historyBox.listenable(),
        builder: (context, Box box, _) {
          if (box.isEmpty) {
            return Center(child: Text('нет истории'));
          }
          return ListView.builder(
            itemCount: box.length,
            itemBuilder: (context, index) {
              final item = box.getAt(index);
              return ListTile(
                title: Text('100% = ${item['result'].toStringAsFixed(2)}'),
                subtitle: Text('${item['value']} is ${item['percent']}%'),
                trailing: Text(item['timestamp'].substring(0, 16)),
              );
            },
          );
        },
      ),
    );
  }
}