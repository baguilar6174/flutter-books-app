import 'package:books_app/app/ui/pages/book_detail/book_detail_page.dart';
import 'package:books_app/app/ui/routes/routes.dart';
import 'package:flutter/widgets.dart' show Widget, BuildContext;

Map<String, Widget Function(BuildContext)> get routes => {
  
  Routes.HOME : (BuildContext context) => const BookDetailPage(),
  
};