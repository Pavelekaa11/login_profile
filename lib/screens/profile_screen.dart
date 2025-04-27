import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isBlack = true; // true = background hitam, false = putih

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isBlack ? Colors.black : Colors.white,
      appBar: AppBar(
        title: Text('@EmperorXann', style: TextStyle(color: Colors.white70)),
        centerTitle: true,
        backgroundColor: isBlack ? Colors.black : Colors.white,
        actions: [
          IconButton(
            icon: Icon(Icons.menu, color: Colors.white),
            onPressed: () {
              print('Menu');
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10),
            bagian_profil(),
            SizedBox(height: 10),
            bagian_username(),
            SizedBox(height: 10),
            bagian_follower(),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  isBlack = !isBlack;
                });
              },
              child: Text('Ganti Background'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 10),
            bagian_edit(),
            SizedBox(height: 10),
            bagian_bio(),
            SizedBox(height: 10),
            bagian_tabmenu(),
            bagian_galeri(),
          ],
        ),
      ),
    );
  }

  CircleAvatar bagian_profil() {
    return CircleAvatar(
      radius: 50,
      backgroundImage: AssetImage('assets/profile.jpeg'),
    );
  }

  Text bagian_username() {
    return Text(
      '@nephthysx',
      style: TextStyle(
        color: isBlack ? Colors.white : Colors.black,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Row bagian_follower() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildFollowerInfo('123', 'Following'),
        SizedBox(width: 10),
        _buildFollowerInfo('456', 'Followers'),
        SizedBox(width: 10),
        _buildFollowerInfo('789', 'Likes'),
      ],
    );
  }

  Widget _buildFollowerInfo(String count, String label) {
    return Column(
      children: [
        Text(
          count,
          style: TextStyle(
            color: isBlack ? Colors.white60 : Colors.black87,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
        Text(
          label,
          style: TextStyle(color: isBlack ? Colors.white54 : Colors.black54),
        ),
      ],
    );
  }

  Row bagian_edit() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildEditButton('Edit Profil'),
        SizedBox(width: 5),
        _buildEditButton('Share Profile'),
        SizedBox(width: 5),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onPressed: () {},
          child: Icon(Icons.person_add_alt_1_outlined),
        ),
      ],
    );
  }

  ElevatedButton _buildEditButton(String label) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onPressed: () {},
      child: Text(label),
    );
  }

  Text bagian_bio() {
    return Text(
      'Wu shi Emperor Xann',
      style: TextStyle(color: isBlack ? Colors.grey[300] : Colors.black87),
    );
  }

  DefaultTabController bagian_tabmenu() {
    return DefaultTabController(
      length: 5,
      child: Column(
        children: [
          TabBar(
            indicatorColor: Colors.white,
            tabs: [
              Tab(icon: Icon(Icons.grid_on)),
              Tab(icon: Icon(Icons.lock_outline)),
              Tab(icon: Icon(Icons.repeat_outlined)),
              Tab(icon: Icon(Icons.bookmark_outline)),
              Tab(icon: Icon(Icons.favorite_border)),
            ],
          ),
        ],
      ),
    );
  }

  GridView bagian_galeri() {
    return GridView.count(
      crossAxisCount: 3,
      crossAxisSpacing: 3,
      mainAxisSpacing: 3,
      childAspectRatio: 2 / 3,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: List.generate(15, (index) {
        return Container(
          color: Colors.grey[800],
          alignment: Alignment.center,
        );
      }),
    );
  }
}
