import 'package:flutter/material.dart';
import 'package:bottom_sheet/bottom_sheet.dart';

class SavingList {
  /// Bottom Sheet를 표시하는 함수
  static void showSavingListBottomSheet(BuildContext context) {
    showFlexibleBottomSheet<void>(
      context: context,
      minHeight: 0.4,
      initHeight: 0.5,
      maxHeight: 0.8,
      builder: (context, scrollController, _) {
        return _SavingList(scrollController: scrollController); //아래에서 리스트 부르는 함수 가져와서 쓰는 거
      },
      anchors: [0.4, 0.6, 0.8], // 고정 가능한 높이
    );
  }
}

/// Bottom Sheet 내부의 리스트를 표시하는 위젯
class _SavingList extends StatelessWidget {
  final ScrollController scrollController;

  const _SavingList({required this.scrollController, super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: const BorderRadius.vertical(top: Radius.circular(16.0)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          controller: scrollController,
          itemCount: 20, // 개수
          itemBuilder: (context, index) {
            return ListTile(
              leading: const Icon(Icons.money),
              title: Text('Saved Item $index'),
              subtitle: const Text('Subtitle for this item'),
            );
          },
        ),
      ),
    );
  }
}
