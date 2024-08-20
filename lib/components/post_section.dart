import 'package:flutter/cupertino.dart';

import '../models/post.dart';
import 'post_card.dart';

class PostSection extends StatelessWidget {
  final List<Post> posts;

  const PostSection({
    super.key,
    required this.posts,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 16.0, bottom: 8.0),
            child: Text(
              'Friend\'s Activity',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          ListView.separated(
            primary: false,
            shrinkWrap: true,
            // Must have to avoid infinite height
            scrollDirection: Axis.vertical,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: posts.length,
            itemBuilder: (context, index) {
              return PostCard(post: posts[index]);
            },
            separatorBuilder: (context, index) {
              return const SizedBox(height: 5);
            },
          )
        ],
      ),
    );
  }
}
