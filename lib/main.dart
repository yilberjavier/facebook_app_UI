import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 120,
              padding: EdgeInsets.only(
                  top: 30.0, left: 20.0, right: 20.0, bottom: 10.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(50.0)),
                      child: TextField(
                        decoration: InputDecoration(
                            hintText: 'Search',
                            border: InputBorder.none,
                            prefixIcon: Icon(Icons.search, color: Colors.grey)),
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  Icon(
                    Icons.camera_alt_rounded,
                    size: 30,
                  )
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            "Stories",
                            style: TextStyle(
                              color: Colors.grey[900],
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.2,
                            ),
                          ),
                          Text(
                            "See Archive",
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Container(
                        height: 180,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            makeStory(
                              storyImage: 'assets/images/story/post-1.jpg',
                              userImage: 'assets/images/story/p-1.jpg',
                              userName: 'Luiza Pottez',
                            ),
                            makeStory(
                              storyImage: 'assets/images/story/post-3.jpg',
                              userImage: 'assets/images/story/p-3.jpg',
                              userName: 'Martin Peres',
                            ),
                            makeStory(
                              storyImage: 'assets/images/story/post-2.jpg',
                              userImage: 'assets/images/story/p-4.jpg',
                              userName: 'Isabel Mendez',
                            ),
                            makeStory(
                              storyImage: 'assets/images/story/post-4.jpg',
                              userImage: 'assets/images/story/p-2.jpg',
                              userName: 'Rodrigo castro',
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 40),
                      makeFeed(
                        userName: 'Isabel Mendez',
                        userImage: 'assets/images/story/p-4.jpg',
                        feedTime: '1 hr ago',
                        feedText:
                            'Es un hecho establecido hace demasiado tiempo que un lector se distraerá con el contenido.',
                        feedImage: 'assets/images/story/post-2.jpg',
                      ),
                      makeFeed(
                        userName: 'Isabel Mendez',
                        userImage: 'assets/images/story/p-2.jpg',
                        feedTime: '1 hr ago',
                        feedText: 'Hay muchas variaciones de los pasajes de Lorem Ipsum disponibles, pero la mayoría sufrió alteraciones en alguna manera, ya sea porque se le agregó humor, o palabras aleatorias que no parecen ni un poco creíbles. Si vas a utilizar un pasaje de Lorem Ipsum, necesitás estar seguro de que no hay nada avergonzante escondido en el medio del texto.',
                        feedImage: '',
                      ),
                      makeFeed(
                        userName: 'Isabel Mendez',
                        userImage: 'assets/images/story/p-3.jpg',
                        feedTime: '1 hr ago',
                        feedText:
                            'Es un hecho establecido hace demasiado tiempo que un lector se distraerá con el contenido.',
                        feedImage: 'assets/images/story/post-3.jpg',
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

  // --------------------------------------------------------------------------------------///

  Widget makeStory({storyImage, userImage, userName}) {
    return AspectRatio(
      aspectRatio: 1.6 / 2,
      child: Container(
        margin: EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(storyImage),
          ),
        ),
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(
              begin: Alignment.bottomRight,
              colors: [
                Colors.black.withOpacity(.9),
                Colors.black.withOpacity(.1),
              ],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 2),
                  image: DecorationImage(
                    image: AssetImage(userImage),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Text(
                userName,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // --------------------------------------------------------------------------------------///

  Widget makeFeed({userImage, userName, feedTime, feedText, feedImage}) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(userImage),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        userName,
                        style: TextStyle(
                          color: Colors.grey[900],
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          letterSpacing: 1,
                        ),
                      ),
                      SizedBox(height: 3),
                      Text(
                        feedTime,
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  )
                ],
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.more_horiz, size: 30, color: Colors.grey[600]),
              ),
            ],
          ),
          SizedBox(height: 20),
          Text(
            feedText,
            style: TextStyle(
                fontSize: 15,
                color: Colors.grey[800],
                height: 1.5,
                letterSpacing: .7),
          ),
          SizedBox(height: 20),
          feedImage != '' ?
          Container(
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                  image: AssetImage(feedImage), fit: BoxFit.cover),
            ),
          ) : Container(),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  makeLike(),
                  Transform.translate(
                    offset: Offset(-5, 0),
                    child: makeLove(),
                  ),
                  SizedBox(width: 5),
                  Text(
                    '5.2K',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey[800],
                    ),
                  ),
                ],
              ),
              Text(
                '500 Comments',
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.grey[800],
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              makeLikeButton(isActive: true,),
              makeCommentButton(),
              makeShareButton(),
            ],
          ),
        ],
      ),
    );
  }

  // --------------------------------------------------------------------------------------///

  Widget makeLike() {
    return Container(
      width: 25,
      height: 25,
      decoration: BoxDecoration(
          color: Colors.blue,
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white)),
      child: Center(
        child: Icon(Icons.thumb_up, size: 12, color: Colors.white),
      ),
    );
  }

  Widget makeLove() {
    return Container(
      width: 25,
      height: 25,
      decoration: BoxDecoration(
          color: Colors.red,
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white)),
      child: Center(
        child: Icon(Icons.favorite, size: 12, color: Colors.white),
      ),
    );
  }

  // --------------------------------------------------------------------------------------///

  Widget makeLikeButton({isActive}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: BoxDecoration(
        border: Border.all(color: Color.fromARGB(255, 210, 208, 208)),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.thumb_up, color: isActive ? Colors.blue : Colors.grey, size: 20),
            SizedBox(width: 5),
            Text('Like', style: TextStyle(color: isActive ? Colors.blue : Colors.grey),),
          ],
        ),
      ),
    );
  }

  Widget makeCommentButton() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: BoxDecoration(
        border: Border.all(color: Color.fromARGB(255, 210, 208, 208)),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.chat, color: Colors.grey, size: 20),
            SizedBox(width: 5),
            Text(
              'Comment',
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }

  Widget makeShareButton() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: BoxDecoration(
        border: Border.all(color: Color.fromARGB(255, 210, 208, 208)),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.share, color: Colors.grey, size: 20),
            SizedBox(width: 5),
            Text(
              'Share',
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }

}
