
import 'package:flutter/material.dart';
class PlusScreen extends StatelessWidget {
  const PlusScreen({super.key});
  @override Widget build(BuildContext context)=>Directionality(textDirection:TextDirection.rtl,child:Scaffold(
    appBar:AppBar(title:const Text('دردش Plus')),
    body:ListView(padding:const EdgeInsets.all(18),children:[
      Container(padding:const EdgeInsets.all(22),decoration:BoxDecoration(borderRadius:BorderRadius.circular(28),gradient:const LinearGradient(colors:[Color(0xFF4A2AA6),Color(0xFF9B74FF)])),child:const Column(children:[
        Icon(Icons.workspace_premium,size:64,color:Colors.amber),
        SizedBox(height:8),Text('Plus',style:TextStyle(fontSize:30,fontWeight:FontWeight.w900)),
        SizedBox(height:5),Text('افتح كل المميزات بدون حدود',style:TextStyle(color:Colors.white70))
      ])),
      const SizedBox(height:18),
      ...['إرسال الصور مجاناً','إرسال الفيديو مجاناً','مميزات إضافية في المجموعات','تجربة أكثر راحة بدون قيود','أولوية في بعض المزايا'].map((x)=>const ListTile(leading:Icon(Icons.check_circle,color:Colors.green),title:Text(''))),
      Card(child:ListTile(title:const Text('فتح Plus بالـCoins'),subtitle:const Text('2,000 Coins'),trailing:FilledButton(onPressed:null,child:Text('فتح')))),
      Card(child:ListTile(title:const Text('فتح Plus مباشرة'),subtitle:const Text('10 USD'),trailing:FilledButton(onPressed:null,child:Text('شراء')))),
    ]),
  ));
}
