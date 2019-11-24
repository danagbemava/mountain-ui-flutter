import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:mountain_ui/models/mountain_model.dart';
import 'package:mountain_ui/screens/mountain_details.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<MountainItem> carouselItems = [
    MountainItem(
        name: 'Alaskan Mountains',
        imagePath: 'assets/images/mountain1.jpeg',
        ratings: 4.5,
        isFavourited: false,
        location: 'Alaska'),
    MountainItem(
        name: 'Mt. Fuji, Hakone',
        imagePath: 'assets/images/mountain2.jpeg',
        ratings: 4.5,
        isFavourited: false,
        location: 'Hakone, Japan'),
    MountainItem(
        name: 'N.Mountain India',
        imagePath: 'assets/images/mountain3.jpeg',
        ratings: 3.5,
        isFavourited: false,
        location: 'Himalayas, India'),
    MountainItem(
        name: 'Everest, Himalayas',
        imagePath: 'assets/images/mountain4.jpeg',
        ratings: 4.5,
        isFavourited: true,
        location: 'Himalayas, India'),
  ];

  List<MountainItem> cardListItems = [
    MountainItem(
      name: 'Alaskan Mountains',
      imagePath: 'assets/images/mountain1.jpeg',
      ratings: 4.5,
      isFavourited: false,
      description:
          'Join a full-day guided tour from Tokyo that travels to Mt Fuji Ropeway',
      location: 'Alaska',
    ),
    MountainItem(
      name: 'Mt. Fuji, Hakone',
      imagePath: 'assets/images/mountain2.jpeg',
      ratings: 4.5,
      isFavourited: false,
      description:
          'Join a full-day guided tour from Tokyo that travels to Mt Fuji Ropeway',
      location: 'Hakone, Japan',
    ),
    MountainItem(
      name: 'N.Mountain India',
      imagePath: 'assets/images/mountain3.jpeg',
      ratings: 3.5,
      isFavourited: false,
      description:
          'Join a full-day guided tour from Tokyo that travels to Mt Fuji Ropeway',
      location: 'Himalayas, India',
    ),
    MountainItem(
      name: 'Everest, Himalayas',
      imagePath: 'assets/images/mountain4.jpeg',
      ratings: 4.5,
      isFavourited: true,
      description:
          'Join a full-day guided tour from Tokyo that travels to Mt Fuji Ropeway',
      location: 'Himalayas, India',
    ),
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      child: Scaffold(
        appBar: _buildAppBar(),
        body: _buildBody(),
        bottomNavigationBar: _buildBottomNavigationBar(),
      ),
      length: 5,
    );
  }

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(
            Entypo.grid,
            color: Colors.grey,
          ),
          title: Text(''),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Feather.bar_chart_2,
            color: Colors.grey,
          ),
          title: Text(''),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Feather.search,
            color: Colors.grey,
          ),
          title: Text(''),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            AntDesign.user,
            color: Colors.grey,
          ),
          title: Text(''),
        ),
      ],
    );
  }

  Widget _buildAppBar() {
    return AppBar(
      leading: Icon(
        Icons.menu,
        color: Colors.black,
      ),
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      title: Text(
        'Discover',
        style:
            TextStyle(fontFamily: 'Crimson', color: Colors.black, fontSize: 24),
      ),
      actions: <Widget>[
        Container(
          height: 24,
          width: 36,
          margin: EdgeInsets.only(right: 8.0, top: 8.0, bottom: 8.0),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                offset: Offset(4.0, 4.0),
                color: Colors.grey[300],
                blurRadius: 3.0,
              ),
            ],
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.white, width: 2.0),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/images/mountain1.jpeg'),
            ),
          ),
        ),
      ],
      bottom: _buildBottom(),
    );
  }

  Widget _buildBottom() {
    return TabBar(
      isScrollable: true,
      labelColor: Color(0xFF5B66C2),
      unselectedLabelColor: Colors.grey,
      indicatorColor: Colors.transparent,
      tabs: <Widget>[
        Tab(
          text: 'Popular',
        ),
        Tab(
          text: 'Feature',
        ),
        Tab(
          text: 'Asia',
        ),
        Tab(
          text: 'Europe',
        ),
        Tab(
          text: 'Africa',
        )
      ],
    );
  }

  Widget _buildBody() {
    return Container(
      margin: EdgeInsets.only(top: 8.0),
      child: CustomScrollView(
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate(
              [
                _builCarouselSlider(),
                _buildDotsIndicator(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildTitle('Recommended'),
                    FlatButton(
                      onPressed: () {},
                      child: Text(
                        'View All',
                        style: TextStyle(color: Colors.grey),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          SliverList(
            delegate:
                SliverChildBuilderDelegate((BuildContext context, int index) {
              var item = cardListItems[index];
              return _buildMountainListCard(item);
            }, childCount: cardListItems.length),
          ),
        ],
      ),
    );
  }

  Widget _buildDotsIndicator() {
    return Container(
      alignment: Alignment.topCenter,
      child: DotsIndicator(
        position: double.parse(_currentIndex.toString()),
        dotsCount: carouselItems.length,
        axis: Axis.horizontal,
        decorator: DotsDecorator(
          color: Colors.pink.withOpacity(0.3),
          activeColor: Color(0xFFB8627E),
          size: const Size.square(9.0),
          activeSize: const Size(36.0, 9.0),
          activeShape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
        ),
      ),
    );
  }

  Widget _buildTitle(String title) {
    return Container(
      margin: EdgeInsets.only(left: 16.0, top: 8.0, bottom: 8.0, right: 8.0),
      child: Text(
        title,
        style: TextStyle(
          fontFamily: 'Crimson',
          fontSize: 24,
        ),
      ),
    );
  }

  Widget _builCarouselSlider() {
    return CarouselSlider(
      height: 200,
      enableInfiniteScroll: false,
      onPageChanged: (index) {
        setState(() {
          _currentIndex = index;
        });
      },
      items: carouselItems.map((f) {
        return Builder(builder: (BuildContext context) {
          return Container(
            height: 200,
            width: 500,
            margin: EdgeInsets.only(right: 8.0, top: 8.0, bottom: 8.0),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(f.imagePath),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    width: 32,
                    height: 32,
                    margin: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(32.0),
                      color: Colors.white.withOpacity(0.4),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.favorite,
                        size: 18,
                        color: f.isFavourited ? Colors.pinkAccent : Colors.grey,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(4.0),
                  child: ListTile(
                    title: Text(
                      f.name,
                      style: TextStyle(color: Colors.white),
                    ),
                    subtitle: Container(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          RatingBar(
                            onRatingUpdate: (double value) {},
                            initialRating: f.ratings,
                            allowHalfRating: true,
                            itemSize: 15,
                            itemBuilder: (context, _) {
                              return Icon(
                                Icons.star,
                                color: Colors.amber,
                              );
                            },
                          ),
                          Text(f.ratings.toString()),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
      }).toList(),
    );
  }

  Widget _buildMountainListCard(MountainItem item) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => MountainDetails(
              mountain: item,
            ),
          ),
        );
      },
      child: Card(
        margin: EdgeInsets.only(left: 16.0, right: 16.0, top: 8.0, bottom: 8.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                alignment: Alignment.topLeft,
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  image: DecorationImage(
                    image: AssetImage(item.imagePath),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width - 160,
                margin: EdgeInsets.only(left: 8.0, right: 8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(child: Text(item.name)),
                        Container(
                          child: Icon(
                            Icons.favorite,
                            color: item.isFavourited
                                ? Colors.pinkAccent
                                : Colors.grey,
                            size: 16,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      child: Row(
                        children: <Widget>[
                          RatingBar(
                            onRatingUpdate: (double value) {},
                            initialRating: item.ratings,
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
                            item.ratings.toString(),
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 8.0, bottom: 8.0),
                      child: Text(
                        item.description,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontFamily: 'Crimson',
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
