import 'package:flutter/material.dart';
import '../identify_utility.dart';
import '../models/identify_task.dart';

class IdentifyTaskTile extends StatelessWidget {
  final IdentifyTask? task;
  IdentifyTaskTile(this.task);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(bottom: 12),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
           color: Colors.red,
        ),
        child: Row(children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image(
                    image: Utility.imageFromBase64String(task?.photo??"").image,
                    alignment: Alignment.center,
                ),
                const SizedBox(
                  height: 8,
                ),
                const SizedBox(
                  height: 8,
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }

}