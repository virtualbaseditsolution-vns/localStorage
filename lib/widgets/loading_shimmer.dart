import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingShimmer extends StatelessWidget {
  final int? length;
  const LoadingShimmer({super.key, this.length=4});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      children: List.generate(length!, (index) => Shimmer.fromColors(
        baseColor: Colors.grey.shade200,
          highlightColor: Colors.grey.shade300,
          child: const Card(
            child: SizedBox(height: 100,width: 100,),
          ))),
    );
  }
}
