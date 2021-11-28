import 'package:lobozoo/src/widgets/myarc.dart';
import 'package:flutter/material.dart';
import '../widgets/mycard.dart';


class RetoScreen extends StatelessWidget {
  const RetoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget> [
          Center(
            child: MyArc(diameter: 300,),

          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipOval(
                child: Container(
                  color: Colors.black,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    "1",
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
              Container(
                child:
                LinearProgressIndicator(
                  value: 1.0,
                  backgroundColor: Colors.grey[600],
                  minHeight: 15,
                  color: Color(0xff30CC2D),
                ),
                width: 200,



              ),
              Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
              ClipOval(
                child: Container(
                  color: Colors.black,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    "3",
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
              ),
            ],
          ),

          CustomCard(btnmessage: "Canjear premio",),
          CustomCard(empezado: false,numreto: "2",),

        ],
      ),
    );
  }
}
/*
IconButton(
icon:const ImageIcon( AssetImage("assets/leon.jpg"),size: 300,),
onPressed: (){
showModalBottomSheet<void>(
context: context,
builder:(BuildContext context){
return Container(
height: 200,
color:Colors.black,
child:Center(
child: Column(
mainAxisAlignment: MainAxisAlignment.center,
mainAxisSize: MainAxisSize.min,
children: <Widget>[
const Text("Modal BottomSheet",style: TextStyle(color: Colors.white),),
ElevatedButton(child:const Text('Close BottomSheet'),
onPressed: ()=>Navigator.pop(context),)
],
),
)
);
}
);
},
),

 */