class News {
  String title;
  String description;
  String image;
  int year;

  News({
    required this.title,
    required this.description,
    required this.image,
    required this.year,
  });
}

List<News> newsList = [
  News(
    title: 'Lorem ipsum',
    description: 'Lorem ipsumm',
    year: 2435,
    image: "images/download.jpg",
  ),
  News(
    title: 'Lorem ipsum',
    description: 'Lorem ipsumm',
    year: 435432,
    image: "images/img1.jpeg",
  ),
  News(
    title: 'Lorem ipsum',
    description: 'Lorem ipsumm',
    year: 4326,
    image: "images/img2.jpeg",
  ),
  News(
    title: 'Lorem ipsum',
    description: 'Lorem ipsumm',
    year: 1234,
    image: "images/download.jpg",
  ),
  News(
    title: 'Lorem ipsum',
    description: 'Lorem ipsumm',
    year: 43,
    image: "images/img1.jpeg",
  ),
  News(
    title: 'Lorem ipsum',
    description: 'Lorem ipsumm',
    year: 34,
    image: "images/img2.jpeg",
  ),
];
