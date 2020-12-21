import 'package:flutter/material.dart';
import 'dashbord/alphabetmodel.dart';

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
      child: new Card(
        elevation: 15.0,
        shadowColor: Colors.black,
        margin: EdgeInsets.all(10.0),
        //color: Colors.blue,
        color: Color.fromRGBO(44, 89, 211,.8),
        shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(20.0)
        ),
          child: new Column(
            children:<Widget> [
              Align(
                alignment: Alignment.center,
                child :new Text(alphabet.title,
                 textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 23.0,
                    color: Colors.white,
                  ),
              ),
            ),
              alphabet.id == 0? Icon(Icons.lock_open,color: Color.fromRGBO(254, 194, 0,1).withOpacity(.7))
               :Icon(Icons.lock,color: Color.fromRGBO(254, 194, 0,1).withOpacity(1)),
          ],
          ),
      ),
    );
  }

}