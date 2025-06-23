import 'package:flutter/cupertino.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    /// This SliverFillRemaining widget is used to fill the remaining space
    /// From v3.29, widgets within this widget cannot be interacted with when `hasScrollBody` is set to true (default behavior).
    /// Or when `fillOverscroll` is set to false when `hasScrollBody` is false.
    /// The only combination that allows interaction is when `hasScrollBody` is false and `fillOverscroll` is true.
    /// It does not matter even when the child is not a scrollable widget as seen in [D]
    ///
    /// I also noticed the behavior changes when you comment out [A] and [B].
    return CupertinoApp(
      home: CupertinoPageScaffold(
        child: CustomScrollView(
          slivers: [
            /// [A]
            CupertinoSliverNavigationBar(largeTitle: Text('Home')),

            /// [B]
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Center(child: Text('Lorem ipsum', style: const TextStyle(fontSize: 20))),
              ),
            ),

            /// [C]
            SliverFillRemaining(
              // hasScrollBody: false,
              // fillOverscroll: true,
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32.0),
                child: Column(
                  children: [
                    for (var i = 0; i < 100; i++) ...[
                      Text('Item $i', style: const TextStyle(fontSize: 20)),
                      const SizedBox(height: 16),
                    ]
                  ],
                ),
              ),
            ),

            /// [D]
            // SliverFillRemaining(
            //   // hasScrollBody: false,
            //   // fillOverscroll: true,
            //   child: Center(child: Text('content', style: const TextStyle(fontSize: 20))),
            // ),
          ],
        ),
      ),
    );
  }
}
