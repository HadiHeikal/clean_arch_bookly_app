import 'package:equatable/equatable.dart';
class BookEntity extends Equatable {
  final String bookImage;
  final String bookTitle;
  final String bookId;
  final String authorName;
  final num price;
  final num rating;


  const BookEntity(
      {
        required this.bookImage,
        required this.bookTitle,
        required this.authorName,
        required this.price,
        required this.rating,
        required this.bookId
      });

  @override
  List<Object?> get props => [bookId, bookImage, bookTitle, authorName, price, rating];
}
