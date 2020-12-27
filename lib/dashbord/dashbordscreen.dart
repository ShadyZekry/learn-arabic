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
      body:GridView.count
        (
        crossAxisCount: 4,
        children: List.generate(letter.length, (index){
          return new Container(
            child: SelectCard(alphabet: letter[index]),
          );
        }),
      ),
    );
  }
}


////////////////////////


class SelectCard extends StatelessWidget {
  const SelectCard({Key key, this.alphabet}) : super(key: key);
  final Alphabet alphabet;


  @override
  Widget build(BuildContext context) {
    return Center(
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
              new TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0),
            ),
            circularStrokeCap: CircularStrokeCap.round,
            progressColor: Colors.blue,
          ),
        ],
      ),
    );
  }

}