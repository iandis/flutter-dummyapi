import 'package:flutter/material.dart';
import 'package:post/post.dart';
import 'package:user/user.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Dummy API'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 150,
              child: ElevatedButton(
                onPressed: _navigateToPosts,
                child: const Text('Posts'),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: 150,
              child: ElevatedButton(
                onPressed: _navigateToUsers,
                child: const Text('Users'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToPosts() {
    Navigator.of(context).pushNamed(PostListViewRoute.name);
  }

  void _navigateToUsers() {
    Navigator.of(context).pushNamed(UserListByCreatedViewRoute.name);
  }
}
