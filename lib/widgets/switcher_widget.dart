import 'package:flutter/material.dart';

class SwitcherDemo extends StatefulWidget {
  const SwitcherDemo({super.key});

  @override
  State<SwitcherDemo> createState() => _SwitcherDemoState();
}

class _SwitcherDemoState extends State<SwitcherDemo> {
  bool _showFirst = true;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () => setState(() => _showFirst = !_showFirst),
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          transitionBuilder: (widget, animation) =>
              ScaleTransition(scale: animation, child: widget),
          child: _showFirst
              ? Container(
                  key: const ValueKey(1),
                  width: 150,
                  height: 150,
                  child: Image.network('https://s3.getstickerpack.com/storage/uploads/sticker-pack/shitpost-gifs/sticker_11.gif?e435dc30efb23e40bd62417271e319c9&d=200x200', fit: BoxFit.cover),
                  )
              : Container(
                  key: const ValueKey(2),
                  width: 150,
                  height: 150,
                  child: Image.network('https://media.tenor.com/cuov8Q1oUwYAAAAM/shitpost.gif', fit: BoxFit.cover),
                ),
        ),
      ),
    );
  }
}
