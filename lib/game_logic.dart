import 'dart:math';

class Player{
  static const x="x";
  static const o="o";
  static const empty=" ";
 static List <int>playerx=[ ];
  static List <int>playero=[ ];
}

extension ContainAll on List{
    bool containAll  (int x,int y,[  z]){
      if(z==null)
        return  contains(x)&& contains(y) ;
      else
    return  contains(x)&& contains(y)&&contains(z);
  }

}
class Game{
  void playgame(int index, String activeplayer) {
    if (activeplayer=="x")
      Player.playerx.add(index);
        else
      Player.playero.add(index);


  }
  CheckWinner(){
    String winner='';
    if(Player.playerx.containAll( 0,1,2)||
        Player.playerx.containAll( 3,4,5)||
        Player.playerx.containAll(6,7,8 )||
        Player.playerx.containAll( 0,3,6)||
        Player.playerx.containAll( 1,4,7)||
        Player.playerx.containAll( 2,5,8)||
        Player.playerx.containAll( 2,4,6)||
        Player.playerx.containAll( 1,4,8))winner='x';



    if(Player.playero.containAll( 0,1,2)||
        Player.playero.containAll( 3,4,5)||
        Player.playero.containAll(6,7,8 )||
        Player.playero.containAll( 0,3,6)||
        Player.playero.containAll( 1,4,7)||
        Player.playero.containAll( 2,5,8)||
        Player.playero.containAll( 2,4,6)||
        Player.playero.containAll( 1,4,8))winner='o';

    return winner;



  }

 Future<void> autoPlay( activePlayer)async {

   int index=0;
   List<int>emptyCell=[];
   for(var i =0;i<9;i++) {
     if (!(Player.playerx.isEmpty ||
         Player.playero.contains(index)))
       emptyCell.add(i);
   }
Random random=Random();
   int randomIndex=random.nextInt(emptyCell.length);
   index=emptyCell[randomIndex];
   //game.playgame(index, activeplayer);

     }





}