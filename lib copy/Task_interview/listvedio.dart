

import 'package:flutter/material.dart';

class VideoList extends StatelessWidget {
  final List<String> videoUrls = [
    'https://www.youtube.com/embed/XGSy3_Czz8k',
    'https://www.youtube.com/embed/aDSO5l5r_ZE',
    'https://www.youtube.com/embed/Z1BCujX3pw8',
    // Add more video URLs here
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: videoUrls.length,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.all(10),
          child: Card(
            child: InkWell(
              onTap: () {
                // Handle video tap here
              },
              child: Column(
                children: [
                  AspectRatio(
                    aspectRatio: 16 / 9,
                    child: Image.network(
                      'https://i.ytimg.com/vi/${videoUrls[index]}/hqdefault.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Video ${index + 1}',
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}