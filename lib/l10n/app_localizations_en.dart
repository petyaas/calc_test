// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get title => 'Percentage Calculator';

  @override
  String get calculate => 'Calculate';

  @override
  String get reset => 'Reset';

  @override
  String get valueHint => 'Value (e.g., 2000)';

  @override
  String get percentHint => 'Percent (e.g., 115)';

  @override
  String get history => 'History';

  @override
  String get noHistory => 'No history';

  @override
  String get errorMessage => 'Values must be greater than zero';
}
