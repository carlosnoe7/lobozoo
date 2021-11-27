


import 'package:flutter/cupertino.dart'
;
import 'package:flutter/material.dart';

class ButtonImg extends StatelessWidget {
  final String descripcion;
  final String img;
  final String title;

  const ButtonImg({Key? key,this.descripcion="",this.img="",this.title=""}) : super(key: key);

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
            image: NetworkImage(img),
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
                                    child: Text(title,style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,color: Colors.white),),
                                  ),
                                ),
                                Center(
                                  child:Container(
                                    margin: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                                    child: Image(image: NetworkImage(img),width: 200),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(left: 10.0, right: 10.0),
                                  child: Text(descripcion,style: TextStyle(color:Colors.white),),
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
