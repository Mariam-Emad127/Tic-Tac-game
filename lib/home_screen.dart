import 'dart:core';
import 'package:flutter/material.dart';
import 'package:tictac/game_logic.dart';
import 'package:tictac/game_logic.dart';

import 'game_logic.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  String activeplayer = 'x';
  bool gameover = false;
  int turn = 0;
  String result = '';
  Game game = Game();
  bool isSwith = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: Column(
          children: [
            SwitchListTile.adaptive(
                title: const Text(
                  "turn on/off",
                  style: TextStyle(color: Colors.white),
                ),
                value: isSwith,
                onChanged: (bool newv) {
                  setState(() {
                    isSwith = newv;
                  });
                }),
            Text(
              "it's $activeplayer turn",
              style: TextStyle(color: Colors.white, fontSize: 55),
              textAlign: TextAlign.center,
            ),
            Text("xxxxxxxxxxx",
                style: TextStyle(color: Colors.white, fontSize: 30)),
            Expanded(
                child: GridView.count(

                  padding:const EdgeInsets.all(16),
                      mainAxisSpacing : 8.0,
                      crossAxisSpacing : 8.0,
                      childAspectRatio : 1.0,
                      crossAxisCount: 3,
                  children:List.generate(9, (index) => InkWell(
                    onTap:gameover?null: ()=> _onTap(index)   ,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(26)
                        ,color: Colors.black
                      ),
                      child:Center(
                        child:   Text(
                          Player.playerx.contains(index)?
                            "x":
                            Player.playero.contains(index)?
                            "o":
                             "",
                            style: TextStyle(
                             color: Colors.white , fontSize: 55)
                        ),
                      ),

                    ),
                  ),
                    ),

                  ),
                  ),


            ElevatedButton.icon(
              onPressed: () {
                setState(() {
                  Player.playerx=[];
                  Player.playero=[];
                  activeplayer = 'x';
                  gameover = false;
                  turn = 0;
                  result = '';
                });
              },
              icon: Icon(Icons.replay),
              label: const Text("repeat the game"),
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(Theme.of(context).splashColor),
                //  backgroundColor:Theme.of(context).splashColor
              ),
            ),
Text( 'its ${game.CheckWinner()} is winner ',style: TextStyle(color: Colors.teal, fontSize: 55) ,)
          ],
        ),
      ),
    );
  }

  _onTap(int index)async {
    if((Player.playerx.isEmpty||
        !Player.playerx.contains(index))&&
    (Player.playero.isEmpty||
        !Player.playero.contains(index))){
      game.playgame(index,activeplayer);
     UpdateSetState( );
     if(isSwith&&gameover){
       await game.autoPlay(activeplayer);
     }
  }
}
  void UpdateSetState(){
    setState(() {
      activeplayer=(activeplayer=='x')?'o' :'x';
      String winnerPlayer=game.CheckWinner();
      if(winnerPlayer==null) {
        result = '$winnerPlayer is winer';
      }
      else{result='it\s Drow';}

    });
  }
}
