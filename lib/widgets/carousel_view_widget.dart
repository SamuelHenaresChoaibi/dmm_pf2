import 'package:flutter/material.dart';

class CarouselDemo extends StatelessWidget {
  const CarouselDemo({super.key});

  static Widget buildCarousel() {
    return CarouselView.weighted(
      flexWeights: const [1,15,1],
      scrollDirection: Axis.horizontal,
      consumeMaxWeight: true,
      children: [
        Image.network('https://i.pinimg.com/1200x/03/de/bc/03debce3b8b4d14c7e49ec896fba1f85.jpg', fit: BoxFit.cover),
        Image.network('https://i.pinimg.com/1200x/62/3a/25/623a256d442de56072095a27030606d4.jpg', fit: BoxFit.cover),
        Image.network('https://i.pinimg.com/1200x/f6/13/78/f613783d8f65c6dc04a6636865aa8cc7.jpg', fit: BoxFit.cover),
        Image.network('https://i.pinimg.com/1200x/5a/38/54/5a3854b99a8f7780c46f664d9d5abd64.jpg', fit: BoxFit.cover),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: buildCarousel(),
    );
  }
}
