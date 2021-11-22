


import 'package:flutter/cupertino.dart'
;
import 'package:flutter/material.dart';

class ButtonImg extends StatelessWidget {
  final String descripcion;
  final String img;


  const ButtonImg({Key? key,this.descripcion="",this.img=""}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
        radius: 64,
        backgroundColor: Colors.transparent,
        child: Material(
          elevation: 4.0,
          shape: CircleBorder(),
          clipBehavior: Clip.hardEdge,
          color: Colors.transparent,
          child: Ink.image(
            image: AssetImage(img),
            fit: BoxFit.cover,
            width: 120.0,
            height: 120.0,
            child: InkWell(
              onTap: () {
                showModalBottomSheet(context: context, builder:(_){

                 return DraggableScrollableSheet(
                    initialChildSize: 0.6,
                    minChildSize: 0.2,
                   expand: false,

                    builder: (BuildContext context, ScrollController scrollController) {
                      return Container(
                        color: Colors.black,

                        child: ListView(
                          controller: scrollController,
                          children: [
                            Column(
                              children: <Widget>[
                                Center(
                                  child:Container(
                                    margin: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                                    child: Text("Animal",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,color: Colors.white),),
                                  ),
                                ),
                                Center(
                                  child:Container(
                                    margin: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                                    child: Image(image: NetworkImage('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),width: 200),
                                  ),
                                ),
                                Container(
                                  child: Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. ",style: TextStyle(color:Colors.white),),
                                )
                              ],
                            )
                          ],
                        )
                      );
                    },
                  );

                }


                    ,isScrollControlled: true);


              },
            ),
          ),
        )
    );
  }
}
