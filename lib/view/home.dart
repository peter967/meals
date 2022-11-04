import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controller/providers/providers.dart';
import 'shared/item_builder.dart';

class Home extends ConsumerStatefulWidget {
  const Home({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  @override
  void initState() {
    super.initState();
    connectivityCheck();
  }

  Future connectivityCheck() async {
    await Connectivity().checkConnectivity();
  }

  @override
  Widget build(BuildContext context) {
    final data = ref.watch(mealProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'M e a l s',
            style: TextStyle(
              shadows: [
                Shadow(
                  color: Colors.white,
                  blurRadius: 10,
                ),
              ],
            ),
          ),
        ),
      ),
      body: data.when(
        data: (data) {
          return StreamBuilder<ConnectivityResult>(
            stream: Connectivity().onConnectivityChanged,
            builder: (context, snapshot) {
              return snapshot.data == ConnectivityResult.none
                  ? Center(child: Image.asset('asset/animation.gif'))
                  : const ItemBuilder();
            },
          );
        },
        error: (e, s) {
          return Center(
            child: Text(e.toString()),
          );
        },
        loading: () {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.amber,
            ),
          );
        },
      ),
    );
  }
}
