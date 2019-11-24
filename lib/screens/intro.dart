import 'package:flutter/material.dart';
import 'package:mountain_ui/screens/home.dart';

class IntroScreen extends StatefulWidget {
  IntroScreen({Key key}) : super(key: key);

  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _buildHeadImage(),
            Container(
              margin: EdgeInsets.only(
                left: 16.0,
              ),
              alignment: Alignment.centerLeft,
              child: Text(
                'Trips',
                style: TextStyle(fontSize: 32, fontFamily: 'Crimson'),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 16.0, bottom: 16.0),
              alignment: Alignment.centerLeft,
              child: Text(
                'Mountain',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Crimson',
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(16.0),
              alignment: Alignment.centerLeft,
              child: Text(
                "Join Mountain Trip to wildest and most remote of famed Sevent Summits. Most amazing mountain experiences you'll ever have.",
                maxLines: 4,
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Crimson',
                  color: Colors.grey,
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(top: 16.0, left: 16.0),
              child: FlatButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => HomeScreen(),
                    ),
                  );
                },
                color: Color(0xFFB8627E),
                padding: EdgeInsets.all(12.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32.0),
                ),
                child: Container(
                  width: 120,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text(
                        'Get Started',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Crimson',
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeadImage() {
    return Container(
      margin: EdgeInsets.only(bottom: 16.0),
      height: MediaQuery.of(context).size.height * 0.50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(16.0),
          bottomRight: Radius.circular(16.0),
        ),
        image: DecorationImage(
          image: AssetImage('assets/images/mountain-bg.jpeg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(),
    );
  }
}
