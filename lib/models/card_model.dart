class CardModel {
  final String title;
  final String description;
  bool isBookmarked;

  CardModel({
    required this.title,
    required this.description,
    this.isBookmarked = false,
  });
}
