import 'package:flutter/material.dart';

class ProfileCard extends StatefulWidget {
  final String name;
  final String email;
  final String imageUrl;
  final String bio;

  const ProfileCard({
    super.key,
    required this.name,
    required this.email,
    required this.imageUrl,
    required this.bio,
  });

  @override
  State<ProfileCard> createState() => _ProfileCardState();
}

class _ProfileCardState extends State<ProfileCard> {
  int _postsCount = 24;
  int _followersCount = 1200;
  int _followingCount = 456;

  void _incrementPosts() {
    setState(() {
      _postsCount++;
    });
  }

  void _incrementFollowers() {
    setState(() {
      _followersCount++;
    });
  }

  void _incrementFollowing() {
    setState(() {
      _followingCount++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(widget.imageUrl),
              child: widget.imageUrl.isEmpty
                  ? const Icon(Icons.person, size: 50)
                  : null,
            ),
            const SizedBox(height: 16),
            Text(
              widget.name,
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              widget.email,
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(color: Colors.grey[600]),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            Text(
              widget.bio,
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildStatItem(
                  'Posts',
                  _postsCount.toString(),
                  _incrementPosts,
                ),
                _buildStatItem(
                  'Followers',
                  _followersCount.toString(),
                  _incrementFollowers,
                ),
                _buildStatItem(
                  'Following',
                  _followingCount.toString(),
                  _incrementFollowing,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatItem(String label, String value, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Text(
            value,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Text(label, style: TextStyle(fontSize: 12, color: Colors.grey[600])),
          const SizedBox(height: 4),
          Icon(
            Icons.add_circle_outline,
            size: 16,
            color: Theme.of(context).primaryColor,
          ),
        ],
      ),
    );
  }
}
