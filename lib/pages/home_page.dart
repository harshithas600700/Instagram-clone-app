import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: SizedBox(
          child: Image.network(
            'https://upload.wikimedia.org/wikipedia/commons/thumb/2/2a/Instagram_logo.svg/800px-Instagram_logo.svg.png?20160616034027',
            height: 53,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0.4,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.favorite_border),
            iconSize: 28,
          ),
          SizedBox(width: 15),
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              'assets/icons/dm.svg',
              height: 25,
              width: 25,
            ),
          ),
          SizedBox(width: 10),
        ],
      ),

      body: ListView(
        children: [
          // STORIES
          SizedBox(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 8),
              itemCount: 10,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 10),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 28,
                        backgroundImage: AssetImage('assets/images/story.jpg'),
                      ),
                      SizedBox(height: 5),
                      Text('user$index', style: TextStyle(fontSize: 12)),
                    ],
                  ),
                );
              },
            ),
          ),

          Divider(),

          // POST
          buildPost(
            username: "username0",
            userDp: "assets/images/dp.jpg",
            postImage: "assets/images/post.jpg",
            caption: "caption for the post",
            likedBy: "user123",
          ),

          buildPost(
            username: "username1",
            userDp: "assets/images/dp.jpg",
            postImage: "assets/images/post.jpg",
            caption: "caption for the second post",
            likedBy: "user456",
          ),
        ],
      ),
    );
  }

  Widget buildPost({
    required String username,
    required String userDp,
    required String postImage,
    required String caption,
    required String likedBy,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Post header
        ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage(userDp),
          ),
          title: Text(username),
          trailing: Icon(Icons.more_vert),
        ),

        // Post image
        Image.asset(
          postImage,
          fit: BoxFit.cover,
          width: double.infinity,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              height: 300,
              color: Colors.grey[300],
              child: Center(
                child: Text(
                  'Unable to load post image',
                  style: TextStyle(color: Colors.black54),
                ),
              ),
            );
          },
        ),

        // Post icons
        Row(
          children: [
            IconButton(icon: Icon(Icons.favorite_border), onPressed: () {}),
            IconButton(icon: Icon(Icons.chat_bubble_outline), onPressed: () {}),
            IconButton(icon: Icon(Icons.send), onPressed: () {}),
            Spacer(),
            IconButton(icon: Icon(Icons.bookmark_border), onPressed: () {}),
          ],
        ),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Text("Liked by $likedBy and others"),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          child: RichText(
            text: TextSpan(
              text: '$username ',
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              children: [
                TextSpan(
                  text: caption,
                  style: TextStyle(fontWeight: FontWeight.normal),
                )
              ],
            ),
          ),
        ),
        SizedBox(height: 15),
      ],
    );
  }
}