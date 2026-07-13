import 'package:flutter_dotenv/flutter_dotenv.dart';
final String baseUrl = "https://www.googleapis.com/books/v1/";
final String apiKey = dotenv.env['BOOKS_API_KEY'] ?? "";

final String searchFreeNewestBooksEndpoint =
    "/volumes?Filtering=free-ebooks&orderBy=newest&q=programming&key=$apiKey";

final String searchFeaturedBooksEndpoint =
    "/volumes?Filtering=free-ebooks&q=programming&key=$apiKey";

final String searchBestSellerBooksEndpoint =
    "/volumes?Filtering=free-ebooks&orderBy=relevance&q=fiction&key=$apiKey";

final String searchTopRatedBooksEndpoint =
    "/volumes?Filtering=free-ebooks&maxResults=40&q=subject:science&key=$apiKey";

String searchSimilarBooksEndpoint(String query, {int maxResults = 10}) {
  final encodedQuery = Uri.encodeQueryComponent(query);
  return "/volumes?Filtering=free-ebooks&orderBy=relevance&maxResults=$maxResults&q=$encodedQuery&key=$apiKey";
}

const kFeaturedBooksBox = 'featured_box';
const kNewestBooksBox = 'newest_box';