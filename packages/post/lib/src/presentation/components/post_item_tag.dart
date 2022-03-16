part of 'post_item.dart';

class _PostItemTag extends StatelessWidget {
  const _PostItemTag({
    Key? key,
    required this.tag,
    required this.onTagPressed,
  }) : super(key: key);

  final String tag;

  final void Function(String tag)? onTagPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onTagPressed?.call(tag),
      style: ElevatedButton.styleFrom(
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
      ),
      child: Text(tag),
    );
  }
}
