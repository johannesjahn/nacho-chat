import 'package:flutter/widgets.dart';

class PostText extends StatelessWidget {
  final String text;

  const PostText({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(text),
    );
  }
}
