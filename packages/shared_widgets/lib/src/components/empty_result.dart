import 'package:flutter/material.dart';

class EmptyResult extends StatelessWidget {
  const EmptyResult({
    Key? key,
    this.message = 'Empty',
    this.retryButtonText = 'Refresh',
    this.onRetry,
  }) : super(key: key);

  final String message;

  final String retryButtonText;

  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(message),
          const SizedBox(height: 15),
          OutlinedButton(
            onPressed: onRetry,
            child: Text(retryButtonText),
          ),
        ],
      ),
    );
  }
}
