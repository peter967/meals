import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../controller/providers/providers.dart';
import '../web_view.dart';

class ItemBuilder extends ConsumerWidget {
  const ItemBuilder({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(mealProvider);
    return data.when(data: (data) {
      return Padding(
        padding: EdgeInsets.all(8.0.h),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return WebViewScreen(
                          url: data.youTube,
                        );
                      },
                    ),
                  );
                },
                child: Card(
                  elevation: 5,
                  shadowColor: Colors.amber,
                  child: Column(
                    children: [
                      Text(
                        data.meal,
                        style: TextStyle(
                          fontSize: 20.sp,
                          color: Colors.amber,
                        ),
                      ),
                      SizedBox(
                        height: 7.h,
                      ),
                      Row(
                        children: [
                          Image.network(
                            data.image,
                            width: 150.w,
                            height: 150.h,
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            children: [
                              Text(
                                data.category,
                                style: TextStyle(
                                    fontSize: 15.sp, color: Colors.blue),
                              ),
                              Text(
                                data.area,
                                style: TextStyle(
                                    fontSize: 20.sp, color: Colors.red),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 100.h,
              ),
              TextButton.icon(
                  onPressed: () {
                    ref.refresh(mealProvider);
                  },
                  icon: const Icon(
                    Icons.refresh,
                    color: Colors.amber,
                  ),
                  label: const Text('refresh'))
            ],
          ),
        ),
      );
    }, error: (e, s) {
      return const SizedBox();
    }, loading: () {
      return const CircularProgressIndicator(
        color: Colors.amber,
      );
    });
  }
}
