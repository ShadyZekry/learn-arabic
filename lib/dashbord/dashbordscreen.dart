import 'package:flutter/material.dart';
import 'alphabetmodel.dart';
import 'package:percent_indicator/percent_indicator.dart';

class Edition extends StatefulWidget {
  @override
  _EditionState createState() => _EditionState();
}

class _EditionState extends State<Edition> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "DashBord"
        ),
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body:GridView.count
        (
        crossAxisCount: 4,
        children: List.generate(letter.length, (index){
          return new Container(
            child: SelectCard(alphabet: letter[index]),
          );
        }),
      ),
        floatingActionButton: FloatingActionButton(
            onPressed: (){
              _ShowScoreDialog(context);
            },
            child: new Image.asset(
              "assets/images/coins.png",
              fit: BoxFit.contain,
            )
        ),
        backgroundColor: Color.fromRGBO(35, 114, 163,1)
    );
  }
}




////////////////////////
int sore=120;
//////score dialog//////////////

 _ShowScoreDialog(BuildContext context) {

   return showDialog(context: context,barrierDismissible: true, builder: (param){
     return AlertDialog(
       title: Text("Your score"),
       content: Column(
         mainAxisSize: MainAxisSize.min,
         children: <Widget>[
           Text(
             "$sore",
             style: TextStyle(
                 fontSize: 32,
                 fontWeight: FontWeight.bold
             ) ,
           )
         ],
       ),
       actions: <Widget>[
         FlatButton(
             onPressed: ()=>Navigator.pop(context),
             color: Colors.red,
             child: Text('OK')),
       ],

     );
   });

}

////grid view/////////
class SelectCard extends StatelessWidget {
  const SelectCard({Key key, this.alphabet}) : super(key: key);
  final Alphabet alphabet;


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: new Column(
          children:<Widget> [ //progressbar circular
            new CircularPercentIndicator(
              radius: 70.0,
              lineWidth: 10.0,
              animation: true,
              percent:double.parse(alphabet.id.toString())/2 , //number of right answers
              center: new Text(
                alphabet.title, //alphabet
                style:
                new TextStyle(fontWeight: FontWeight.bold, fontSize: 32.0,color:Colors.white),
              ),
              circularStrokeCap: CircularStrokeCap.round,
              progressColor:Color.fromRGBO(94, 186, 125,1),
            ),
          ],
        ),
      ),
    );
  }
}