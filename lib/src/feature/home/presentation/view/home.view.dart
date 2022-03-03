import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imo/src/router/router.dart';
import 'package:reorderable_grid/reorderable_grid.dart';

import '../bloc/home_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);
  static const routeName = '/';
  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeBloc>(
      create: (context) => HomeBloc(),
      child: const _HomeBody(),
    );
  }
}

class _HomeBody extends StatefulWidget {
  const _HomeBody({
    Key? key,
  }) : super(key: key);

  @override
  State<_HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<_HomeBody> {
  /// create a new list of data
  final items = List<int>.generate(4, (index) => index);

  /// when the reorder completes remove the list entry from its old position
  /// and insert it at its new index
  void _onReorder(int oldIndex, int newIndex) {
    setState(() {
      final item = items.removeAt(oldIndex);
      items.insert(newIndex, item);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              context.router.navigate(const SettingsRoute());
            },
          )
        ],
      ),
      body: ReorderableGridView.extent(
        onReorder: _onReorder,
        maxCrossAxisExtent: 250,
        childAspectRatio: 1,
        proxyDecorator: (Widget child, int index, Animation<double> animation) {
          return Material(
            elevation: 10,
            color: Colors.transparent,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            child: child,
          );
        },
        children: items.map((item) {
          /// map every list entry to a widget and assure every child has a
          /// unique key
          return Card(
            key: ValueKey(item),
            child: Center(
              child: Text(item.toString()),
            ),
          );
        }).toList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //  context.read<HomeBloc>().add(const AddItemEvent());
          context.router.navigate(const IdeaFormRoute());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
