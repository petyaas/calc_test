// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get title => 'Калькулятор процентов';

  @override
  String get calculate => 'Рассчитать';

  @override
  String get reset => 'Сбросить';

  @override
  String get valueHint => 'Значение (например, 2000)';

  @override
  String get percentHint => 'Процент (например, 115)';

  @override
  String get history => 'История';

  @override
  String get noHistory => 'Нет истории';

  @override
  String get errorMessage => 'Значения должны быть больше нуля';
}
