import 'dart:io';

import 'package:flutter/material.dart';
import 'package:panificadora_mimago/data/models/product_model.dart';

class ProductCard extends StatefulWidget {
   ProductCard({Key key}) : super(key: key);

  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {

  ProductModel product = ProductModel();
  File photo;
  int amount = 0;
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Container(
      height:295,
      width:screenSize.width - screenSize.width*0.1,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: <BoxShadow>[
        BoxShadow(color: Colors.black12,blurRadius: 4.0,offset: Offset(0,2.0),spreadRadius: 0.5)
        ]
      ),
       child: Column(
         children: [
           _showImage(),
           _name(),
           Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
           crossAxisAlignment: CrossAxisAlignment.center,
             children: [
              _pricing(),
              SizedBox(width: 10),
              _counter(),
             ],
           ),
           Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
           crossAxisAlignment: CrossAxisAlignment.center,
             children: [
              _unitPricing(),
              SizedBox(width: 10),
              _addBtn(),
             ],
           ),
         ],
       ),
    );
  }

  Widget _showImage() {
    if (product.fotoUrl != null){
      return FadeInImage(
      placeholder: AssetImage('assets/gif/jar-loading.gif'), 
      image: NetworkImage(product.fotoUrl),
      height: 140.0,
      width: double.infinity,);
    }else if( photo != null ){
      return Image(
        image: photo?.path==null ? AssetImage('assets/img/pan.png') as ImageProvider :
          FileImage(photo),
        height: 140.0,
        width: double.infinity,
        fit: BoxFit.fill,);
    }else{
      return Image(
        image: photo?.path==null ? AssetImage('assets/img/pan.png') as ImageProvider :
          FileImage(photo),
        height: 140.0,
        width: double.infinity,
        fit: BoxFit.fill,);
    }
  }

  Widget _name() {
    return product.titulo!=null?Padding(
      padding: const EdgeInsets.all(5.0),
      child: Text(product.titulo,style:TextStyle(fontSize: 25,fontFamily: 'Microsoft Sans Serif'),),
    ):Padding(
      padding: const EdgeInsets.all(5.0),
      child: const Text('Pan integral',style:TextStyle(fontSize: 25,fontFamily: 'Microsoft Sans Serif'),),
    );
  }

  Widget _pricing() {
    return Container(
      height: 30, 
      width: 200,
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow:<BoxShadow>[
          BoxShadow(color: Colors.black12,blurRadius: 3.0,offset: Offset(0,2.0),spreadRadius: 0.5),
        ]
      ),
      child:Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(product.valor.toString(),style: TextStyle(color:Colors.blue[300],fontSize: 20),),
          SizedBox(
            width: 20,
          ),
          Text('10 unidades x bulto'),
        ],
      )
    );
  }

  Widget _counter() {
    return Row(
      children: [
        IconButton(
          iconSize: 30,
          icon: const Icon(Icons.remove_rounded),
          tooltip: 'quitar 1 unidad',
          onPressed: () {
            setState(() {
              if(amount > 0)amount -= 1;
            });
          },
        ),
        Text('$amount',style: TextStyle(fontSize: 20),),
        IconButton(
          iconSize: 30,
          icon: const Icon(Icons.add_rounded),
          tooltip: 'agregar 1 unidad',
          onPressed: () {
            setState(() {
              amount += 1;
            });
          },
        ),
      ],
    );
  }

  Widget _unitPricing() {
    return  Container(
      height: 20, 
      width: 130,
      margin: EdgeInsets.symmetric(horizontal:15.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow:<BoxShadow>[
          BoxShadow(color: Colors.black12,blurRadius: 3.0,offset: Offset(0,2.0),spreadRadius: 0.5),
        ]
      ),
      child:Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(product.valor.toString(),style: TextStyle(color:Colors.black,fontSize: 15),),
          SizedBox(
            width: 20,
          ),
          Text('Por unidad'),
        ],
      )
    );
  }

  Widget _addBtn() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary:  (Color(0xFF7AFF61)),
          fixedSize: Size(100,10),
          elevation: 2,
        ),
        child: const Text('Agregar', style: TextStyle(fontSize: 15),),
        onPressed: (){}, 
      ),
    );
  }
}

