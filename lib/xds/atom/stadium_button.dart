import 'package:flutter/material.dart';

class StadiumButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool shouldFillAllWidth;
  final bool isRelevant;

  const StadiumButton({
    Key? key,
    required this.text,
    this.onPressed,
    this.shouldFillAllWidth = false,
    this.isRelevant = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Theme.of(context).primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32.0),
          ),
        ),
        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: shouldFillAllWidth
              ? Container(
                  width: double.infinity,
                  child: Center(
                    child: _getText(context),
                  ),
                )
              : _getText(context),
        ),
      ),
    );
  }

  Widget _getText(BuildContext context) {
    if (isRelevant) {
      return Text(
        text.toUpperCase(),
        style: Theme.of(context).textTheme.button,
      );
    } else {
      return Text(
        text,
        style: Theme.of(context)
            .textTheme
            .bodyText1
            ?.copyWith(color: Colors.black54),
      );
    }
  }
}
