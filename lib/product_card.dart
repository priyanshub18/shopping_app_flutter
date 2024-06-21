import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String title;
  final double price;
  final String image;
  final int idx ;
  const ProductCard({
    super.key,
    required this.title,
    required this.price,
    required this.image,
    required this.idx,
  }
      
  );
      

  

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(16),
      decoration:  BoxDecoration(
        borderRadius: BorderRadius.circular(20) ,
        color: idx % 2 ==  1 ? const Color.fromRGBO(216, 240, 253, 1) : Colors.white,
      ),

      
      child:  Column(
        
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title , style: Theme.of(context).textTheme.titleMedium,),
          const SizedBox(height: 5,),
          Text("\$$price" ,style: Theme.of(context).textTheme.bodySmall,),
          const SizedBox(height: 5,),
          Center(
            child: Image(
              height: 175,
              image: AssetImage(image),
            ),
          ),
      
      
      
      
        ],),
    );
  }
}