// Entity => contains data that i want to represent it.
// Models => contains all data of the API.
class BookEntity {
  final String title;
  final String image;
  final String autherName;
  // num => accept double and integer
  final num price;
  final num rate;

  BookEntity(
      {required this.title,
      required this.image,
      required this.autherName,
      required this.price,
      required this.rate});
}
