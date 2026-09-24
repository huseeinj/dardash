
import 'package:flutter/material.dart';
class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});
  final packs = const [
    ['50 Coins','\$1','الأكثر طلباً'],
    ['100 Coins','\$2',''],
    ['250 Coins','\$4','عرض'],
    ['500 Coins','\$7',''],
    ['1,000 Coins','\$12','عرض خاص'],
    ['2,000 Coins + Plus','\$10','باقة Plus'],
  ];
  @override Widget build(BuildContext context)=>Directionality(textDirection:TextDirection.rtl,child:Scaffold(
    appBar:AppBar(title:const Text('متجر دردش')),
    body:ListView(padding:const EdgeInsets.all(16),children:[
      Container(padding:const EdgeInsets.all(18),decoration:BoxDecoration(borderRadius:BorderRadius.circular(24),gradient:const LinearGradient(colors:[Color(0xFF6B4CE6),Color(0xFF3B237D)])),child:const Column(crossAxisAlignment:CrossAxisAlignment.start,children:[
        Text('اشحن Coins واستمتع بالمميزات',style:TextStyle(fontSize:20,fontWeight:FontWeight.bold)),
        SizedBox(height:6),Text('الهدايا • الصور • الفيديو • Plus',style:TextStyle(color:Colors.white70))
      ])),
      const SizedBox(height:16),
      ...packs.map((p)=>Card(child:ListTile(
        leading:Container(width:48,height:48,decoration:BoxDecoration(color:Colors.amber.withOpacity(.12),shape:BoxShape.circle),child:const Icon(Icons.monetization_on,color:Colors.amber)),
        title:Text(p[0],style:const TextStyle(fontWeight:FontWeight.bold)),
        subtitle:Text(p[2].isEmpty?'شراء عبر Zain Cash':p[2]),
        trailing:FilledButton(onPressed:()=>_buy(context,p[0],p[1]),child:Text(p[1])),
      ))),
      const SizedBox(height:10),
      Card(child:ListTile(leading:const Icon(Icons.account_balance_wallet,color:Colors.green),title:const Text('الدفع عبر Zain Cash'),subtitle:const Text('رقم الاستقبال: 07818929099'))),
      const SizedBox(height:8),
      const Text('بعد التحويل أرسل رقم العملية من صفحة الدعم ليتم التحقق وإضافة الرصيد.',style:TextStyle(color:Colors.white54)),
    ]),
  ));
  void _buy(BuildContext c,String title,String price)=>showDialog(context:c,builder:(_)=>AlertDialog(
    title:Text('شراء $title'),content:Text('المبلغ: $price\\n\\nحوّل المبلغ عبر Zain Cash إلى 07818929099 ثم أرسل رقم العملية للمراجعة.'),
    actions:[TextButton(onPressed:()=>Navigator.pop(c),child:const Text('إغلاق')),FilledButton(onPressed:()=>Navigator.pop(c),child:const Text('أرسلت التحويل'))],
  ));
}
