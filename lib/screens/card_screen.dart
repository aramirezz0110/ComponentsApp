import 'package:flutter/material.dart';
import 'package:flutter_components/widgets/widgets.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text("Card Screen"),
          ),
        ),
        body: ListView(
          padding: const EdgeInsets.symmetric(
              horizontal: 20, vertical: 10), //margenes
          children: const [
            CustomCardType1(),
            SizedBox(
              height: 10,
            ),
            CustomCardType2(
              imageUrl:
                  "https://photographylife.com/wp-content/uploads/2017/01/What-is-landscape-photography.jpg",
              name: "Paisaje 1",
            ),
            SizedBox(
              height: 10,
            ),
            CustomCardType2(
              imageUrl:
                  "https://pcpimpz.com/wp-content/uploads/2020/01/travel-landscape-01.jpg",
              name: "Paisaje 2",
            ),
            SizedBox(
              height: 10,
            ),
            CustomCardType2(
              imageUrl:
                  "https://www.becomeabetterphotographer.co.uk/wp-content/uploads/2014/05/landscape-focusing2.jpg",
              name: "Paisaje 3",
            ),
            SizedBox(
              height: 100,
            ),
          ],
        ));
  }
}
