import 'package:flutter/material.dart';

class SelectableWidget extends StatefulWidget {
  const SelectableWidget({
    super.key,
    required this.builder,
    required this.onSizeChanged,
  });

  final Widget Function(BuildContext context, Size size) builder;
  final void Function(Size size) onSizeChanged;

  @override
  // ignore: library_private_types_in_public_api
  _SelectableWidgetState createState() => _SelectableWidgetState();
}

class _SelectableWidgetState extends State<SelectableWidget> {
  bool _isSelected = false;

  void _toggleSelection() {
    setState(() {
      _isSelected = !_isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleSelection,
      onLongPress: () {
        print('Long press');
      },
      onLongPressUp: () {
        print('Long press up');
      },
      child: Container(
        decoration: _isSelected
            ? BoxDecoration(
                border: Border.all(
                  color: Colors.blue,
                  width: 2,
                ),
              )
            : null,
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            widget.onSizeChanged(constraints.biggest);
            return widget.builder(context, constraints.biggest);
          },
        ),
      ),
    );
  }
}
