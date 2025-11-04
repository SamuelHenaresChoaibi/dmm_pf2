import 'package:dmm_pf2/widgets/switcher_widget.dart';
import 'package:flutter/material.dart';
import 'package:dmm_pf2/widgets/carousel_view_widget.dart';

class WidgetPage extends StatelessWidget {
  WidgetPage({super.key});

  final TextStyle _textStyleAppBar = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  final TextStyle _textStyle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  final Color _screenPrimaryColor = Colors.deepPurple;
  final Color _backgroundColorScreen = Color.fromARGB(255, 53, 53, 53);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CAROUSEL / ANIMATED SWITCHER', style: _textStyleAppBar),
        backgroundColor: _screenPrimaryColor,
        centerTitle: true,
      ),
      backgroundColor: _backgroundColorScreen,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [_widgetsColumn()],
        ),
      ),
    );
  }

  Widget _widgetsColumn() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [_widgetCarousel(), SizedBox(height: 30), _widgetDrag()],
    );
  }

  Widget _widgetCarousel() {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.black26,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: _screenPrimaryColor, width: 2),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Carousel de Imágenes', style: _textStyle),
          const SizedBox(height: 10),
          const CarouselDemo(),
        ],
      ),
    );
  }

  Widget _widgetDrag() {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.black26,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: _screenPrimaryColor, width: 2),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Animated Switcher',
            style: _textStyle,
          ),
          const SizedBox(height: 10),
          const SwitcherDemo(),
        ],
      ),
    );
  }
}
