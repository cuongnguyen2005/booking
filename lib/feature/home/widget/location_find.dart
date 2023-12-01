import 'package:flutter/material.dart';

class LocationFind extends StatefulWidget {
  const LocationFind({super.key});

  @override
  State<LocationFind> createState() => _LocationFindState();
}

class _LocationFindState extends State<LocationFind> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      height: MediaQuery.of(context).size.height * 3 / 4,
      width: double.infinity,
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text('Chọn điểm đến'),
          ),
          // Flexible(
          //   child: ListView.builder(
          //     itemBuilder: (context, index) {
          //       return Container();
          //     },
          //   ),
          // )
        ],
      ),
    );
  }
}
