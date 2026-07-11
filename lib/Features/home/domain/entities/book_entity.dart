import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';
part 'book_entity.g.dart';
@HiveType(typeId: 0)
class BookEntity extends Equatable {
  @HiveField(0)
  final String bookImage;
  @HiveField(1)
  final String bookTitle;
  @HiveField(2)
  final String bookId;
  @HiveField(3)
  final String authorName;
  @HiveField(4)
  final num price;
  @HiveField(5)
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
