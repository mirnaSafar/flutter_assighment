import 'package:assignment_test/ui/views/fix_view/fix.dart';
import 'package:assignment_test/ui/views/items_view/items.dart';
import 'package:assignment_test/ui/views/login_view/login.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late PageController _pageController;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          bottom: TabBar(
            isScrollable: true,
            controller: _tabController,
            tabs: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.25,
                child: const Tab(
                  child: Text('Login'),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.25,
                child: const Tab(
                  child: Text('Items'),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.25,
                child: const Tab(
                  child: Text('Fix'),
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          physics: const AlwaysScrollableScrollPhysics(),
          children: [
            LoginTab(),
            const ItemsTab(),
            const FixTab(),
          ],
        ),
      ),
    );
  }
}
