import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:image_stack/image_stack.dart';
import 'package:mountain_ui/models/mountain_model.dart';

class MountainDetails extends StatefulWidget {
  MountainDetails({Key key, this.mountain}) : super(key: key);

  final MountainItem mountain;

  @override
  _MountainDetailsState createState() => _MountainDetailsState();
}

class _MountainDetailsState extends State<MountainDetails> {
  MountainItem _item;

  List<String> _images = [
    'https://unsplash.com/photos/vR1oUgpe2LE',
    'https://unsplash.com/photos/P8prss71psk',
    'https://unsplash.com/photos/k1zy08Veleo',
  ];

  @override
  void initState() {
    super.initState();
    _item = widget.mountain;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

  Widget _buildAppBar() {
    return AppBar(
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      leading: Icon(Icons.menu, color: Colors.black),
    );
  }

  Widget _buildBody() {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(_item.imagePath),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              _buildAppBar(),
              Expanded(child: _buildInfoContainer()),
            ],
          ),
          _buildFavouriteIcon(),
        ],
      ),
    );
  }

  Widget _buildInfoContainer() {
    return Container(
      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.25),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(32.0),
          topRight: Radius.circular(32.0),
        ),
      ),
      child: _buildInfoContent(),
    );
  }

  Widget _buildFavouriteIcon() {
    return Positioned(
      top: MediaQuery.of(context).size.height * 0.33,
      right: 25,
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              offset: Offset(4, 8),
              color: Colors.grey.withOpacity(0.3),
              blurRadius: 5,
            ),
          ],
        ),
        child: Center(
          child: Icon(
            Icons.favorite,
            color: _item.isFavourited ? Colors.pinkAccent : Colors.grey,
          ),
        ),
      ),
    );
  }

  Widget _buildInfoContent() {
    return Container(
      margin: EdgeInsets.only(top: 32.0, left: 16.0, right: 16.0),
      child: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              _item.name,
              style: TextStyle(fontSize: 32.0, fontFamily: 'Crimson'),
            ),
          ),
          Container(
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.location_on,
                  size: 14,
                  color: Colors.grey,
                ),
                Text(
                  _item.location,
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 8.0),
            child: Row(
              children: <Widget>[
                RatingBar(
                  onRatingUpdate: (double value) {},
                  initialRating: _item.ratings,
                  allowHalfRating: true,
                  itemSize: 15,
                  itemBuilder: (context, _) {
                    return Icon(
                      Icons.star,
                      color: Colors.amber,
                    );
                  },
                ),
                Text(
                  _item.ratings.toString(),
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 16),
            child: Row(
              children: <Widget>[
                _buildStepper(),
                Container(
                  margin: EdgeInsets.all(8.0),
                  child: Icon(
                    AntDesign.clockcircleo,
                    color: Colors.grey,
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(8.0),
                  child: Text(
                    '5 days',
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 8.0, bottom: 8.0),
            child: Row(
              children: <Widget>[
                _buildImageList(),
                Container(
                  margin: EdgeInsets.all(8.0),
                  child: Text(
                    'Recommended',
                    style: TextStyle(
                      fontFamily: 'Crimson',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(top: 16.0, bottom: 16.0),
            child: Text(
              'Description',
              style: TextStyle(
                fontSize: 24,
                fontFamily: 'Crimson',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              _item.description,
              style: TextStyle(
                color: Colors.grey,
                fontFamily: 'Crimson',
                fontSize: 18.0,
              ),
            ),
          ),
          Spacer(flex: 1),
          Container(
            child: Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(4.0),
                  child: Text(
                    '\$ 350',
                    style: TextStyle(color: Color(0xFFB8627E), fontSize: 24.0),
                  ),
                ),
                Container(
                  // margin: EdgeInsets.all(4.0),
                  child: Text('/Package'),
                ),
                Spacer(),
                Container(
                  margin: EdgeInsets.all(8.0),
                  child: FlatButton(
                    onPressed: () {},
                    color: Color(0xFFB8627E),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32.0),
                    ),
                    child: Text(
                      'Book Now',
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Crimson',
                          color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImageList() {
    return Container(
      margin: EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 8.0),
      child: ImageStack(
        imageList: _images,
        imageCount: 3,
        totalCount: 33,
      ),
    );
  }

  Widget _buildStepper() {
    return Container(
      width: 100,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        color: Colors.grey.withOpacity(0.3),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          GestureDetector(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.all(4.0),
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                color: Colors.pink.withOpacity(0.1),
              ),
              child: Center(
                child: Text('-',
                    style: TextStyle(fontSize: 18, color: Colors.pink)),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(4.0),
            child: Text('5', style: TextStyle(fontSize: 18)),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.all(4.0),
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                color: Colors.pink.withOpacity(0.1),
              ),
              child: Center(
                child: Text('+',
                    style: TextStyle(fontSize: 18, color: Colors.pink)),
              ),
            ),
          )
        ],
      ),
    );
  }
}
