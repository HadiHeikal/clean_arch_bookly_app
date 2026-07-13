import 'package:bookly/Features/home/data/data_sources/home_local_data_source/home_local_data_source_impl.dart';
import 'package:bookly/Features/home/data/data_sources/home_remote_data_source/home_remote_data_source_impl.dart';
import 'package:bookly/Features/home/data/repo_impl/home_repo_impl.dart';
import 'package:bookly/core/services/api_service.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupServiceLocator(){
  // registerSingleton --> Api Service : create one instance
  getIt.registerSingleton<ApiService>(
    ApiService(),
  );

  // // registerSingleton --> HomeRepoImpl
  getIt.registerSingleton<HomeRepoImpl>(
    HomeRepoImpl(homeLocalDataSource: HomeLocalDataSourceImpl(), homeRemoteDataSource: HomeRemoteDataSourceImpl(ApiService())),
  );
}