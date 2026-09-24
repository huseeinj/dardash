import 'dart:async';
import 'package:flutter/material.dart';
import '../utils/media_expiry.dart';

class StoriesScreen extends StatefulWidget {
  const StoriesScreen({super.key});
  @override State<StoriesScreen> createState()=>_StoriesScreenState();
}
class _StoriesScreenState extends State<StoriesScreen>{
  int current=0;
  Timer? timer;
  final names=['سارة','علي','نور','محمود'];
  final created=DateTime.now();

  @override void initState(){
    super.initState();
    timer=Timer.periodic(const Duration(seconds:5),(_){
      if(mounted)setState(()=>current=(current+1)%names.length);
    });
  }
  @override void dispose(){timer?.cancel();super.dispose();}

  @override Widget build(BuildContext context)=>Directionality(
    textDirection:TextDirection.rtl,
    child:Scaffold(
      body:Stack(children:[
        Container(decoration:const BoxDecoration(
          gradient:LinearGradient(begin:Alignment.topCenter,end:Alignment.bottomCenter,
            colors:[Color(0xFF34215D),Color(0xFF090812)]))),
        SafeArea(child:Padding(
          padding:const EdgeInsets.all(14),
          child:Column(children:[
            Row(children:[
              IconButton(onPressed:()=>Navigator.pop(context),icon:const Icon(Icons.close)),
              Expanded(child:Text(names[current],textAlign:TextAlign.center,
                style:const TextStyle(fontSize:18,fontWeight:FontWeight.bold))),
              Text(MediaExpiry.remaining(created)),
            ]),
            const SizedBox(height:8),
            Row(children:List.generate(names.length,(i)=>Expanded(child:Container(
              height:3,margin:const EdgeInsets.symmetric(horizontal:2),
              color:i==current?Colors.white:Colors.white24)))),
            const Spacer(),
            const Icon(Icons.play_circle_outline,size:80,color:Colors.white70),
            const SizedBox(height:15),
            Text('ستوري فيديو من ${names[current]}',
              style:const TextStyle(fontSize:20,fontWeight:FontWeight.bold)),
            const SizedBox(height:8),
            const Text('الصور والفيديوهات تختفي تلقائياً بعد 24 ساعة',
              style:TextStyle(color:Colors.white60)),
            const Spacer(),
            TextField(decoration:InputDecoration(
              hintText:'أرسل رد...',
              suffixIcon:IconButton(onPressed:(){},icon:const Icon(Icons.send)),
            )),
          ]),
        )),
      ]),
    ),
  );
}
