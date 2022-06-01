import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AdaptiveText extends StatelessWidget {
  const AdaptiveText(
    this.text, {
    Key? key,
  }) : super(key: key);

  final String text;
  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      return SelectableText(text);
    }
    return Text(text);
  }
}
