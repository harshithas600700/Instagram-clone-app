import 'package:flutter/material.dart';
import 'package:insta_app/pages/profile_page.dart'; // Make sure path is correct

class DesktopLayout extends StatefulWidget {
  const DesktopLayout({super.key});

  @override
  State<DesktopLayout> createState() => _DesktopLayoutState();
}

class _DesktopLayoutState extends State<DesktopLayout> {
  int selectedPageIndex = 0; // 0= home, 1 = Profile

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // LEFT SIDEBAR
              Container(
                width: 250,
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Instagram',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Billabong',
                      ),
                    ),
                    const SizedBox(height: 30),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedPageIndex = 0;
                        });
                      },
                      child: navItem(Icons.home, 'Home', selectedPageIndex == 0),
                    ),
                    navItem(Icons.search, 'Search', false),
                    navItem(Icons.explore, 'Explore', false),
                    navItem(Icons.video_library, 'Reels', false),
                    navItem(Icons.message, 'Messages', false),
                    navItem(Icons.favorite_border, 'Notifications', false),
                    navItem(Icons.add_box_outlined, 'Create', false),

                    // Profile item - page swap 
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedPageIndex = 1;
                        });
                      },
                      child: navItem(Icons.person, 'Profile', selectedPageIndex == 1),
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 60),

              // CENTER CONTENT (HOME / PROFILE)
              Expanded(
                flex: 2,
                child: selectedPageIndex == 0 ? homeContent() : const ProfilePage(),
              ),

              const SizedBox(width: 60),

              // RIGHT SUGGESTIONS
              Container(
                width: 300,
                padding: const EdgeInsets.only(top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text('Harshitha 🌸', style: TextStyle(fontWeight: FontWeight.bold)),
                        Text('Switch', style: TextStyle(color: Colors.blue)),
                      ],
                    ),
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text('Suggested for you'),
                        Text('See All', style: TextStyle(color: Colors.blue)),
                      ],
                    ),
                    const SizedBox(height: 10),
                    suggestionTile('username65'),
                    suggestionTile('username886'),
                    suggestionTile('username5565'),
                    suggestionTile('username998'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget navItem(IconData icon, String label, bool selected) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          Icon(icon, size: 24, color: selected ? Colors.black : Colors.black),
          const SizedBox(width: 16),
          Text(
            label,
            style: TextStyle(
              fontSize: 16,
              color: selected ? Colors.black : Colors.black,
              fontWeight: selected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }

  Widget homeContent() {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        children: [
          // STORIES
          SizedBox(
            height: 100,
            child: Row(
              children: List.generate(6, (index) => storyBubble('assets/images/story.jpg')),
            ),
          ),
          const SizedBox(height: 30),

          // POSTS
          postCard('assets/images/post.jpg', 'username'),
          postCard('assets/images/post.jpg', 'username'),
          postCard('assets/images/post.jpg', 'username'),
        ],
      ),
    );
  }

  Widget storyBubble(String imagePath) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: ClipOval(
        child: Image.asset(imagePath, width: 60, height: 60, fit: BoxFit.cover),
      ),
    );
  }

  Widget postCard(String imagePath, String username) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          leading: CircleAvatar(backgroundImage: AssetImage(imagePath)),
          title: Text(username, style: const TextStyle(fontWeight: FontWeight.bold)),
          trailing: const Icon(Icons.more_vert),
        ),
        Image.asset(imagePath),
        const SizedBox(height: 10),
        Row(
          children: const [
            Icon(Icons.favorite_border),
            SizedBox(width: 10),
            Icon(Icons.comment),
            SizedBox(width: 10),
            Icon(Icons.send),
          ],
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget suggestionTile(String username) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          const CircleAvatar(radius: 20, backgroundColor: Colors.grey),
          const SizedBox(width: 12),
          Expanded(child: Text(username)),
          const Text('Follow', style: TextStyle(color: Colors.blue)),
        ],
      ),
    );
  }
}