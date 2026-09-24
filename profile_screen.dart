
import 'package:flutter/material.dart';
import 'plus_screen.dart';
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  @override Widget build(BuildContext context)=>Directionality(textDirection:TextDirection.rtl,child:ListView(padding:const EdgeInsets.all(16),children:[
    const SizedBox(height:12),
    const Center(child:CircleAvatar(radius:52,child:Icon(Icons.person,size:55))),
    const SizedBox(height:12),
    const Center(child:Text('أحمد',style:TextStyle(fontSize:24,fontWeight:FontWeight.bold))),
    const Center(child:Text('@ahmd',style:TextStyle(color:Colors.white54))),
    const SizedBox(height:18),
    Row(mainAxisAlignment:MainAxisAlignment.spaceEvenly,children:[
      _stat('12','مجموعات'),_stat('458','متابع'),_stat('312','متابعين'),
    ]),
    const SizedBox(height:18),
    FilledButton.icon(onPressed:()=>Navigator.push(context,MaterialPageRoute(builder:(_)=>const PlusScreen())),icon:const Icon(Icons.workspace_premium),label:const Text('مميزات Plus')),
    const SizedBox(height:10),
    const Card(child:Column(children:[
      ListTile(leading:Icon(Icons.edit_outlined),title:Text('تعديل الملف الشخصي'),trailing:Icon(Icons.chevron_left)),
      ListTile(leading:Icon(Icons.photo_outlined),title:Text('الصورة الشخصية'),subtitle:Text('يجب ألا تخالف الآداب أو القواعد'),trailing:Icon(Icons.chevron_left)),
      ListTile(leading:Icon(Icons.notifications_none),title:Text('الإشعارات'),trailing:Icon(Icons.chevron_left)),
      ListTile(leading:Icon(Icons.dark_mode_outlined),title:Text('المظهر'),subtitle:Text('الوضع الليلي')),
      ListTile(leading:Icon(Icons.shield_outlined),title:Text('الخصوصية والأمان'),trailing:Icon(Icons.chevron_left)),
      ListTile(leading:Icon(Icons.help_outline),title:Text('المساعدة والدعم'),trailing:Icon(Icons.chevron_left)),
    ])),
  ]));
  Widget _stat(String n,String l)=>Column(children:[Text(n,style:const TextStyle(fontSize:19,fontWeight:FontWeight.bold)),Text(l,style:const TextStyle(color:Colors.white54))]);
}
