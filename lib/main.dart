import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:twilioSample/pages/entry_page.dart';

void main() {
  runApp(
    ProviderScope(
      child: MaterialApp(
        home: EntryPage(),
      ),
    ),
  );
}
