import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class CustomList extends StatefulWidget {
  final List<Widget> children;
  final Future<void> Function() onLoadMore;
  final bool hasMore;

  const CustomList({
    super.key,
    required this.children,
    required this.onLoadMore,
    this.hasMore = true,
  });

  @override
  CustomListState createState() => CustomListState();
}

class CustomListState extends State<CustomList> {
  final RefreshController _refreshController = RefreshController();

  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      enablePullDown: false,
      enablePullUp: widget.hasMore,
      controller: _refreshController,
      onLoading: () async {
        await widget.onLoadMore();
        _refreshController.loadComplete();
        if (!widget.hasMore) {
          _refreshController.loadNoData();
        }
      },
      child: ListView.builder(
        itemCount: widget.children.length + 1,
        itemBuilder: (context, index) {
          if (index == widget.children.length) {
            return widget.hasMore ? const Center(child: CircularProgressIndicator()) : Container();
          }
          return widget.children[index];
        },
      ),
    );
  }
}