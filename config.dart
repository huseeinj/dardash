class AppConfig {
  static const String appName = 'الدردشة العربية';

  // ضع بيانات مشروع Supabase هنا.
  static const String supabaseUrl = 'YOUR_SUPABASE_URL';
  static const String supabaseAnonKey = 'YOUR_SUPABASE_ANON_KEY';

  // رقم استقبال Zain Cash الذي حدده مالك التطبيق.
  // يفضل نقل هذه القيمة إلى إعدادات السيرفر قبل النشر العام.
  static const String zainCashReceiver = '07818929099';

  static const int imageCoins = 50;
  static const int videoCoins = 100;
  static const int plusCoins = 2000;

  static const double coins50Usd = 1.0;
  static const double coins100Usd = 2.0;
  static const double plusUsd = 10.0;
}
