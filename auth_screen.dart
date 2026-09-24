
import 'package:flutter/material.dart';
import '../widgets/dardash_logo.dart';
import 'home_screen.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});
  @override State<AuthScreen> createState() => _AuthScreenState();
}
class _AuthScreenState extends State<AuthScreen> {
  bool login = true;
  bool obscure = true;
  final email = TextEditingController();
  final password = TextEditingController();
  final username = TextEditingController();

  void enter() {
    if (!login && username.text.trim().length > 4) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('اسم المستخدم لا يتجاوز 4 أحرف.')),
      );
      return;
    }
    Navigator.pushReplacement(context,
      MaterialPageRoute(builder: (_) => const HomeScreen()));
  }

  @override
  Widget build(BuildContext context) => Directionality(
    textDirection: TextDirection.rtl,
    child: Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(24, 48, 24, 24),
          child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            const Center(child: DardashLogo(size: 94)),
            const SizedBox(height: 18),
            const Center(child: Text('دردش', style: TextStyle(fontSize: 34, fontWeight: FontWeight.w900))),
            const SizedBox(height: 6),
            const Center(child: Text('أكثر من مجرد دردشة', style: TextStyle(color: Colors.white60))),
            const SizedBox(height: 42),
            Text(login ? 'مرحباً بعودتك 👋' : 'أنشئ حسابك الآن',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 18),
            if (!login) ...[
              TextField(controller: username, maxLength: 4,
                decoration: const InputDecoration(labelText: 'اسم المستخدم', prefixIcon: Icon(Icons.alternate_email))),
              const SizedBox(height: 10),
            ],
            TextField(controller: email, keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(labelText: 'البريد الإلكتروني', prefixIcon: Icon(Icons.mail_outline))),
            const SizedBox(height: 12),
            TextField(controller: password, obscureText: obscure,
              decoration: InputDecoration(labelText: 'كلمة المرور', prefixIcon: const Icon(Icons.lock_outline),
                suffixIcon: IconButton(onPressed: ()=>setState(()=>obscure=!obscure),
                  icon: Icon(obscure ? Icons.visibility_outlined : Icons.visibility_off_outlined)))),
            const SizedBox(height: 20),
            FilledButton(
              onPressed: enter,
              style: FilledButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 16)),
              child: Text(login ? 'تسجيل الدخول' : 'إنشاء حساب', style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 10),
            OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.email_outlined),
              label: const Text('المتابعة عبر البريد الإلكتروني'),
            ),
            const SizedBox(height: 16),
            TextButton(onPressed: ()=>setState(()=>login=!login),
              child: Text(login ? 'ليس لديك حساب؟ إنشاء حساب' : 'لديك حساب؟ تسجيل الدخول')),
            const SizedBox(height: 20),
            const Text('بالمتابعة أنت توافق على شروط الاستخدام وسياسة الخصوصية.',
              textAlign: TextAlign.center, style: TextStyle(fontSize: 12, color: Colors.white38)),
          ]),
        ),
      ),
    ),
  );
}
