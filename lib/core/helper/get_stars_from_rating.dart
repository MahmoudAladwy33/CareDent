import 'package:flutter/material.dart';

List<Widget> getStarsFromRating(double rating, {double size = 16}) {
  List<Widget> stars = [];
  int fullStars = rating.floor();
  bool hasHalfStar = (rating - fullStars) >= 0.4 && (rating - fullStars) < 0.9;

  for (int i = 0; i < fullStars; i++) {
    stars.add(Icon(Icons.star, color: Colors.amber, size: size));
  }

  if (hasHalfStar) {
    stars.add(Icon(Icons.star_half, color: Colors.amber, size: size));
  }

  while (stars.length < 5) {
    stars.add(Icon(Icons.star_border, color: Colors.amber, size: size));
  }

  return stars;
}
