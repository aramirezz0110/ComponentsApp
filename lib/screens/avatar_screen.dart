import 'package:flutter/material.dart';

class AvatarScreen extends StatelessWidget {
  const AvatarScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Avatars"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: CircleAvatar(
              child: Text("SL"),
              backgroundColor: Colors.indigo[900],
            ),
          ),
        ],
      ),
      body: Center(
        child: CircleAvatar(
          maxRadius: 110,
          backgroundImage: NetworkImage(
              "https://cdnb.artstation.com/p/assets/images/images/028/619/171/large/rup_k-_arts-desmond-miles.jpg?15949884343"),
        ),
      ),
    );
  }
}
