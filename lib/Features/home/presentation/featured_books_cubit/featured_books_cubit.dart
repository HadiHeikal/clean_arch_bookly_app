import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/Features/home/domain/use_cases/fetch_featured_books_use_case.dart';
import 'package:dartz_plus/dartz_plus.dart';
part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  final FetchFeaturedBooksUseCase featuredBooksUseCase ;
  FeaturedBooksCubit({required this.featuredBooksUseCase}) : super(FeaturedBooksInitial());

  Future<void> fetchFeaturedBook() async{
    // emit loading state
    emit(FeaturedBooksLoading());

    // call the featuredBooksUseCase and save the result at a variable [List<BookEntity>] or [Failure]
    var result = featuredBooksUseCase.call();
    result.fold(
      (failure) {
        emit(FeaturedBooksFailure(failure.message));
      },
      (booksList) {
        emit(FeaturedBooksSuccess(booksList));
      },
    );
  }
}
