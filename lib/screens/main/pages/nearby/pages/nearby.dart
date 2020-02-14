import 'package:flutter/material.dart';
import 'package:mexyou/screens/main/pages/nearby/widgets/card.dart';

class NearbyPage extends StatefulWidget {
  @override
  _NearbyPageState createState() => _NearbyPageState();
}

class _NearbyPageState extends State<NearbyPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: List.generate(
        10,
        (index) => Container(
          margin: EdgeInsets.only(bottom: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(2, (index) => CoupleCard()),
          ),
        ),
      ),
    );
  }
}
