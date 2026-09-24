import 'package:flutter/material.dart';

class AdminScreen extends StatelessWidget {
  const AdminScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(title: const Text('لوحة تحكم المالك')),
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: const [
            Card(child: ListTile(
              leading: Icon(Icons.people_alt_outlined),
              title: Text('المستخدمون'),
              subtitle: Text('حظر، إلغاء حظر، مراجعة الحسابات'),
            )),
            Card(child: ListTile(
              leading: Icon(Icons.report_outlined),
              title: Text('البلاغات'),
              subtitle: Text('مراجعة الصور والأسماء والمحتوى المخالف'),
            )),
            Card(child: ListTile(
              leading: Icon(Icons.payments_outlined),
              title: Text('طلبات الدفع'),
              subtitle: Text('التحقق من عمليات Zain Cash وإضافة Coins أو Plus'),
            )),
            Card(child: ListTile(
              leading: Icon(Icons.card_giftcard_outlined),
              title: Text('الهدايا'),
              subtitle: Text('إدارة أسعار الهدايا وقيمة التحويل إلى Coins'),
            )),
            Card(child: ListTile(
              leading: Icon(Icons.settings_outlined),
              title: Text('إعدادات الأسعار'),
              subtitle: Text('تعديل أسعار الصور والفيديو وPlus والباقة'),
            )),
          ],
        ),
      ),
    );
  }
}
