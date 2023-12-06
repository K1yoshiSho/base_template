import 'package:flutter/material.dart';

/// This class is used to wrap a widget and keep it alive even when not in the view hierarchy.
/// This is achieved by extending StatefulWidget and implementing `AutomaticKeepAliveClientMixin`.
class KeepAliveWidgetWrapper extends StatefulWidget {
  // Constructor for the widget wrapper, takes in a builder function and a key.
  const KeepAliveWidgetWrapper({
    Key? key,
    required this.builder,
  }) : super(key: key);

  // The builder function that returns the widget that needs to be kept alive.
  final WidgetBuilder builder;

  // Creates the state object for the StatefulWidget and also initializes the AutomaticKeepAliveClientMixin.
  @override
  State<KeepAliveWidgetWrapper> createState() => _KeepAliveWidgetWrapperState();
}

// The state object for KeepAliveWidgetWrapper which implements the AutomaticKeepAliveClientMixin.
class _KeepAliveWidgetWrapperState extends State<KeepAliveWidgetWrapper> with AutomaticKeepAliveClientMixin {
  // Override the wantKeepAlive method from AutomaticKeepAliveClientMixin to return true, so that the widget stays alive.
  @override
  bool get wantKeepAlive => true;

  // The build method for the wrapped widget. Calls the builder function and returns the built widget.
  @override
  Widget build(BuildContext context) {
    super.build(context); // Call super build first.
    return widget.builder(context);
  }
}
