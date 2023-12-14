import 'package:flutter/material.dart';

class PartialLoadingStateWidget extends StatelessWidget {
  const PartialLoadingStateWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black.withOpacity(0.35),
      child: const Center(
        child: CircularProgressIndicator(
          color: Colors.white,
        ),
      ),
    );
  }
}
