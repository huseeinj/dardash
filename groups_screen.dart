
import 'package:flutter/material.dart';
class GroupsScreen extends StatelessWidget {
  const GroupsScreen({super.key});
  @override Widget build(BuildContext context)=>Directionality(textDirection:TextDirection.rtl,child:Scaffold(
    appBar:AppBar(title:const Text('المجموعات'),actions:[IconButton(onPressed:(){},icon:const Icon(Icons.add))]),
    body:ListView(padding:const EdgeInsets.all(16),children:[
      FilledButton.icon(onPressed:()=>_newGroup(context),icon:const Icon(Icons.group_add),label:const Text('إنشاء مجموعة خاصة')),
      const SizedBox(height:16),
      ...['الأصدقاء','عشاق التكنولوجيا','العائلة','دردشة العراق'].map((g)=>Card(child:ListTile(
        leading:const CircleAvatar(child:Icon(Icons.groups)),
        title:Text(g),subtitle:const Text('مجموعة خاصة • 24 عضو'),
        trailing:const Icon(Icons.chevron_left),
        onTap:()=>_openGroup(context,g),
      ))),
    ]),
  ));
  void _newGroup(BuildContext c)=>showDialog(context:c,builder:(_)=>AlertDialog(
    title:const Text('إنشاء مجموعة'),content:const TextField(decoration:InputDecoration(labelText:'اسم المجموعة')),
    actions:[TextButton(onPressed:()=>Navigator.pop(c),child:const Text('إلغاء')),FilledButton(onPressed:()=>Navigator.pop(c),child:const Text('إنشاء'))],
  ));
  void _openGroup(BuildContext c,String name)=>showModalBottomSheet(context:c,builder:(_)=>Padding(padding:const EdgeInsets.all(20),child:Wrap(children:[
    Text(name,style:const TextStyle(fontSize:22,fontWeight:FontWeight.bold)),
    const ListTile(leading:Icon(Icons.person_add),title:Text('إضافة أعضاء')),
    const ListTile(leading:Icon(Icons.block),title:Text('حظر/طرد عضو')),
    const ListTile(leading:Icon(Icons.admin_panel_settings),title:Text('إدارة المجموعة')),
  ])));
}
