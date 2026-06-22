import 'package:flutter/material.dart';
import 'home_remote_data_source.dart';
import 'package:bookly/core/services/api_service.dart';
import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import '../../../../../core/constants/strings.dart';
import '../../models/book_model/book_model.dart';

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource{
  final ApiService apiService ;
  HomeRemoteDataSourceImpl(this.apiService);

  // helper method to extract list of books from Api
  List<BookEntity> getBooksList(Map<String,dynamic> data){
    List<BookEntity> booksModelsList = [] ;
    for(var bookItem in data['items']){
      booksModelsList.add(BookModel.fromJson(bookItem));
    }
    return booksModelsList ;
  }

  // fetch Featured Books from api as a list List<BookEntity> models
  @override
  Future<List<BookEntity>> fetchFeaturedBooks() async{
    try{
      var data = await apiService.get(searchFeaturedBooksEndpoint);
      List<BookEntity> booksList = getBooksList(data);
      return booksList;
    } catch (e){
      debugPrint(e.toString());
      rethrow;
    }
  }

  // fetch Newest Books from api as a list List<BookEntity> models
  @override
  Future<List<BookEntity>> fetchNewestBooks() async{
    try{
      var data = await apiService.get(searchFreeNewestBooksEndpoint);
      List<BookEntity> booksList = getBooksList(data);
      return booksList;
    } catch (e){
      debugPrint(e.toString());
      rethrow;
    }
  }
}
