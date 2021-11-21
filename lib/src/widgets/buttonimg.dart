


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
                    initialChildSize: 0.4,
                    minChildSize: 0.2,
                   expand: false,

                    builder: (BuildContext context, ScrollController scrollController) {
                      return Container(
                        color: Colors.black,
                        child: ListView.builder(
                          controller: scrollController,
                          itemCount: 10,
                          itemBuilder: (BuildContext context, int index) {
                            return ListTile(title: Text(descripcion,style: TextStyle(color:Colors.white)));
                          },
                        ),
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
