





import 'package:flutter/material.dart';




class ExpansionTitle extends StatefulWidget {

  final Widget title;
  final List<Widget> children;

  const ExpansionTitle({Key? key, required this.title, required this.children}) : super(key: key);

  @override
  _ExpansionTitleState createState() => _ExpansionTitleState();
}

class _ExpansionTitleState extends State<ExpansionTitle>  with SingleTickerProviderStateMixin {

  late AnimationController _controller;
  late Animation<double> animation;
  late Animation<double> rotationAnimation;


  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: const Duration(milliseconds: 500), vsync: this);
    animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.fastOutSlowIn,
    );
    rotationAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.fastOutSlowIn,
    );

    if (_isExpanded) {
      _controller.value = 1.0;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleTap() {
    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        _controller.forward();
      } else {
        _controller.reverse().then<void>((void value) {
          if (!mounted)
            return;
          setState(() {
            // Rebuild without widget.children.
          });
        });
      }
      PageStorage.of(context)?.writeState(context, _isExpanded);
    });
  }


  @override
  Widget build(BuildContext context) {

    final bool closed = !_isExpanded && _controller.isDismissed;

    return    AnimatedBuilder(
        animation: _controller,
        builder: (BuildContext context, Widget? child) {
        return Column(
          children: [
            TextButton(
              style: TextButton.styleFrom(
                  primary: Colors.black,
                  padding: const EdgeInsets.all(0),
                  minimumSize: const Size(0,0),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap
              ),
              onPressed: _handleTap,
              child: Row(
                children: [
                  const Expanded(child: SizedBox()),
                  Expanded(
                      flex: 8,
                      child: widget.title),
                   Expanded(child:  RotationTransition(
                       turns: Tween(begin: -0.25, end: 0.0).animate(_controller),
                      child: const Icon(Icons.arrow_drop_down_outlined,)))

                ],
              ),
            ),
            SizeTransition(
              axisAlignment: 1.0,
              sizeFactor: animation,
              child: Container(
                color: Colors.white,
                child: Column(
                  children: widget.children,
                ),
              ),
            )
          ],

        );
      }
    );
  }
}

