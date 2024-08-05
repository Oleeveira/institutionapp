import 'package:flutter/material.dart';

class Gallery extends StatefulWidget {
  const Gallery({super.key});

  @override
  State<Gallery> createState() => _GalleryState();
}

List<String> imageUrls = [
    'https://placeimg.com/640/480/animals',
    'https://placeimg.com/640/480/arch',
    'https://placeimg.com/640/480/nature',
    'https://placeimg.com/640/480/people',
    'https://placeimg.com/640/480/tech',
    'https://placeimg.com/640/480/animals',
    'https://placeimg.com/640/480/arch',
    'https://placeimg.com/640/480/nature',
    'https://placeimg.com/640/480/people',
    'https://placeimg.com/640/480/tech',
    'https://placeimg.com/640/480/nature',
    'https://placeimg.com/640/480/people',
    'https://placeimg.com/640/480/tech',
    'https://placeimg.com/640/480/animals',
    'https://placeimg.com/640/480/arch',
    'https://placeimg.com/640/480/nature',
    'https://placeimg.com/640/480/people',
  ];


class _GalleryState extends State<Gallery> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(crossAxisCount: 3, childAspectRatio: 1.0, shrinkWrap: true,
          children: [Image.asset('donations.jpg')]);
  }
}