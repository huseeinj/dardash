import 'package:flutter/material.dart';
import '../utils/media_expiry.dart';

class ChatScreen extends StatefulWidget {
  final String name;
  const ChatScreen({super.key, required this.name});
  @override State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final c = TextEditingController();
  final messages = <Map<String,dynamic>>[
    {'text':'أهلاً وسهلاً 👋','media':false,'created':null},
    {'text':'شلونك اليوم؟','media':false,'created':null},
  ];

  void sendText() {
    final text=c.text.trim();
    if(text.isEmpty)return;
    setState(()=>messages.add({'text':text,'media':false,'created':null}));
    c.clear();
  }

  void sendMedia(String type,int coins) {
    final now=DateTime.now();
    setState(()=>messages.add({
      'text':'$type • ينتهي خلال 24 ساعة',
      'media':true,
      'type':type,
      'created':now,
      'coins':coins,
    }));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content:Text('$type أضيف للمحادثة وسيُحذف تلقائياً بعد 24 ساعة.')),
    );
  }

  @override
  Widget build(BuildContext context)=>Directionality(
    textDirection:TextDirection.rtl,
    child:Scaffold(
      appBar:AppBar(
        title:Row(children:[
          const CircleAvatar(radius:19,child:Icon(Icons.person,size:20)),
          const SizedBox(width:10),
          Column(crossAxisAlignment:CrossAxisAlignment.start,children:[
            Text(widget.name),
            const Text('متصل الآن',style:TextStyle(fontSize:11,color:Colors.green))
          ])
        ]),
        actions:[
          IconButton(onPressed:(){},icon:const Icon(Icons.call_outlined)),
          IconButton(onPressed:(){},icon:const Icon(Icons.more_vert))
        ],
      ),
      body:Column(children:[
        Expanded(child:ListView.builder(
          padding:const EdgeInsets.all(14),
          itemCount:messages.length,
          itemBuilder:(_,i){
            final m=messages[i];
            final created=m['created'] as DateTime?;
            if(created!=null && MediaExpiry.isExpired(created)) return const SizedBox.shrink();
            return Align(
              alignment:i.isEven?Alignment.centerRight:Alignment.centerLeft,
              child:Container(
                margin:const EdgeInsets.symmetric(vertical:5),
                padding:const EdgeInsets.symmetric(horizontal:14,vertical:10),
                decoration:BoxDecoration(
                  color:i.isEven?const Color(0xFF7055E9):const Color(0xFF242137),
                  borderRadius:BorderRadius.circular(17),
                ),
                child:Column(crossAxisAlignment:CrossAxisAlignment.start,children:[
                  Text(m['text'] as String),
                  if(created!=null) ...[
                    const SizedBox(height:5),
                    Text('يحذف بعد ${MediaExpiry.remaining(created)}',
                      style:const TextStyle(fontSize:10,color:Colors.white60))
                  ]
                ]),
              ),
            );
          },
        )),
        SafeArea(child:Padding(
          padding:const EdgeInsets.all(10),
          child:Row(children:[
            IconButton(onPressed:()=>sendMedia('صورة',50),icon:const Icon(Icons.image_outlined)),
            IconButton(onPressed:()=>sendMedia('فيديو',100),icon:const Icon(Icons.video_library_outlined)),
            Expanded(child:TextField(controller:c,decoration:const InputDecoration(hintText:'اكتب رسالة...'))),
            const SizedBox(width:6),
            FloatingActionButton.small(onPressed:sendText,child:const Icon(Icons.send)),
          ]),
        )),
      ]),
    ),
  );
}
