import 'package:flutter/material.dart';

class MonPokemon extends StatelessWidget {
  const MonPokemon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center (
      child:Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey[200],
          border: Border.all(
                    color: Colors.black,
                    width: 1,
        )),
        width: MediaQuery.of(context).size.width * 0.40,
        height: MediaQuery.of(context).size.height * 0.30,
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text("Pikachu",
              style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20, fontFamily: 'Montserrat'),
            ))),
            Expanded(
              child: Image.asset('images/pikachu.png',
              width: 100,
             height: 100)
            )
            
          ],
        ),
      )
      );
  }
}
