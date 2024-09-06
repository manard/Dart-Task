void main() {}

class Book {
  String? title, author;
  int? isbn;
  bool? isAvailable;

  Book(); // Default constructor

  Book.withDetails(String title, String author, int isbn, bool isAvailable) {
    this.title = title;
    this.author = author;
    this.isbn = isbn;
    this.isAvailable = isAvailable;
  }

  Book.withISBN(int isbn) {
    this.isbn = isbn;
  }

  @override
  String toString() {
    return 'Book: $title, Author: $author, ISBN: $isbn';
  }
}
