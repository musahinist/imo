import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imo/src/feature/home/presentation/cubit/task_cubit.dart';
import 'package:reorderable_grid/reorderable_grid.dart';

import '../../../../product/router/router.dart';
import '../../../auth/presentation/bloc/auth/auth_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);
  static const routeName = '/home';
  @override
  Widget build(BuildContext context) {
    return BlocProvider<TaskCubit>(
        create: (_) => context.read<TaskCubit>()..getAllTask(),
        child: const _HomeBody());
  }
}

class _HomeBody extends StatelessWidget {
  const _HomeBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.router.navigate(const IdeaFormRoute());
        },
        child: const Icon(Icons.add),
      ),
      body: DefaultTabController(
        length: 3,
        initialIndex: 1,
        child: NestedScrollView(
          //  floatHeaderSlivers: true,
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverAppBar(
              pinned: true,
              toolbarHeight: 90,
              expandedHeight: 160,
              actions: [
                Column(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.settings),
                      onPressed: () {
                        context.router.navigate(const SettingsRoute());
                      },
                    ),
                  ],
                )
              ],
              elevation: 0.0,
              title: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(context.read<AuthBloc>().state.user!['email']),
                ],
              ),
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.parallax,
                background: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: const [
                      Text(
                        'Background',
                        style: TextStyle(fontSize: 24),
                      )
                    ],
                  ),
                ),
                stretchModes: const [StretchMode.fadeTitle],
              ),
              // bottom: PreferredSize(
              //   preferredSize: const Size.fromHeight(kToolbarHeight),
              //   child: Container(
              //     decoration: const BoxDecoration(
              //       color: Colors.white54,
              //       borderRadius: BorderRadius.vertical(
              //         top: Radius.circular(16),
              //       ),
              //     ),
              //     child: const TabBar(
              //       indicatorColor: Palette.primaryColor,
              //       tabs: [
              //         Tab(text: 'Home'),
              //         Tab(text: 'Profile'),
              //       ],
              //     ),
              //   ),
              // ),
            ),
            SliverAppBar(
              pinned: true,
              elevation: 0.0,
              toolbarHeight: kTextTabBarHeight,
              flexibleSpace: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(16),
                  ),
                ),
                child: const TabBar(
                  indicatorColor: Colors.black,
                  tabs: [
                    Tab(text: 'Planning'),
                    Tab(text: 'Ongoing'),
                    Tab(text: 'Completed'),
                  ],
                ),
              ),
            ),
            //    SliverPersistentHeader(
            //   delegate: MySliverPersistentHeaderDelegate(
            //     TabBar(
            //       tabs: [
            //         Tab(icon: Icon(Icons.flight)),
            //         Tab(icon: Icon(Icons.directions_transit)),
            //         Tab(icon: Icon(Icons.directions_car)),
            //       ],
            //     ),
            //   ),
            //   pinned: false,
            // ),
          ],
          body: const TabBarView(
            children: [
              _FavoritesGrid(),
              _FavoritesGrid(),
              _FavoritesGrid(),
            ],
          ),
        ),
      ),
    );
  }
}

class _FavoritesGrid extends StatefulWidget {
  const _FavoritesGrid({
    Key? key,
  }) : super(key: key);

  @override
  State<_FavoritesGrid> createState() => _FavoritesGridState();
}

class _FavoritesGridState extends State<_FavoritesGrid> {
  /// create a new list of data

  /// when the reorder completes remove the list entry from its old position
  /// and insert it at its new index

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskCubit, TaskState>(
      builder: (context, state) {
        return state.props.isNotEmpty
            ? ReorderableGridView.extent(
                onReorder: context.read<TaskCubit>().onReorder,
                maxCrossAxisExtent: 250,
                childAspectRatio: 1,
                proxyDecorator:
                    (Widget child, int index, Animation<double> animation) {
                  return Material(
                    elevation: 10,
                    color: Colors.transparent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    child: child,
                  );
                },
                children: state.tasks.map((task) {
                  /// map every list entry to a widget and assure every child has a
                  /// unique key
                  return GestureDetector(
                    key: ValueKey(task),
                    onTap: () {
                      context.read<TaskCubit>().setSelectedTask(task);
                      context.router.navigate(
                        TaskDetailRoute(task: task),
                      );
                    },
                    child: Card(
                      child: Center(
                        child: Text(task.title.toString()),
                      ),
                    ),
                  );
                }).toList(),
              )
            : const Center(child: CircularProgressIndicator());
      },
    );
  }
}
