import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'es', 'de', 'ar'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? esText = '',
    String? deText = '',
    String? arText = '',
  }) =>
      [enText, esText, deText, arText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // Login------0
  {
    'mzpkk4wk': {
      'en': 'De Drug',
      'ar': 'البدء',
      'de': 'Loslegen',
      'es': 'Empezar',
    },
    'a9j78va9': {
      'en': 'FName',
      'ar': 'عنوان البريد الالكترونى',
      'de': 'E-Mail-Addresse',
      'es': 'Dirección de correo electrónico',
    },
    'i7f18cve': {
      'en': 'Enter your  first name....',
      'ar': 'أدخل بريدك الإلكتروني ...',
      'de': 'Geben sie ihre E-Mail Adresse ein...',
      'es': 'Introduce tu correo electrónico...',
    },
    '7ap317c6': {
      'en': 'LName',
      'ar': 'عنوان البريد الالكترونى',
      'de': 'E-Mail-Addresse',
      'es': 'Dirección de correo electrónico',
    },
    '9j85ivba': {
      'en': 'Enter your last name....',
      'ar': 'أدخل بريدك الإلكتروني ...',
      'de': 'Geben sie ihre E-Mail Adresse ein...',
      'es': 'Introduce tu correo electrónico...',
    },
    'crewzb5c': {
      'en': 'Email',
      'ar': 'عنوان البريد الالكترونى',
      'de': 'E-Mail-Addresse',
      'es': 'Dirección de correo electrónico',
    },
    'rj61to6u': {
      'en': 'Enter your email...',
      'ar': 'أدخل بريدك الإلكتروني ...',
      'de': 'Geben sie ihre E-Mail Adresse ein...',
      'es': 'Introduce tu correo electrónico...',
    },
    'wztjmbn8': {
      'en': 'Password',
      'ar': 'كلمة المرور',
      'de': 'Passwort',
      'es': 'Contraseña',
    },
    'lw1jpm1f': {
      'en': 'Enter your password...',
      'ar': 'ادخل رقمك السري...',
      'de': 'Geben Sie Ihr Passwort ein...',
      'es': 'Ingresa tu contraseña...',
    },
    'dx8g1k2i': {
      'en': 'ConfirmPassword',
      'ar': 'كلمة المرور',
      'de': 'Passwort',
      'es': 'Contraseña',
    },
    'uytn4s6d': {
      'en': 'Enter your password...',
      'ar': 'ادخل رقمك السري...',
      'de': 'Geben Sie Ihr Passwort ein...',
      'es': 'Ingresa tu contraseña...',
    },
    'qbmoi1av': {
      'en': 'Sign',
      'ar': 'تسجيل الدخول',
      'de': 'Anmeldung',
      'es': 'Acceso',
    },
    '2bb3vct7': {
      'en': 'Home',
      'ar': 'مسكن',
      'de': 'Heim',
      'es': 'Casa',
    },
  },
  // Adminlogin
  {
    'gpokmd81': {
      'en': 'Admin Login',
      'ar': 'البدء',
      'de': 'Loslegen',
      'es': 'Empezar',
    },
    'oitrrwgg': {
      'en': 'Login',
      'ar': 'قم بإنشاء حسابك أدناه.',
      'de': 'Erstellen Sie unten Ihr Konto.',
      'es': 'Crea tu cuenta a continuación.',
    },
    'gcwdqm4g': {
      'en': 'Email Address',
      'ar': 'عنوان البريد الالكترونى',
      'de': 'E-Mail-Addresse',
      'es': 'Dirección de correo electrónico',
    },
    'iam0xgwx': {
      'en': 'Enter your email...',
      'ar': 'أدخل بريدك الإلكتروني ...',
      'de': 'Geben sie ihre E-Mail Adresse ein...',
      'es': 'Introduce tu correo electrónico...',
    },
    'bqv15dcf': {
      'en': 'Password',
      'ar': 'كلمة المرور',
      'de': 'Passwort',
      'es': 'Contraseña',
    },
    'joih97mn': {
      'en': 'Enter your password...',
      'ar': 'ادخل رقمك السري...',
      'de': 'Geben Sie Ihr Passwort ein...',
      'es': 'Ingresa tu contraseña...',
    },
    '5kmjfwsk': {
      'en': 'Login',
      'ar': 'إنشاء حساب',
      'de': 'Benutzerkonto erstellen',
      'es': 'Crear una cuenta',
    },
    'momge5oj': {
      'en': 'Home',
      'ar': 'مسكن',
      'de': 'Heim',
      'es': 'Casa',
    },
  },
  // EDUCATION
  {
    '23kts0he': {
      'en': 'Rate Your Experience',
      'ar': '',
      'de': '',
      'es': '',
    },
    '3hpq5176': {
      'en':
          'How would you rate your learning experience with our educational tools?',
      'ar': '',
      'de': '',
      'es': '',
    },
    'a61ngagp': {
      'en': 'Your feedback helps us improve!',
      'ar': '',
      'de': '',
      'es': '',
    },
    'fyqsepo9': {
      'en': 'Popular Tools',
      'ar': '',
      'de': '',
      'es': '',
    },
    'gst5obey': {
      'en': 'Digital Library',
      'ar': '',
      'de': '',
      'es': '',
    },
    'rt56mdi2': {
      'en': 'Access thousands of educational resources',
      'ar': '',
      'de': '',
      'es': '',
    },
    '5ftkh126': {
      'en': 'Practice Tests',
      'ar': '',
      'de': '',
      'es': '',
    },
    '1vgmfnua': {
      'en': 'Test your knowledge with interactive quizzes',
      'ar': '',
      'de': '',
      'es': '',
    },
    'iv9j3ktu': {
      'en': 'Learning Progress',
      'ar': '',
      'de': '',
      'es': '',
    },
    '5qlmzpxk': {
      'en': '75% Complete',
      'ar': '',
      'de': '',
      'es': '',
    },
    'iwsog7eq': {
      'en': '25% Remaining',
      'ar': '',
      'de': '',
      'es': '',
    },
    'fnvbxr8s': {
      'en': 'Education Tools',
      'ar': '',
      'de': '',
      'es': '',
    },
    '598b8d3m': {
      'en': 'Education',
      'ar': 'مسكن',
      'de': 'Heim',
      'es': 'Casa',
    },
  },
  // MOTIVATION
  {
    'uxuv31gv': {
      'en':
          '\"Success is not final, failure is not fatal: it is the courage to continue that counts.\"',
      'ar': '',
      'de': '',
      'es': '',
    },
    '92jxz0go': {
      'en': 'Daily Progress',
      'ar': '',
      'de': '',
      'es': '',
    },
    '2sb0mo52': {
      'en': 'Motivation Level',
      'ar': '',
      'de': '',
      'es': '',
    },
    'at0p6lk7': {
      'en': '85%',
      'ar': '',
      'de': '',
      'es': '',
    },
    'eatb32wi': {
      'en': 'Daily Goals',
      'ar': '',
      'de': '',
      'es': '',
    },
    'ys22fwio': {
      'en': '4/5',
      'ar': '',
      'de': '',
      'es': '',
    },
    '94n3qvi7': {
      'en': 'Mood Tracker',
      'ar': '',
      'de': '',
      'es': '',
    },
    'c2ij7lp9': {
      'en': 'Great',
      'ar': '',
      'de': '',
      'es': '',
    },
    'ms13o4q3': {
      'en': 'Good',
      'ar': '',
      'de': '',
      'es': '',
    },
    'mljux555': {
      'en': 'Okay',
      'ar': '',
      'de': '',
      'es': '',
    },
    'gp958911': {
      'en': 'Motivation',
      'ar': '',
      'de': '',
      'es': '',
    },
    'ofz2zvlc': {
      'en': '•',
      'ar': '•',
      'de': '•',
      'es': '•',
    },
  },
  // PROFILESETTINGS
  {
    'f1bvbey3': {
      'en': 'My Account',
      'ar': 'حسابي',
      'de': 'Mein Konto',
      'es': 'Mi cuenta',
    },
    'eojlfs66': {
      'en': 'Privacy Policy',
      'ar': 'سياسة الخصوصية',
      'de': 'Datenschutz-Bestimmungen',
      'es': 'Política de privacidad',
    },
    '2ll42t1u': {
      'en': 'Dark Mode',
      'ar': '',
      'de': '',
      'es': '',
    },
    '8d386226': {
      'en': 'Light Mode',
      'ar': '',
      'de': '',
      'es': '',
    },
    'amz7303i': {
      'en': 'Admin Login',
      'ar': '',
      'de': '',
      'es': '',
    },
    '8srr2k0j': {
      'en': 'Profile',
      'ar': '•',
      'de': '•',
      'es': '•',
    },
  },
  // HOTSPOT
  {
    'ifi6fmsa': {
      'en': 'Hotspots',
      'ar': 'المعاملات',
      'de': 'Transaktionen',
      'es': 'Actas',
    },
    'h6hqhujt': {
      'en': 'Ernakulam',
      'ar': '',
      'de': '',
      'es': '',
    },
    'ak9m8szp': {
      'en': 'Kochi',
      'ar': 'دخل',
      'de': 'Einkommen',
      'es': 'Ingreso',
    },
    '3doa1muw': {
      'en': '12 reports',
      'ar': '',
      'de': '',
      'es': '',
    },
    '25b5ktt6': {
      'en': 'Thrissur',
      'ar': '',
      'de': '',
      'es': '',
    },
    '1t5i40nc': {
      'en': 'Chiyaram',
      'ar': 'دخل',
      'de': 'Einkommen',
      'es': 'Ingreso',
    },
    'b3j6rex0': {
      'en': '8 reports',
      'ar': '',
      'de': '',
      'es': '',
    },
    'nl45j1ab': {
      'en': 'Kottayam',
      'ar': '',
      'de': '',
      'es': '',
    },
    '3xjvb9pk': {
      'en': 'Income',
      'ar': 'دخل',
      'de': 'Einkommen',
      'es': 'Ingreso',
    },
    '4mx8pxf1': {
      'en': '2 reports',
      'ar': '',
      'de': '',
      'es': '',
    },
    'jeunfhhy': {
      'en': 'Hotspot',
      'ar': '',
      'de': '',
      'es': '',
    },
    'l53kroui': {
      'en': 'Home',
      'ar': 'مسكن',
      'de': 'Heim',
      'es': 'Casa',
    },
  },
  // REPORTSUBMITPAGE
  {
    'xf8d4sm8': {
      'en': 'Report Submitted',
      'ar': 'نقل كامل',
      'de': 'Übertragung vollständig',
      'es': 'transferencia completa',
    },
    'iq9jjji8': {
      'en': 'We have successfully submitted your request',
      'ar':
          'عمل رائع ، لقد قمت بتحويل الأموال بنجاح. قد يستغرق خروج الأموال من حسابك بضعة أيام.',
      'de':
          'Großartige Arbeit, Sie haben erfolgreich Geld überwiesen. Es kann einige Tage dauern, bis das Geld von Ihrem Konto abgebucht wird.',
      'es':
          'Buen trabajo, transfirió fondos con éxito. Los fondos pueden tardar unos días en salir de su cuenta.',
    },
    'wrbg19ed': {
      'en': 'Okay',
      'ar': 'تمام',
      'de': 'Okay',
      'es': 'Okey',
    },
    'ndkybnrt': {
      'en': 'Home',
      'ar': 'مسكن',
      'de': 'Heim',
      'es': 'Casa',
    },
  },
  // REPORTPAGE
  {
    '91y6h692': {
      'en': '\"All reports are confidential and help us take action.\"',
      'ar': '',
      'de': '',
      'es': '',
    },
    '6wwrof44': {
      'en': 'Form',
      'ar': '',
      'de': '',
      'es': '',
    },
    'c7rdqzgd': {
      'en': 'Catagory of report',
      'ar': '',
      'de': '',
      'es': '',
    },
    '94ebsdqy': {
      'en': 'Search...',
      'ar': '',
      'de': '',
      'es': '',
    },
    'pcpbq0vf': {
      'en': 'Drug abuse',
      'ar': '',
      'de': '',
      'es': '',
    },
    'weflwfkd': {
      'en': 'Wanderism',
      'ar': '',
      'de': '',
      'es': '',
    },
    '7jce6lsp': {
      'en': 'Uncontrolled anger',
      'ar': '',
      'de': '',
      'es': '',
    },
    'hl6n39yb': {
      'en': 'Location Details',
      'ar': '',
      'de': '',
      'es': '',
    },
    'xamcrc79': {
      'en': 'Select Location',
      'ar': '',
      'de': '',
      'es': '',
    },
    '5zzmlri6': {
      'en': 'Details',
      'ar': '',
      'de': '',
      'es': '',
    },
    'yq4kp03o': {
      'en': 'Enter as much details as possible',
      'ar': '',
      'de': '',
      'es': '',
    },
    'dubbxrpi': {
      'en': 'Upload Media',
      'ar': '',
      'de': '',
      'es': '',
    },
    'i7l6wo31': {
      'en': 'Upload Media (optional)',
      'ar': '',
      'de': '',
      'es': '',
    },
    '77vixbxe': {
      'en': 'Enter date',
      'ar': '',
      'de': '',
      'es': '',
    },
    'jejs0pr2': {
      'en': 'Submit Anonymously',
      'ar': '',
      'de': '',
      'es': '',
    },
    'li523qi0': {
      'en': 'Report Anonymously',
      'ar': '',
      'de': '',
      'es': '',
    },
    '59naq8ur': {
      'en': 'Home',
      'ar': 'مسكن',
      'de': 'Heim',
      'es': 'Casa',
    },
  },
  // ADMINPAGE
  {
    'ucqlrrlk': {
      'en': 'Welcome,',
      'ar': 'مرحبا،',
      'de': 'Herzlich willkommen,',
      'es': 'Bienvenidos,',
    },
    'jta9zpij': {
      'en': 'Isaac',
      'ar': '',
      'de': '',
      'es': '',
    },
    'c10wb3ot': {
      'en': 'Welcome Admin',
      'ar': 'تفاصيل حسابك أدناه.',
      'de': 'Ihre Kontodetails sind unten.',
      'es': 'Los detalles de su cuenta se encuentran a continuación.',
    },
    '6z1sm34j': {
      'en': 'Total reports',
      'ar': 'إجمالي الرصيد',
      'de': 'Gesamtsaldo',
      'es': 'Balance total',
    },
    'c0dls4u5': {
      'en': '9',
      'ar': '25202 دولار',
      'de': '25.202 \$',
      'es': '\$25,202',
    },
    '30yef7fj': {
      'en': 'server',
      'ar': 'الرواتب المستحقة',
      'de': 'Gehaltsabrechnung fällig',
      'es': 'Vencimiento de nómina',
    },
    'zrx9e6tv': {
      'en': 'Active',
      'ar': '12245 دولارًا',
      'de': '12.245 \$',
      'es': '\$12,245',
    },
    '1cjqanzg': {
      'en': 'Date',
      'ar': 'تاريخ الخصم',
      'de': 'Belastungsdatum',
      'es': 'Fecha de débito',
    },
    '726vrs60': {
      'en': 'Aug 31, 2021',
      'ar': '31 أغسطس 2021',
      'de': '31. August 2021',
      'es': '31 de agosto de 2021',
    },
    '4dgbx46t': {
      'en': '4 Days Left',
      'ar': 'باقي 4 ايام',
      'de': 'noch 4 Tage',
      'es': '4 días restantes',
    },
    'n87v5tth': {
      'en': 'Quiz',
      'ar': 'ميزانية التسويق',
      'de': 'Werbehaushalt, Werbebudget',
      'es': 'Presupuesto de marketing',
    },
    'l5pw5c8c': {
      'en': '6 Try',
      'ar': '4000 دولار',
      'de': '4.000 \$',
      'es': '\$4,000',
    },
    '7i0a44qa': {
      'en': 'Total ',
      'ar': 'إجمال الصرف',
      'de': 'Gesamtausgaben',
      'es': 'Total gastado',
    },
    '9a2ya1la': {
      'en': '4 new quiz',
      'ar': '3،402 دولار',
      'de': '\$3.402',
      'es': '\$3,402',
    },
    'n1o498d9': {
      'en': '7 Days Left',
      'ar': 'باقي 4 ايام',
      'de': 'noch 4 Tage',
      'es': '4 días restantes',
    },
    'lmo3ko2i': {
      'en': '                          Quick Services',
      'ar': 'خدمات سريعة',
      'de': 'Schnelle Dienste',
      'es': 'Servicios rápidos',
    },
    '774itrkn': {
      'en': 'Hotspots',
      'ar': 'بنكي',
      'de': 'Meine Bank',
      'es': 'Mi banco',
    },
    'g8yaaa7f': {
      'en': 'Analytics',
      'ar': 'نشاط',
      'de': 'Aktivität',
      'es': 'Actividad',
    },
    'nb29ps2o': {
      'en': '1 New Alert',
      'ar': '1 تنبيه جديد',
      'de': '1 Neue Benachrichtigung',
      'es': '1 nueva alerta',
    },
    'vgt9s153': {
      'en': 'View Now',
      'ar': 'عرض الآن',
      'de': 'Jetzt ansehen',
      'es': 'Ver ahora',
    },
    'pnvkw3b7': {
      'en': 'We noticed a new report without location',
      'ar': 'لقد لاحظنا تكلفة صغيرة خارجة عن طبيعة هذا الحساب ، يرجى المراجعة.',
      'de':
          'Wir haben eine kleine Belastung festgestellt, die für dieses Konto untypisch ist. Bitte überprüfen Sie diese.',
      'es':
          'Notamos un pequeño cargo que está fuera de lugar en esta cuenta, revíselo.',
    },
    'gcei6eay': {
      'en': 'Admin Panel',
      'ar': '',
      'de': '',
      'es': '',
    },
    'c805m53i': {
      'en': 'Home',
      'ar': 'مسكن',
      'de': 'Heim',
      'es': 'Casa',
    },
  },
  // Home------------1
  {
    '51kawpgz': {
      'en': 'Welcome',
      'ar': 'مرحبا،',
      'de': 'Herzlich willkommen,',
      'es': 'Bienvenidos,',
    },
    '30kx6e5v': {
      'en': 'Your latest updates are below.',
      'ar': 'آخر التحديثات الخاصة بك أدناه.',
      'de': 'Ihre neuesten Updates sind unten.',
      'es': 'Sus últimas actualizaciones se encuentran a continuación.',
    },
    'y7zomzzp': {
      'en': 'Quick Actions',
      'ar': 'خدمة سريعة',
      'de': 'Schneller Service',
      'es': 'Servicio rapido',
    },
    'rfozud9v': {
      'en': 'Tasks',
      'ar': 'تحويل',
      'de': 'Transfer',
      'es': 'Transferir',
    },
    'pcrarg0a': {
      'en': 'Forum',
      'ar': 'نشاط',
      'de': 'Aktivität',
      'es': 'Actividad',
    },
    'zmjsfzgg': {
      'en': 'Booking',
      'ar': 'بنكي',
      'de': 'Meine Bank',
      'es': 'Mi banco',
    },
    'k65cx30a': {
      'en': 'Mental  Games',
      'ar': 'تحويل',
      'de': 'Transfer',
      'es': 'Transferir',
    },
    'ex2zkigz': {
      'en': 'Motivation',
      'ar': 'نشاط',
      'de': 'Aktivität',
      'es': 'Actividad',
    },
    'syqhmsxd': {
      'en': 'Report',
      'ar': 'بنكي',
      'de': 'Meine Bank',
      'es': 'Mi banco',
    },
    '98cwpm5d': {
      'en': 'Family\nSupport',
      'ar': 'تحويل',
      'de': 'Transfer',
      'es': 'Transferir',
    },
    'jcudve4n': {
      'en': 'Law',
      'ar': 'نشاط',
      'de': 'Aktivität',
      'es': 'Actividad',
    },
    'ke3rtn2o': {
      'en': 'Support',
      'ar': 'بنكي',
      'de': 'Meine Bank',
      'es': 'Mi banco',
    },
    'dfjtbkbo': {
      'en': 'Notifications',
      'ar': 'عملية',
      'de': 'Transaktion',
      'es': 'Transacción',
    },
    'g7t9krj7': {
      'en': 'New event',
      'ar': 'احصل على مكافآت بعيدة',
      'de': 'Go-Far-Prämien',
      'es': 'Recompensas Ve Lejos',
    },
    'vupu5y5p': {
      'en': 'Welcome to De Drug',
      'ar': 'دخل',
      'de': 'Einkommen',
      'es': 'Ingreso',
    },
    'bj5qnrj5': {
      'en': '15 points',
      'ar': '50.00 دولارًا أمريكيًا',
      'de': '\$50,00',
      'es': '\$50.00',
    },
    '8pdmehj2': {
      'en': 'New Quiz',
      'ar': 'احصل على مكافآت بعيدة',
      'de': 'Go-Far-Prämien',
      'es': 'Recompensas Ve Lejos',
    },
    'krrhjgc4': {
      'en': 'Try the new quiz out!',
      'ar': 'دخل',
      'de': 'Einkommen',
      'es': 'Ingreso',
    },
    '53m2u0s2': {
      'en': '3 points',
      'ar': '50.00 دولارًا أمريكيًا',
      'de': '\$50,00',
      'es': '\$50.00',
    },
    '8t6ddwco': {
      'en': 'Today\'s task',
      'ar': 'احصل على مكافآت بعيدة',
      'de': 'Go-Far-Prämien',
      'es': 'Recompensas Ve Lejos',
    },
    'td15kjsa': {
      'en': 'Drink 3 liters today',
      'ar': 'دخل',
      'de': 'Einkommen',
      'es': 'Ingreso',
    },
    'qmjqp9a6': {
      'en': '5 points',
      'ar': '50.00 دولارًا أمريكيًا',
      'de': '\$50,00',
      'es': '\$50.00',
    },
    '2thn73jc': {
      'en': 'Quote of the day',
      'ar': 'احصل على مكافآت بعيدة',
      'de': 'Go-Far-Prämien',
      'es': 'Recompensas Ve Lejos',
    },
    '1fjdiibo': {
      'en':
          '\"Every step away from drugs is a step to\n  the life you deserved\"',
      'ar': 'دخل',
      'de': 'Einkommen',
      'es': 'Ingreso',
    },
    '0eqgvd82': {
      'en': 'Logout',
      'ar': '',
      'de': '',
      'es': '',
    },
    'e1a0knrq': {
      'en': 'Home',
      'ar': '',
      'de': '',
      'es': '',
    },
    'f3hxl69y': {
      'en': 'Home',
      'ar': 'مسكن',
      'de': 'Heim',
      'es': 'Casa',
    },
  },
  // GAMEmakenow
  {
    'fgf8icmv': {
      'en': '   SELECT ANY ONE',
      'ar': '23000 دولار',
      'de': '23.000 \$',
      'es': '\$23,000',
    },
    'vewa5op5': {
      'en': '            🦉 Owl',
      'ar': 'بيتكوين',
      'de': 'Bitcoin',
      'es': 'Bitcoin',
    },
    'opob20j8': {
      'en': '           🐅 Tiger',
      'ar': 'سولونا',
      'de': 'Solona',
      'es': 'Soloña',
    },
    'l2io5lul': {
      'en': '         🐬 Dolphin',
      'ar': 'دوجكوين',
      'de': 'Dogecoins',
      'es': 'dogecoin',
    },
    '5xdkfwtk': {
      'en': '          🐢 Turtle',
      'ar': 'دوجكوين',
      'de': 'Dogecoins',
      'es': 'dogecoin',
    },
    'wjpmgbwq': {
      'en': 'Mental Games',
      'ar': '',
      'de': '',
      'es': '',
    },
    'vox9t1s0': {
      'en': 'Home',
      'ar': 'مسكن',
      'de': 'Heim',
      'es': 'Casa',
    },
  },
  // TASKS
  {
    'f6hro54v': {
      'en': 'check.io',
      'ar': '',
      'de': '',
      'es': '',
    },
    '7gg2z8b2': {
      'en': 'Andrew D.',
      'ar': '',
      'de': '',
      'es': '',
    },
    'zp7bhyci': {
      'en': 'admin@gmail.com',
      'ar': '',
      'de': '',
      'es': '',
    },
    'wa12grtp': {
      'en': 'Dashboard',
      'ar': '',
      'de': '',
      'es': '',
    },
    'p4rztugm': {
      'en': 'Transactions',
      'ar': '',
      'de': '',
      'es': '',
    },
    '3xxtdbpb': {
      'en': 'Projects',
      'ar': '',
      'de': '',
      'es': '',
    },
    'uez78hmt': {
      'en': 'Users',
      'ar': '',
      'de': '',
      'es': '',
    },
    'lhn816vy': {
      'en': 'Tasks Pending',
      'ar': '',
      'de': '',
      'es': '',
    },
    'fkzsczyn': {
      'en': 'My Channels / Task / Task #4234',
      'ar': '',
      'de': '',
      'es': '',
    },
    'pk1nf4o4': {
      'en': 'Update our command Palette to be more usable.',
      'ar': '',
      'de': '',
      'es': '',
    },
    'qpsc7a6a': {
      'en': 'Subtasks',
      'ar': '',
      'de': '',
      'es': '',
    },
    'ov507124': {
      'en': '0 tasks',
      'ar': '',
      'de': '',
      'es': '',
    },
    'jt332mhi': {
      'en': 'Created',
      'ar': '',
      'de': '',
      'es': '',
    },
    '0vpnsonm': {
      'en': 'Created',
      'ar': '',
      'de': '',
      'es': '',
    },
    'embd9ktj': {
      'en': 'Due Date',
      'ar': '',
      'de': '',
      'es': '',
    },
    'tzp9z0sd': {
      'en': '10 Jan, 2023',
      'ar': '',
      'de': '',
      'es': '',
    },
    '4ne4s9gb': {
      'en': 'Categories',
      'ar': '',
      'de': '',
      'es': '',
    },
    '01gzet0k': {
      'en': 'Design System',
      'ar': '',
      'de': '',
      'es': '',
    },
    '7fca4lga': {
      'en': 'Product',
      'ar': '',
      'de': '',
      'es': '',
    },
    'vhx0kf3f': {
      'en': 'Description',
      'ar': '',
      'de': '',
      'es': '',
    },
    'ghhfrj9s': {
      'en': 'Leave a note here...',
      'ar': '',
      'de': '',
      'es': '',
    },
    'pzojr776': {
      'en': 'Post Note',
      'ar': '',
      'de': '',
      'es': '',
    },
    '27gvpnid': {
      'en': 'Daily Tasks',
      'ar': '',
      'de': '',
      'es': '',
    },
    '0i1f51ad': {
      'en': 'Home',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
  // LAWS
  {
    'jjatsmfp': {
      'en': 'Legal Resources',
      'ar': '',
      'de': '',
      'es': '',
    },
    'w1ykwthu': {
      'en': 'Select Jurisdiction',
      'ar': '',
      'de': '',
      'es': '',
    },
    'kn1vbhuj': {
      'en': 'Laws',
      'ar': '',
      'de': '',
      'es': '',
    },
    'hz14kofp': {
      'en': 'Penalties',
      'ar': '',
      'de': '',
      'es': '',
    },
    'v0zrti98': {
      'en': 'Resources',
      'ar': '',
      'de': '',
      'es': '',
    },
    '1h0abm0q': {
      'en': 'Schedule I Substances',
      'ar': '',
      'de': '',
      'es': '',
    },
    'xif3vbdr': {
      'en': 'Highest restriction level - no accepted medical use',
      'ar': '',
      'de': '',
      'es': '',
    },
    '4308myqm': {
      'en': 'Legal Status:',
      'ar': '',
      'de': '',
      'es': '',
    },
    'vt23larg': {
      'en': 'Strictly prohibited - Federal criminal penalties apply',
      'ar': '',
      'de': '',
      'es': '',
    },
    'k8tfdmj0': {
      'en': 'Schedule II ',
      'ar': '',
      'de': '',
      'es': '',
    },
    'p1ctjozt': {
      'en': 'High potential for abuse, accepted medical use with restrictions',
      'ar': '',
      'de': '',
      'es': '',
    },
    '34ssazy1': {
      'en': 'Possession Limits:',
      'ar': '',
      'de': '',
      'es': '',
    },
    '1cb13f5t': {
      'en': 'Valid prescription required, strict quantity limits apply',
      'ar': '',
      'de': '',
      'es': '',
    },
    'rsntgo0h': {
      'en': 'Medical Cannabis Laws',
      'ar': '',
      'de': '',
      'es': '',
    },
    '3h56o3vl': {
      'en': 'State-regulated medical program requirements',
      'ar': '',
      'de': '',
      'es': '',
    },
    'fqnwedcd': {
      'en': 'Requirements:',
      'ar': '',
      'de': '',
      'es': '',
    },
    '4bh0qn5z': {
      'en': 'State registration, licensed dispensary purchases only',
      'ar': '',
      'de': '',
      'es': '',
    },
    'sitj9xfp': {
      'en': 'Legal Penalties Overview',
      'ar': '',
      'de': '',
      'es': '',
    },
    'ouysfecq': {
      'en': 'Review current penalties and rehabilitation options',
      'ar': '',
      'de': '',
      'es': '',
    },
    'rmthmffe': {
      'en': 'Possession Charges',
      'ar': '',
      'de': '',
      'es': '',
    },
    'vje8tf9y': {
      'en': 'Severe',
      'ar': '',
      'de': '',
      'es': '',
    },
    'w4ndxg8v': {
      'en': 'First Offense',
      'ar': '',
      'de': '',
      'es': '',
    },
    'm3ctr6dc': {
      'en': '5,0000 - 100,000',
      'ar': '',
      'de': '',
      'es': '',
    },
    'k8ojccpm': {
      'en': 'Second Offense',
      'ar': '',
      'de': '',
      'es': '',
    },
    'tiokmb2a': {
      'en': '\$10,000 - \$25,000',
      'ar': '',
      'de': '',
      'es': '',
    },
    '3j2nj8lm': {
      'en': 'Trafficking Penalties',
      'ar': '',
      'de': '',
      'es': '',
    },
    'ls913zfz': {
      'en': 'Critical',
      'ar': '',
      'de': '',
      'es': '',
    },
    'nt80z06i': {
      'en': 'Distribution',
      'ar': '',
      'de': '',
      'es': '',
    },
    'k6hksnsl': {
      'en': '50,000 - 100,000',
      'ar': '',
      'de': '',
      'es': '',
    },
    'kfxfyvz0': {
      'en': 'Manufacturing',
      'ar': '',
      'de': '',
      'es': '',
    },
    'zz60tnba': {
      'en': '\$100,000+',
      'ar': '',
      'de': '',
      'es': '',
    },
    'cpes0j5c': {
      'en': 'Rehabilitation Options',
      'ar': '',
      'de': '',
      'es': '',
    },
    'tw0x7umf': {
      'en': 'Available',
      'ar': '',
      'de': '',
      'es': '',
    },
    '2dye8sm0': {
      'en': 'Treatment Program',
      'ar': '',
      'de': '',
      'es': '',
    },
    '797tfi1d': {
      'en': '6 months',
      'ar': '',
      'de': '',
      'es': '',
    },
    '8xfza13v': {
      'en': 'Counseling',
      'ar': '',
      'de': '',
      'es': '',
    },
    '6x1goecn': {
      'en': '12 months',
      'ar': '',
      'de': '',
      'es': '',
    },
    'b51vdt7g': {
      'en': 'Support Resources',
      'ar': '',
      'de': '',
      'es': '',
    },
    'psjhvsr5': {
      'en': 'Access these valuable resources for assistance and support.',
      'ar': '',
      'de': '',
      'es': '',
    },
    '5ap5230m': {
      'en': 'Legal Aid Services',
      'ar': '',
      'de': '',
      'es': '',
    },
    'bmwldgla': {
      'en':
          'Free legal consultation and representation for qualifying individuals',
      'ar': '',
      'de': '',
      'es': '',
    },
    'ok3e7hp7': {
      'en': 'Rehabilitation Centers',
      'ar': '',
      'de': '',
      'es': '',
    },
    'aqfmptd3': {
      'en': 'Professional treatment and recovery programs',
      'ar': '',
      'de': '',
      'es': '',
    },
    'g6tdcb4s': {
      'en': 'Counseling Services',
      'ar': '',
      'de': '',
      'es': '',
    },
    'yn42gaz5': {
      'en': '24/7 confidential mental health support',
      'ar': '',
      'de': '',
      'es': '',
    },
    'afbt34li': {
      'en': 'Educational Resources',
      'ar': '',
      'de': '',
      'es': '',
    },
    'cl5v2zwe': {
      'en': 'Self-help guides and learning materials',
      'ar': '',
      'de': '',
      'es': '',
    },
    'ya5v3n5i': {
      'en': 'Emergency Contacts',
      'ar': '',
      'de': '',
      'es': '',
    },
    'cnpfqu31': {
      'en': '24/7 Crisis Hotline',
      'ar': '',
      'de': '',
      'es': '',
    },
    'ln1c2fmp': {
      'en': '1-800-273-8255',
      'ar': '',
      'de': '',
      'es': '',
    },
    'edof2vh6': {
      'en': 'Emergency Medical',
      'ar': '',
      'de': '',
      'es': '',
    },
    '4preko8w': {
      'en': '911',
      'ar': '',
      'de': '',
      'es': '',
    },
    'lp9rh71d': {
      'en': 'Legal Aid Helpline',
      'ar': '',
      'de': '',
      'es': '',
    },
    'aykpwr1h': {
      'en': '1-800-662-4357',
      'ar': '',
      'de': '',
      'es': '',
    },
    'd4b072n8': {
      'en': 'Substance Abuse Support',
      'ar': '',
      'de': '',
      'es': '',
    },
    'u1m9bo3a': {
      'en': '1-800-662-4357',
      'ar': '',
      'de': '',
      'es': '',
    },
    'zem3wx4w': {
      'en': 'Get Help Now',
      'ar': '',
      'de': '',
      'es': '',
    },
    'igdd1tbx': {
      'en': 'Legal Disclaimer',
      'ar': '',
      'de': '',
      'es': '',
    },
    'ogvafqed': {
      'en':
          'The information provided on this platform is for general informational purposes only and should not be considered as legal advice. While we strive to keep the information accurate and up-to-date, we make no warranties about the completeness, reliability, or accuracy of this information.',
      'ar': '',
      'de': '',
      'es': '',
    },
    'f2jr5597': {
      'en':
          'For specific legal concerns or questions, we strongly recommend consulting with a qualified legal professional who can provide advice tailored to your particular situation and jurisdiction.',
      'ar': '',
      'de': '',
      'es': '',
    },
    'xolac8zi': {
      'en': 'Read Full Disclaimer',
      'ar': '',
      'de': '',
      'es': '',
    },
    'pfur3smn': {
      'en': 'Laws',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
  // COMMUNITY
  {
    'tkp3f304': {
      'en': 'Recent Discussions',
      'ar': '',
      'de': '',
      'es': '',
    },
    'fzp0w4k6': {
      'en': 'Sarah Johnson',
      'ar': '',
      'de': '',
      'es': '',
    },
    '7avah6ii': {
      'en': '2 hours ago',
      'ar': '',
      'de': '',
      'es': '',
    },
    'rg3sxhry': {
      'en': 'Finding strength in community support',
      'ar': '',
      'de': '',
      'es': '',
    },
    'je5mwz3g': {
      'en':
          'After 6 months of sobriety, I wanted to share how this community has helped me stay strong...',
      'ar': '',
      'de': '',
      'es': '',
    },
    'f399bw1w': {
      'en': '#Recovery',
      'ar': '',
      'de': '',
      'es': '',
    },
    'mkp3eqq8': {
      'en': '#Support',
      'ar': '',
      'de': '',
      'es': '',
    },
    '4fuemrk1': {
      'en': 'Read more',
      'ar': '',
      'de': '',
      'es': '',
    },
    'nlp6xyzp': {
      'en': 'Michael Chen',
      'ar': '',
      'de': '',
      'es': '',
    },
    '65l8c6wq': {
      'en': '5 hours ago',
      'ar': '',
      'de': '',
      'es': '',
    },
    'slk0w221': {
      'en': 'Tips for dealing with triggers',
      'ar': '',
      'de': '',
      'es': '',
    },
    'c4fwa1cl': {
      'en':
          'Here are some strategies that have helped me identify and manage triggers in daily life...',
      'ar': '',
      'de': '',
      'es': '',
    },
    'h02yor1n': {
      'en': '#MentalHealth',
      'ar': '',
      'de': '',
      'es': '',
    },
    '4y53hqrx': {
      'en': '#Triggers',
      'ar': '',
      'de': '',
      'es': '',
    },
    'cztlv2v5': {
      'en': 'Read more',
      'ar': '',
      'de': '',
      'es': '',
    },
    'vjbwzuvh': {
      'en': 'Michael Chen',
      'ar': '',
      'de': '',
      'es': '',
    },
    '1bi62rc6': {
      'en': '5 hours ago',
      'ar': '',
      'de': '',
      'es': '',
    },
    'su3l74xq': {
      'en': 'Tips for dealing with triggers',
      'ar': '',
      'de': '',
      'es': '',
    },
    '1wigjuao': {
      'en':
          'Here are some strategies that have helped me identify and manage triggers in daily life...',
      'ar': '',
      'de': '',
      'es': '',
    },
    '8cahjixx': {
      'en': '#MentalHealth',
      'ar': '',
      'de': '',
      'es': '',
    },
    'ox4kx9ru': {
      'en': '#Triggers',
      'ar': '',
      'de': '',
      'es': '',
    },
    'uuas43lb': {
      'en': 'Read more',
      'ar': '',
      'de': '',
      'es': '',
    },
    'f6a5n2hp': {
      'en': 'Community Forum',
      'ar': '',
      'de': '',
      'es': '',
    },
    '6zt8bxkn': {
      'en': 'Forums',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
  // SUPPORT
  {
    'ljoju3zq': {
      'en': 'Support Resources',
      'ar': '',
      'de': '',
      'es': '',
    },
    'mpc6pa8i': {
      'en': 'Find help near you',
      'ar': '',
      'de': '',
      'es': '',
    },
    'xwjlmyhk': {
      'en': '   Search for support services...',
      'ar': '',
      'de': '',
      'es': '',
    },
    'jg72i9k9': {
      'en': 'All',
      'ar': '',
      'de': '',
      'es': '',
    },
    'vthbmtw5': {
      'en': 'Support Groups',
      'ar': '',
      'de': '',
      'es': '',
    },
    '4yjjbihp': {
      'en': 'Rehabilitation',
      'ar': '',
      'de': '',
      'es': '',
    },
    '34kmyzem': {
      'en': 'Counseling',
      'ar': '',
      'de': '',
      'es': '',
    },
    '91oj4p7k': {
      'en': 'Emergency',
      'ar': '',
      'de': '',
      'es': '',
    },
    'r1e892xu': {
      'en': 'Message Counselor',
      'ar': '',
      'de': '',
      'es': '',
    },
    'x1qn0c0y': {
      'en': '24/7 Hotlines',
      'ar': '',
      'de': '',
      'es': '',
    },
    'hr9t0w88': {
      'en': 'Crisis Helpline',
      'ar': '',
      'de': '',
      'es': '',
    },
    'nvjewcz9': {
      'en': '24/7 Emergency Support',
      'ar': '',
      'de': '',
      'es': '',
    },
    '1acfjlu5': {
      'en': 'Call Now',
      'ar': '',
      'de': '',
      'es': '',
    },
    'bmkly05u': {
      'en': 'Suicide Prevention',
      'ar': '',
      'de': '',
      'es': '',
    },
    'zrv1lh3s': {
      'en': 'Immediate Crisis Support',
      'ar': '',
      'de': '',
      'es': '',
    },
    'yzviv08y': {
      'en': 'Call Now',
      'ar': '',
      'de': '',
      'es': '',
    },
    'co26s0gj': {
      'en': 'Nearby Centers',
      'ar': '',
      'de': '',
      'es': '',
    },
    '2o2ilbf3': {
      'en': 'View Map',
      'ar': '',
      'de': '',
      'es': '',
    },
    'kq9g4y5o': {
      'en': 'Hope Recovery Center',
      'ar': '',
      'de': '',
      'es': '',
    },
    'vcrkdo6p': {
      'en': '123 Healing Street, City',
      'ar': '',
      'de': '',
      'es': '',
    },
    'db3wspw7': {
      'en': '0.8 miles away',
      'ar': '',
      'de': '',
      'es': '',
    },
    'wushmpu0': {
      'en': 'Directions',
      'ar': '',
      'de': '',
      'es': '',
    },
    '0i3vt5uh': {
      'en': 'Serenity Support Group',
      'ar': '',
      'de': '',
      'es': '',
    },
    'wvrb19dr': {
      'en': '456 Peace Avenue, City',
      'ar': '',
      'de': '',
      'es': '',
    },
    '4ennncdw': {
      'en': '1.2 miles away',
      'ar': '',
      'de': '',
      'es': '',
    },
    'z5vvy09q': {
      'en': 'Directions',
      'ar': '',
      'de': '',
      'es': '',
    },
    's55zg3ij': {
      'en': 'Wellness Rehabilitation',
      'ar': '',
      'de': '',
      'es': '',
    },
    'qr09okbt': {
      'en': '789 Recovery Road, City',
      'ar': '',
      'de': '',
      'es': '',
    },
    'aiihg36m': {
      'en': '1.5 miles away',
      'ar': '',
      'de': '',
      'es': '',
    },
    '8opk18ju': {
      'en': 'Directions',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
  // EVENTS
  {
    'l5rjs55j': {
      'en': 'Current Events',
      'ar': '',
      'de': '',
      'es': '',
    },
    '8832kn65': {
      'en': 'Youth Drug Prevention Workshop',
      'ar': '',
      'de': '',
      'es': '',
    },
    '1lfs4xoe': {
      'en': 'Today, 2:00 PM - 4:00 PM',
      'ar': '',
      'de': '',
      'es': '',
    },
    '66c4azfb': {
      'en': 'Community Center, 123 Main St',
      'ar': '',
      'de': '',
      'es': '',
    },
    'gu5bfrg0': {
      'en': 'Parent Education Seminar',
      'ar': '',
      'de': '',
      'es': '',
    },
    'o4lrm071': {
      'en': 'Today, 6:00 PM - 8:00 PM',
      'ar': '',
      'de': '',
      'es': '',
    },
    'idk2j527': {
      'en': 'Public Library Auditorium',
      'ar': '',
      'de': '',
      'es': '',
    },
    '0dez3og7': {
      'en': 'Upcoming Events',
      'ar': '',
      'de': '',
      'es': '',
    },
    'poflikaf': {
      'en': 'Recovery Success Stories',
      'ar': '',
      'de': '',
      'es': '',
    },
    'tmkis92g': {
      'en': 'June 15, 5:00 PM - 7:00 PM',
      'ar': '',
      'de': '',
      'es': '',
    },
    '63pgpkak': {
      'en': 'City Hall Conference Room',
      'ar': '',
      'de': '',
      'es': '',
    },
    '7djbilwj': {
      'en': 'Drug Awareness Walk',
      'ar': '',
      'de': '',
      'es': '',
    },
    '386cwzc0': {
      'en': 'June 20, 9:00 AM - 11:00 AM',
      'ar': '',
      'de': '',
      'es': '',
    },
    'ik875is0': {
      'en': 'Central Park',
      'ar': '',
      'de': '',
      'es': '',
    },
    '0hp65vvz': {
      'en': 'Past Events',
      'ar': '',
      'de': '',
      'es': '',
    },
    '9ehb9ovd': {
      'en': 'School Prevention Program',
      'ar': '',
      'de': '',
      'es': '',
    },
    'w8xk3z5y': {
      'en': 'May 30, 10:00 AM - 12:00 PM',
      'ar': '',
      'de': '',
      'es': '',
    },
    'jdn0vl2y': {
      'en': 'Lincoln High School',
      'ar': '',
      'de': '',
      'es': '',
    },
    '1rls7any': {
      'en': 'Community Support Group',
      'ar': '',
      'de': '',
      'es': '',
    },
    'ppduah0e': {
      'en': 'May 25, 3:00 PM - 5:00 PM',
      'ar': '',
      'de': '',
      'es': '',
    },
    'xgspuskc': {
      'en': 'Health Center Meeting Room',
      'ar': '',
      'de': '',
      'es': '',
    },
    'l3qttg9b': {
      'en': 'Events',
      'ar': '',
      'de': '',
      'es': '',
    },
    'di3jae6v': {
      'en': 'Events',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
  // FAMILY_SUPPORT
  {
    'htc00kim': {
      'en': 'Family Support',
      'ar': '',
      'de': '',
      'es': '',
    },
    'dllauz2c': {
      'en': 'Resources & Services',
      'ar': '',
      'de': '',
      'es': '',
    },
    'by3n2e5l': {
      'en': 'Support Programs',
      'ar': '',
      'de': '',
      'es': '',
    },
    'jq9jxap9': {
      'en': 'Family Strengthening Program',
      'ar': '',
      'de': '',
      'es': '',
    },
    'yy5ctgv1': {
      'en':
          'Weekly sessions focusing on building stronger family bonds and communication skills.',
      'ar': '',
      'de': '',
      'es': '',
    },
    '3nutn5jf': {
      'en': '(555) 123-4567',
      'ar': '',
      'de': '',
      'es': '',
    },
    'tfzhu0ot': {
      'en': 'Learn More',
      'ar': '',
      'de': '',
      'es': '',
    },
    'djlpwgh2': {
      'en': 'Parent Support Group',
      'ar': '',
      'de': '',
      'es': '',
    },
    '7li3bl83': {
      'en':
          'Monthly meetings for parents to share experiences and get support.',
      'ar': '',
      'de': '',
      'es': '',
    },
    '1tczrznp': {
      'en': '(555) 234-5678',
      'ar': '',
      'de': '',
      'es': '',
    },
    'qcsk8k4o': {
      'en': 'Join Group',
      'ar': '',
      'de': '',
      'es': '',
    },
    'd7wbg80d': {
      'en': 'Counseling Services',
      'ar': '',
      'de': '',
      'es': '',
    },
    'zljhjwqc': {
      'en': 'Family Therapy',
      'ar': '',
      'de': '',
      'es': '',
    },
    '7vepx7xc': {
      'en':
          'Professional counseling services for families dealing with various challenges.',
      'ar': '',
      'de': '',
      'es': '',
    },
    'c63zocal': {
      'en': 'Available Mon-Fri',
      'ar': '',
      'de': '',
      'es': '',
    },
    'xu08phim': {
      'en': 'Schedule Session',
      'ar': '',
      'de': '',
      'es': '',
    },
    'mhgw4am0': {
      'en': 'Crisis Support',
      'ar': '',
      'de': '',
      'es': '',
    },
    'gf4ciwg6': {
      'en': '24/7 emergency support for families in crisis situations.',
      'ar': '',
      'de': '',
      'es': '',
    },
    'mquspj16': {
      'en': 'Emergency: (555) 911-0000',
      'ar': '',
      'de': '',
      'es': '',
    },
    '4cjxd8be': {
      'en': 'Get Help Now',
      'ar': '',
      'de': '',
      'es': '',
    },
    'bas643zn': {
      'en': 'Upcoming Events',
      'ar': '',
      'de': '',
      'es': '',
    },
    'o7xkqeml': {
      'en': 'Positive Parenting Workshop',
      'ar': '',
      'de': '',
      'es': '',
    },
    '220tk6ul': {
      'en': 'June 15, 2024 • 2:00 PM',
      'ar': '',
      'de': '',
      'es': '',
    },
    'gq17ls50': {
      'en': 'Community Center',
      'ar': '',
      'de': '',
      'es': '',
    },
    '9h4puq75': {
      'en': 'Register',
      'ar': '',
      'de': '',
      'es': '',
    },
    '931z3zz2': {
      'en': 'Family Wellness Seminar',
      'ar': '',
      'de': '',
      'es': '',
    },
    '74065i1i': {
      'en': 'June 22, 2024 • 10:00 AM',
      'ar': '',
      'de': '',
      'es': '',
    },
    'nganbdjm': {
      'en': 'Family Center',
      'ar': '',
      'de': '',
      'es': '',
    },
    'e0f9uoor': {
      'en': 'Register',
      'ar': '',
      'de': '',
      'es': '',
    },
    'gdgtlsa1': {
      'en': 'Success Stories',
      'ar': '',
      'de': '',
      'es': '',
    },
    'the8x2ov': {
      'en':
          '\"The family support program helped us rebuild our relationships and create a stronger bond. We\'re grateful for the guidance we received.\"',
      'ar': '',
      'de': '',
      'es': '',
    },
    '80z7bemz': {
      'en': 'SJ',
      'ar': '',
      'de': '',
      'es': '',
    },
    'umcumcia': {
      'en': 'Sarah Johnson',
      'ar': '',
      'de': '',
      'es': '',
    },
    'l8pg95am': {
      'en':
          '\"The counseling services provided us with the tools we needed to overcome our challenges. Our family is stronger than ever.\"',
      'ar': '',
      'de': '',
      'es': '',
    },
    '95k801ga': {
      'en': 'MD',
      'ar': '',
      'de': '',
      'es': '',
    },
    'jzejk860': {
      'en': 'Michael Davis',
      'ar': '',
      'de': '',
      'es': '',
    },
    '9h8noei9': {
      'en': 'Family Support',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
  // Posts
  {
    '69d1k4lo': {
      'en': 'Page Title',
      'ar': '',
      'de': '',
      'es': '',
    },
    've9f0px3': {
      'en': 'Home',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
  // feed
  {
    '05wlh2ij': {
      'en': 'Page Title',
      'ar': '',
      'de': '',
      'es': '',
    },
    '7cuzomdk': {
      'en': 'Home',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
  // REPORTSUBMITPAGECopy
  {
    'teshhz8q': {
      'en': 'Booking Confirmed',
      'ar': 'نقل كامل',
      'de': 'Übertragung vollständig',
      'es': 'transferencia completa',
    },
    'hpr5clsd': {
      'en': 'We have successfully submitted your request',
      'ar':
          'عمل رائع ، لقد قمت بتحويل الأموال بنجاح. قد يستغرق خروج الأموال من حسابك بضعة أيام.',
      'de':
          'Großartige Arbeit, Sie haben erfolgreich Geld überwiesen. Es kann einige Tage dauern, bis das Geld von Ihrem Konto abgebucht wird.',
      'es':
          'Buen trabajo, transfirió fondos con éxito. Los fondos pueden tardar unos días en salir de su cuenta.',
    },
    'e0idg0a6': {
      'en': 'Okay',
      'ar': 'تمام',
      'de': 'Okay',
      'es': 'Okey',
    },
    'u36yyruo': {
      'en': 'Home',
      'ar': 'مسكن',
      'de': 'Heim',
      'es': 'Casa',
    },
  },
  // EMERGENCY
  {
    'gxcwqycy': {
      'en': 'Emergency Assistance Required',
      'ar': '',
      'de': '',
      'es': '',
    },
    '9exu271p': {
      'en': 'Please provide your location and details below',
      'ar': '',
      'de': '',
      'es': '',
    },
    'r9v4r9kx': {
      'en': 'Your Location',
      'ar': '',
      'de': '',
      'es': '',
    },
    'n2f4ae62': {
      'en': 'Select Current Location',
      'ar': '',
      'de': '',
      'es': '',
    },
    '5xolff54': {
      'en': 'Additional Location Details (Optional)',
      'ar': '',
      'de': '',
      'es': '',
    },
    'dzhck1wv': {
      'en': 'Emergency Details',
      'ar': '',
      'de': '',
      'es': '',
    },
    'ceil99ka': {
      'en': 'Medical',
      'ar': '',
      'de': '',
      'es': '',
    },
    'kjfn7jrk': {
      'en': 'Fire',
      'ar': '',
      'de': '',
      'es': '',
    },
    'me895psz': {
      'en': 'Police',
      'ar': '',
      'de': '',
      'es': '',
    },
    '1u561pd3': {
      'en': 'Other',
      'ar': '',
      'de': '',
      'es': '',
    },
    'ocm9efge': {
      'en': 'Describe the emergency situation',
      'ar': '',
      'de': '',
      'es': '',
    },
    '1qf620w6': {
      'en': 'Request Emergency Assistance',
      'ar': '',
      'de': '',
      'es': '',
    },
    'ehn8b59n': {
      'en': 'EMERGENCY',
      'ar': '',
      'de': '',
      'es': '',
    },
    'qppf1dsa': {
      'en': 'Home',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
  // REPORTSUBMITPAGECopyCopy
  {
    '9o747j7a': {
      'en': 'Submitted',
      'ar': 'نقل كامل',
      'de': 'Übertragung vollständig',
      'es': 'transferencia completa',
    },
    'mcl0d750': {
      'en': 'We have successfully submitted your request',
      'ar':
          'عمل رائع ، لقد قمت بتحويل الأموال بنجاح. قد يستغرق خروج الأموال من حسابك بضعة أيام.',
      'de':
          'Großartige Arbeit, Sie haben erfolgreich Geld überwiesen. Es kann einige Tage dauern, bis das Geld von Ihrem Konto abgebucht wird.',
      'es':
          'Buen trabajo, transfirió fondos con éxito. Los fondos pueden tardar unos días en salir de su cuenta.',
    },
    's4hlg3nt': {
      'en': 'Okay',
      'ar': 'تمام',
      'de': 'Okay',
      'es': 'Okey',
    },
    'wxeyyq4m': {
      'en': 'Home',
      'ar': 'مسكن',
      'de': 'Heim',
      'es': 'Casa',
    },
  },
  // CONSELLORMEsg
  {
    '1reei2o8': {
      'en': 'Message to Counselor',
      'ar': '',
      'de': '',
      'es': '',
    },
    'u21lvu71': {
      'en':
          'Please provide details about your situation so we can connect you with the right support.',
      'ar': '',
      'de': '',
      'es': '',
    },
    'k91kz2nv': {
      'en': 'Your name',
      'ar': '',
      'de': '',
      'es': '',
    },
    'zm62untv': {
      'en': 'Your email',
      'ar': '',
      'de': '',
      'es': '',
    },
    'pxektvpo': {
      'en': 'Describe your situation...',
      'ar': '',
      'de': '',
      'es': '',
    },
    'habsntxh': {
      'en': 'Alcohol',
      'ar': '',
      'de': '',
      'es': '',
    },
    'ow3bt76c': {
      'en': 'Opioids',
      'ar': '',
      'de': '',
      'es': '',
    },
    'c461sw6j': {
      'en': 'Other Substances',
      'ar': '',
      'de': '',
      'es': '',
    },
    '0svs155e': {
      'en': 'Preferred Contact Method',
      'ar': '',
      'de': '',
      'es': '',
    },
    '9vk8d3b2': {
      'en': 'Email',
      'ar': '',
      'de': '',
      'es': '',
    },
    'kvn30318': {
      'en': 'Phone',
      'ar': '',
      'de': '',
      'es': '',
    },
    'xhiwcdkr': {
      'en': 'Text',
      'ar': '',
      'de': '',
      'es': '',
    },
    'y7pqueeo': {
      'en': 'All information shared will be kept strictly confidential',
      'ar': '',
      'de': '',
      'es': '',
    },
    'brlmaaky': {
      'en': 'Send Message',
      'ar': '',
      'de': '',
      'es': '',
    },
    'thhgrvb9': {
      'en': 'Message',
      'ar': '',
      'de': '',
      'es': '',
    },
    'vdrcx2r9': {
      'en': 'Home',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
  // GAMEmakenowCopy
  {
    'dazpmck6': {
      'en': '   SELECT ANY ONE',
      'ar': '23000 دولار',
      'de': '23.000 \$',
      'es': '\$23,000',
    },
    'aauskm2l': {
      'en': '        The Dragon 🐉',
      'ar': 'بيتكوين',
      'de': 'Bitcoin',
      'es': 'Bitcoin',
    },
    '7ctil1eq': {
      'en': '        The Unicorn 🦄',
      'ar': 'سولونا',
      'de': 'Solona',
      'es': 'Soloña',
    },
    '9gxbimr8': {
      'en': '       The Phoenix 🔥',
      'ar': 'دوجكوين',
      'de': 'Dogecoins',
      'es': 'dogecoin',
    },
    'esdlw5gq': {
      'en': '       The Griffin 🦅🦁',
      'ar': 'دوجكوين',
      'de': 'Dogecoins',
      'es': 'dogecoin',
    },
    'mjgrp6zt': {
      'en': 'Mental Games',
      'ar': '',
      'de': '',
      'es': '',
    },
    'tumdxufj': {
      'en': 'Home',
      'ar': 'مسكن',
      'de': 'Heim',
      'es': 'Casa',
    },
  },
  // Detailsgame
  {
    '32yx0esz': {
      'en': 'Details',
      'ar': '',
      'de': '',
      'es': '',
    },
    'vs97x40k': {
      'en': 'Home',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
  // ChooseWhy
  {
    '25pm1feo': {
      'en': 'NICE!',
      'ar': '23000 دولار',
      'de': '23.000 \$',
      'es': '\$23,000',
    },
    'v16h7bjb': {
      'en':
          '     \n\n  What it Represents: Wisdom, \n   calmness, and introspection.\n\n\n\n\"You are like the Owl—wise, observant, and introspective. You seek clarity and prefer to think before acting. Trust your inner wisdom to guide you through tough times.\"',
      'ar': 'بيتكوين',
      'de': 'Bitcoin',
      'es': 'Bitcoin',
    },
    's0czaohj': {
      'en': 'Reason',
      'ar': '',
      'de': '',
      'es': '',
    },
    '4bh0irk1': {
      'en': 'Home',
      'ar': 'مسكن',
      'de': 'Heim',
      'es': 'Casa',
    },
  },
  // ChooseWhyCopy
  {
    'h82vt0hn': {
      'en': 'GOOD!',
      'ar': '23000 دولار',
      'de': '23.000 \$',
      'es': '\$23,000',
    },
    '6ory726o': {
      'en':
          '     \n\nWhat it Represents: Power, ambition, and intensity.\n\n\n\n\n\"Your drive inspires others, but remember to channel your fire with care to avoid burning out\"',
      'ar': 'بيتكوين',
      'de': 'Bitcoin',
      'es': 'Bitcoin',
    },
    '5wmqi7rw': {
      'en': 'Reason',
      'ar': '',
      'de': '',
      'es': '',
    },
    'sr18l5hp': {
      'en': 'Home',
      'ar': 'مسكن',
      'de': 'Heim',
      'es': 'Casa',
    },
  },
  // AIBOT
  {
    'lt7p6nt7': {
      'en': 'AI ChatBot',
      'ar': '',
      'de': '',
      'es': '',
    },
    'vsghn6rv': {
      'en': 'Enter prompt here',
      'ar': '',
      'de': '',
      'es': '',
    },
    'rs9td0lf': {
      'en': 'Enter your promt here',
      'ar': '',
      'de': '',
      'es': '',
    },
    'n7o1qzk1': {
      'en': 'Submit',
      'ar': '',
      'de': '',
      'es': '',
    },
    'q3mar33z': {
      'en': 'Clear',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
  // Booking
  {
    'puhm30k9': {
      'en': 'Dr. Sarah Wilson',
      'ar': '',
      'de': '',
      'es': '',
    },
    '1zl27hvd': {
      'en': 'Clinical Psychologist',
      'ar': '',
      'de': '',
      'es': '',
    },
    'xjep4guz': {
      'en': '4.9 (120+ reviews)',
      'ar': '',
      'de': '',
      'es': '',
    },
    'yjk1jyv9': {
      'en':
          '15+ years experience in anxiety, depression, and relationship counseling',
      'ar': '',
      'de': '',
      'es': '',
    },
    'pwagglaw': {
      'en': 'Available Slots',
      'ar': '',
      'de': '',
      'es': '',
    },
    'lwkb3kv6': {
      'en': 'Today',
      'ar': '',
      'de': '',
      'es': '',
    },
    'iffeu6hc': {
      'en': '10:00 AM',
      'ar': '',
      'de': '',
      'es': '',
    },
    'wsc7porq': {
      'en': 'Tomorrow',
      'ar': '',
      'de': '',
      'es': '',
    },
    'zeyoanac': {
      'en': '2:30 PM',
      'ar': '',
      'de': '',
      'es': '',
    },
    'onor83a0': {
      'en': 'Wed',
      'ar': '',
      'de': '',
      'es': '',
    },
    'omuhwe3t': {
      'en': '1:15 PM',
      'ar': '',
      'de': '',
      'es': '',
    },
    'atfb72lj': {
      'en': 'Consultation Details',
      'ar': '',
      'de': '',
      'es': '',
    },
    'js2anaec': {
      'en': 'Describe your concerns',
      'ar': '',
      'de': '',
      'es': '',
    },
    'gx7elg4h': {
      'en': 'First Visit',
      'ar': '',
      'de': '',
      'es': '',
    },
    '3s6h31uj': {
      'en': 'Follow-up',
      'ar': '',
      'de': '',
      'es': '',
    },
    'b76u4o9v': {
      'en': 'Emergency',
      'ar': '',
      'de': '',
      'es': '',
    },
    'w0rtgw0x': {
      'en': 'Book Appointment ',
      'ar': '',
      'de': '',
      'es': '',
    },
    'k781urjw': {
      'en': 'Booking',
      'ar': '',
      'de': '',
      'es': '',
    },
    'p3wyc29v': {
      'en': 'Home',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
  // AnalyTICS
  {
    't7jgc6y2': {
      'en': 'Neural\nNetwork',
      'ar': '',
      'de': '',
      'es': '',
    },
    'jbgjozco': {
      'en': 'AI/ML Analytics Platform',
      'ar': '',
      'de': '',
      'es': '',
    },
    'zewa25ku': {
      'en':
          'This neural network predicts whether an individual is prone to drug use based on their profile and conditions. By analyzing key factors, it identifies at-risk individuals, enabling timely interventions.',
      'ar': '',
      'de': '',
      'es': '',
    },
    '0jbslshf': {
      'en': 'Key Features:',
      'ar': '',
      'de': '',
      'es': '',
    },
    's6p0q0nc': {
      'en': 'Real-time data processing',
      'ar': '',
      'de': '',
      'es': '',
    },
    'd18nv3qx': {
      'en': 'Predictive analytics',
      'ar': '',
      'de': '',
      'es': '',
    },
    'wb49h7nl': {
      'en': 'Custom reporting',
      'ar': '',
      'de': '',
      'es': '',
    },
    'nylo4cte': {
      'en': 'Analytics',
      'ar': '',
      'de': '',
      'es': '',
    },
    '14au80vf': {
      'en': 'Home',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
  // readmore
  {
    'p1lqm1ps': {
      'en': ' ',
      'ar': 'بيتكوين',
      'de': 'Bitcoin',
      'es': 'Bitcoin',
    },
    '7mk01j80': {
      'en': '               Posted by Sarah Chen • 2 days ago',
      'ar': '',
      'de': '',
      'es': '',
    },
    'ydz4928n': {
      'en':
          'I\'ve been working on improving the tutorial section of my mobile game and wanted to share some key insights I\'ve learned about creating an effective onboarding experience:',
      'ar': '',
      'de': '',
      'es': '',
    },
    'jtvedf31': {
      'en': '1. Keep it Interactive',
      'ar': '',
      'de': '',
      'es': '',
    },
    'r9tokpb8': {
      'en':
          'Instead of long text explanations, guide players through actual gameplay mechanics. Let them learn by doing.',
      'ar': '',
      'de': '',
      'es': '',
    },
    '9umxvovy': {
      'en': '2. Progressive Complexity',
      'ar': '',
      'de': '',
      'es': '',
    },
    'tr2si9us': {
      'en':
          'Introduce mechanics one at a time. Start with basic controls before moving to more advanced features.',
      'ar': '',
      'de': '',
      'es': '',
    },
    '6nc0h334': {
      'en': '3. Clear Visual Cues',
      'ar': '',
      'de': '',
      'es': '',
    },
    '4k2pkj4x': {
      'en':
          'Use highlights, arrows, or animations to draw attention to important UI elements or actions.',
      'ar': '',
      'de': '',
      'es': '',
    },
    '76ygysgd': {
      'en': 'More',
      'ar': '',
      'de': '',
      'es': '',
    },
    '7ioefbd7': {
      'en': 'Home',
      'ar': 'مسكن',
      'de': 'Heim',
      'es': 'Casa',
    },
  },
  // Taskprogress
  {
    'voar2c8w': {
      'en': 'Task Progress',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
  // emptyList
  {
    'rio6de86': {
      'en': 'Ai Chat Active!',
      'ar': '',
      'de': '',
      'es': '',
    },
    '26uwcia3': {
      'en':
          'IMPORTANT!!! Need to do:\nGo to the action below and update your API Key in order for this chat to function.\n\nYou can get an API key at:',
      'ar': '',
      'de': '',
      'es': '',
    },
    'x6turho8': {
      'en': 'https://platform.openai.com',
      'ar': '',
      'de': '',
      'es': '',
    },
    'qfqt4dgp': {
      'en': 'Watch Tutorial',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
  // aiChat_Component
  {
    'feaojlef': {
      'en': 'Type something...',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
  // Miscellaneous
  {
    'lzyb73wy': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'kx9cdks4': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'efvtwj7k': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'ec5hfa1e': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'q5ljwvfo': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'j4rmwb3h': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    '6ah1b18f': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    '2kos1hen': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    '6maetrl6': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    '6s2c0amz': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'xauadzi0': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'epx0o0eq': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    '978f181u': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'aox3s4fb': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'l8hv5a7z': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    '4pjwb70a': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    '0xlokf4y': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    '8twlwiwt': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'emzj4oyf': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'bjav5avi': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'mdxbek52': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'pda2alco': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    '0n3q25wu': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'b9azexm0': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    't4xzlq9q': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    '513nj4m0': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'a1jxfgju': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
].reduce((a, b) => a..addAll(b));
