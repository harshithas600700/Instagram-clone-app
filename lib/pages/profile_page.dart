import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.4,
        title: Text(
          'username',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.add_box_outlined, color: Colors.black)),
          IconButton(onPressed: () {}, icon: Icon(Icons.menu, color: Colors.black)),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildProfileHeader(),
          _buildBioSection(),
          _buildProfileButtons(),
          _buildStoryHighlights(),
          Divider(),
          TabBar(
            controller: _tabController,
            indicatorColor: Colors.black,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            tabs: [
              Tab(icon: Icon(Icons.grid_on)),
              Tab(icon: Icon(Icons.video_collection_outlined)),
              Tab(icon: Icon(Icons.person_pin_outlined)),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildPostGrid(),
                _buildReelsTab(),
                _buildTaggedTab(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: AssetImage('assets/images/dp.jpg'),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildStatColumn('10', 'Posts'),
                _buildStatColumn('528', 'Followers'),
                _buildStatColumn('317', 'Following'),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildStatColumn(String count, String label) {
    return Column(
      children: [
        Text(count, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        SizedBox(height: 4),
        Text(label),
      ],
    );
  }

  Widget _buildBioSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Harshitha 🌸', style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 4),
          Text('bio goes here'),
          SizedBox(height: 4),
          Text(
            'www.harshithalink.com',
            style: TextStyle(color: Colors.blue),
          ),
          SizedBox(height: 12),
        ],
      ),
    );
  }

  Widget _buildProfileButtons() {
    return Padding(
  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
  child: Row(
    children: [
      Expanded(
        child: Container(
          height: 35,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey.shade300),
            color: Colors.grey.shade100,
          ),
          child: Center(child: Text("Edit profile", style: TextStyle(fontSize: 13))),
        ),
      ),
      SizedBox(width: 8),
      Expanded(
        child: Container(
          height: 35,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey.shade300),
            color: Colors.grey.shade100,
          ),
          child: Center(child: Text("Share profile", style: TextStyle(fontSize: 13))),
        ),
      ),
      SizedBox(width: 8),
      Container(
        height: 35,
        width: 35,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey.shade300),
          color: Colors.grey.shade100,
        ),
        child: Icon(Icons.person_add_alt, size: 18),
      ),
    ],
  ),
);
  }

  Widget _buildStoryHighlights() {
    return Container(
      height: 90,
      padding: EdgeInsets.only(top: 12, left: 12),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 28,
                  backgroundImage: AssetImage('assets/images/story.jpg'),
                ),
                SizedBox(height: 5),
                Text('Highlight', style: TextStyle(fontSize: 12)),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildPostGrid() {
    return GridView.builder(
      padding: EdgeInsets.zero,
      itemCount: 12,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 2,
        crossAxisSpacing: 2,
      ),
      itemBuilder: (context, index) {
        return Image.asset(
          'assets/images/post.jpg',
          fit: BoxFit.cover,
        );
      },
    );
  }

  Widget _buildReelsTab() {
    return Center(
      child: Text('Reels will be shown here', style: TextStyle(color: Colors.grey)),
    );
  }

  Widget _buildTaggedTab() {
    return Center(
      child: Text('Tagged posts will appear here', style: TextStyle(color: Colors.grey)),
    );
  }
}