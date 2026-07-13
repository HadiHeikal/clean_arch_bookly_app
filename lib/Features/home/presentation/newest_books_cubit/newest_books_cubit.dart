import 'package:bloc/bloc.dart';
import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/Features/home/domain/use_cases/fetch_newest_books_use_case.dart';
import 'package:dartz_plus/dartz_plus.dart';
import 'package:meta/meta.dart';

part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  final FetchNewestBooksUseCase fetchNewestBooksUseCase ;
  NewestBooksCubit({required this.fetchNewestBooksUseCase}) : super(NewestBooksInitial());

  Future<void> fetchNewestBooks() async{
    emit(NewestBooksLoading());
    // call the newestBooksUseCase and save the result at a variable [List<BookEntity>] or [Failure]
    var result = fetchNewestBooksUseCase.call();
    result.fold(
      (failure) {
        emit(NewestBooksFailure(failure.message));
      },
      (booksList) {
        emit(NewestBooksSuccess(booksList));
      },
    );
  }
}
