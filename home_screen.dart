
import 'package:flutter/material.dart';
import 'chat_screen.dart';
import 'groups_screen.dart';
import 'store_screen.dart';
import 'profile_screen.dart';
import 'stories_screen.dart';
import 'plus_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override State<HomeScreen> createState()=>_HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
  int index=0;
  final pages = const [
    _HomeTab(), GroupsScreen(), StoreScreen(), ProfileScreen()
  ];

  @override
  Widget build(BuildContext context)=>Directionality(
    textDirection: TextDirection.rtl,
    child: Scaffold(
      body: pages[index],
      bottomNavigationBar: NavigationBar(
        selectedIndex:index,
        onDestinationSelected:(v)=>setState(()=>index=v),
        destinations: const [
          NavigationDestination(icon:Icon(Icons.home_outlined),selectedIcon:Icon(Icons.home),label:'الرئيسية'),
          NavigationDestination(icon:Icon(Icons.groups_outlined),selectedIcon:Icon(Icons.groups),label:'مجموعاتي'),
          NavigationDestination(icon:Icon(Icons.shopping_bag_outlined),selectedIcon:Icon(Icons.shopping_bag),label:'المتجر'),
          NavigationDestination(icon:Icon(Icons.person_outline),selectedIcon:Icon(Icons.person),label:'حسابي'),
        ],
      ),
    ),
  );
}

class _HomeTab extends StatelessWidget {
  const _HomeTab();
  @override
  Widget build(BuildContext context)=>SafeArea(
    child: ListView(padding: const EdgeInsets.all(16), children:[
      Row(children:[
        const CircleAvatar(radius:25, child:Icon(Icons.person)),
        const SizedBox(width:12),
        const Expanded(child:Column(crossAxisAlignment:CrossAxisAlignment.start,children:[
          Text('مرحباً بك 👋',style:TextStyle(color:Colors.white60)),
          Text('دردش',style:TextStyle(fontSize:24,fontWeight:FontWeight.bold))
        ])),
        IconButton(onPressed:()=>Navigator.push(context,MaterialPageRoute(builder:(_)=>const PlusScreen())),icon:const Icon(Icons.workspace_premium,color:Colors.amber)),
        const _CoinBadge(),
      ]),
      const SizedBox(height:18),
      TextField(decoration:const InputDecoration(hintText:'ابحث عن مستخدم أو مجموعة',prefixIcon:Icon(Icons.search))),
      const SizedBox(height:18),
      Row(children:[
        const Text('الستوريات',style:TextStyle(fontSize:18,fontWeight:FontWeight.bold)),
        const Spacer(),
        TextButton(onPressed:()=>Navigator.push(context,MaterialPageRoute(builder:(_)=>const StoriesScreen())),child:const Text('عرض الكل')),
      ]),
      SizedBox(height:105,child:ListView.separated(
        scrollDirection:Axis.horizontal,itemCount:6,separatorBuilder:(_,__)=>const SizedBox(width:12),
        itemBuilder:(_,i)=>GestureDetector(
          onTap:()=>Navigator.push(context,MaterialPageRoute(builder:(_)=>const StoriesScreen())),
          child:Column(children:[
            Container(width:62,height:62,padding:const EdgeInsets.all(3),decoration:BoxDecoration(shape:BoxShape.circle,border:Border.all(color:const Color(0xFF7657F0),width:2)),
              child:const CircleAvatar(child:Icon(Icons.person))),
            const SizedBox(height:5),Text(i==0?'قصتك':'مستخدم ${i+1}',style:const TextStyle(fontSize:11))
          ]))),
      ),
      const SizedBox(height:10),
      const Text('المحادثات الخاصة',style:TextStyle(fontSize:18,fontWeight:FontWeight.bold)),
      const SizedBox(height:8),
      ...List.generate(5,(i)=>Card(child:ListTile(
        leading:Stack(children:[const CircleAvatar(child:Icon(Icons.person)),Positioned(right:0,bottom:0,child:Container(width:11,height:11,decoration:BoxDecoration(color:Colors.green,border:Border.all(color:const Color(0xFF171526)),shape:BoxShape.circle)))]),
        title:Text(['سارة','علي','نور','محمود','زينب'][i]),
        subtitle:Text(['أهلاً وسهلاً','ما رأيك بالصورة؟','أرسلها بعد قليل','تمام 👍','اشتقتلك'][i]),
        trailing:const Text('14:32',style:TextStyle(color:Colors.white38)),
        onTap:()=>Navigator.push(context,MaterialPageRoute(builder:(_)=>ChatScreen(name:['سارة','علي','نور','محمود','زينب'][i]))),
      ))),
    ]),
  );
}

class _CoinBadge extends StatelessWidget {
  const _CoinBadge();
  @override Widget build(BuildContext context)=>Container(
    padding:const EdgeInsets.symmetric(horizontal:12,vertical:9),
    decoration:BoxDecoration(borderRadius:BorderRadius.circular(18),border:Border.all(color:Colors.amber.withOpacity(.4))),
    child:const Row(children:[Icon(Icons.monetization_on,color:Colors.amber,size:18),SizedBox(width:5),Text('100',style:TextStyle(fontWeight:FontWeight.bold))]),
  );
}
