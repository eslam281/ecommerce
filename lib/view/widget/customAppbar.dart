import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget {
  final String titleAppbar;
  final void Function() onPressedIconFavorite;
  final void Function() onPressedSearch;
  final void Function(String)? onChanged;
  final TextEditingController myController;
  const CustomAppbar({super.key, required this.titleAppbar, required this.onPressedSearch, required this.onPressedIconFavorite, this.onChanged, required this.myController});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Expanded(child: TextFormField(
        onChanged:onChanged,controller:myController ,
        decoration: InputDecoration(
            hintText:titleAppbar,
            hintStyle:const TextStyle(fontSize:18),
            border:OutlineInputBorder(borderSide:BorderSide.none
                ,borderRadius:BorderRadius.circular(15)),
            prefixIcon:IconButton(onPressed: onPressedSearch, icon:const Icon(Icons.search))
            ,fillColor:Colors.grey[200],filled:true),
      ),
      ),

      const SizedBox(width: 10,),


      const SizedBox(width: 10,),

      Container(padding:const EdgeInsets.symmetric(vertical:15),decoration:BoxDecoration(
          borderRadius:BorderRadius.circular(15),color:Colors.grey[200]
      ),width: 60,
        child:IconButton(onPressed:onPressedIconFavorite,
            icon:Icon(Icons.favorite_border_outlined,
              size:35,color:Colors.grey[600],)),)
    ],);
  }
}
