import 'package:dio/dio.dart';
import 'api_error.dart';

class ApiException {

  // 1. SERVER / BACKEND ERROR HANDLER (Handles HTTP Status Codes)
  // =========================================================================
  // This method is ONLY called when the server successfully responds,
  // but rejects the request with a failure status code (e.g., 404, 500).
  static String extractErrorMessage(DioException error) {
    final statusCode = error.response?.statusCode;
    final data = error.response?.data;

    // STEP A: Check if the backend sent a custom error message inside the JSON body.
    // Example: { "status": "fail", "message": "Email already exists" }
    if (data is Map<String, dynamic>) {
      final message = data['message'];
      if (message != null) {
        return message.toString(); // Return the exact custom message from backend.
      }
    }

    // STEP B: Fallback to standard HTTP Status Code messages if no custom JSON message exists.
    switch (statusCode) {
      case 401:
        return 'Unauthorized: Please log in to continue'; // Missing or expired token.
      case 403:
        return 'Forbidden: You do not have permission';   // Authenticated, but restricted area.
      case 404:
        return 'Not Found: The requested resource could not be found'; // Invalid Endpoint / URL.
      case 500:
        return 'Internal Server Error: Something went wrong'; // Server crashed / DB error.
      case 503:
        return 'Service Unavailable: Server is down';       // Server is under maintenance.
      default:
        return 'Bad response: ${statusCode ?? "Unknown"}'; // Any other unhandled error code.
    }
  }

  // =========================================================================
  // 2. NETWORK / CLIENT ERROR HANDLER (Handles Connection Types)
  // =========================================================================
  // This is the main orchestrator (Factory method). It filters the error type
  // based on the device's network state and connection status.
  static ApiError handleError(DioException error) {
    switch (error.type) {
    // Group A: Device/Network timeout issues (Request never completed)
      case DioExceptionType.connectionTimeout:
        return ApiError(message: 'Connection timeout');
      case DioExceptionType.sendTimeout:
        return ApiError(message: 'Send timeout');
      case DioExceptionType.receiveTimeout:
        return ApiError(message: 'Receive timeout');

    // Group B: Client-side issues
      case DioExceptionType.cancel:
        return ApiError(message: 'Request cancelled'); // Developer manually cancelled the request.
      case DioExceptionType.connectionError:
        return ApiError(message: 'No internet connection'); // Device is offline / No internet.
      case DioExceptionType.badCertificate:
        return ApiError(message: 'Bad certificate');   // Security/SSL handshake handshake failure.
      case DioExceptionType.unknown:
        return ApiError(message: 'Something went wrong'); // Edge cases or unexpected formatting issues.

    // Group C: Successful connection, but Server rejected it!
      case DioExceptionType.badResponse:
      // Since the server responded, we delegate the error to 'extractErrorMessage'
      // to dig inside the response and find out WHY the server rejected it.
        return ApiError(
          message: extractErrorMessage(error),
          statusCode: error.response?.statusCode,
        );
    }
  }
}