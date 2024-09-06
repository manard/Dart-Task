import 'c1.dart'; // Import the file containing the Book class and any other necessary code
import 'dart:io';

List<Book> books = []; //List of Book to store Book info in it

void main() {
  Library lib = Library();
  int? num; //this variable to use it in case
  do {
    print(
        'Choose what u want to do?\n 1-Add Book \n 2-Print Books  \n 3-Search Book\n 4-Remove Book\n 5-check out Book\n 6-Return Book\n 7-exit');
    String? input = stdin.readLineSync();
    num = int.tryParse(input ?? '');

    switch (num) {
      case 1:
        {
          lib.addBook();
          break;
        }
      case 2:
        {
          lib.printBooks();
          break;
        }

      case 3:
        {
          print('Enter ISBN:');
          String? isbnInput = stdin.readLineSync();
          int? isbn = int.tryParse(isbnInput ?? '');
          if (lib.findBook(isbn) != null) {
            print("Book Found:  ${lib.findBook(isbn)}");
          } else {
            print("Book not found");
          }

          break;
        }

      case 4:
        {
          lib.removeBook();
          break;
        }

      case 5:
        {
          print('Enter ISBN:');
          String? isbnInput = stdin.readLineSync();
          int? isbn = int.tryParse(isbnInput ?? '');
          lib.CheckoutBook(isbn);

          break;
        }
      case 6:
        {
          print('Enter ISBN:');
          String? isbnInput = stdin.readLineSync();
          int? isbn = int.tryParse(isbnInput ?? '');
          lib.returnBook(isbn);

          break;
        }
      case 7:
        {
          print('Exit');
          break;
        }
    }
  } while (num != 7);
}

class Library {
  void addBook() {
    //this method to Add Book into List
    print('Enter Book Title:');
    String? title = stdin.readLineSync();
    print('Enter Author:');
    String? author = stdin.readLineSync();
    print('Enter ISBN:');
    String? isbnInput = stdin.readLineSync();
    int isbn = int.tryParse(isbnInput ?? '') ?? 0;
    print('Is the book available? (yes/no):');
    String? isAvailableInput = stdin.readLineSync();
    bool isAvailable = (isAvailableInput?.toLowerCase() == 'yes');

    if (title != null && author != null && isbnInput != null) {
      Book b = Book.withDetails(title, author, isbn, isAvailable);
      if (!books.contains(b)) {
        books.add(b);
        print('Book added successfully!');
      } else {
        print('Book already exists in the list.');
      }
    } else {
      print('Invalid input. Please provide all details.');
    }
  }

  void printBooks() {
    //this method to print all Books in Library
    if (books.isEmpty) {
      print('No books available.');
    } else {
      for (var book in books) {
        print(
            'Title: ${book.title}, Author: ${book.author}, ISBN: ${book.isbn}, isAvalible: ${book.isAvailable}');
      }
    }
  }

  void removeBook() {
    //this method to remove Book from Library
    if (books.isEmpty) {
      print('There is no Books to delete');
    } else {
      print('Enter ISBN:');
      String? isbnInput = stdin.readLineSync();
      int isbn = int.tryParse(isbnInput ?? '') ?? 0;
      Book b = Book.withISBN(isbn);
      books.removeWhere((book) => book.isbn == isbn);
    }
  }

  Book? findBook(isbn) {
    //this method to Search for a book
    if (books.isEmpty) {
      print('There is no Books in Lib');
    } else {
      for (var element in books) {
        if (element.isbn == isbn) {
          return element;
        }
      }
      return null;
    }
  }

  CheckoutBook(isbn) {
    //this method To mark a book as borrowed.
    if (books.isEmpty) {
      print('There is no Books in Lib');
    } else {
      for (var element in books) {
        if (element.isbn == isbn) {
          element.isAvailable = false;
          print('Book borrowed successfully!');
        }
      }
    }
  }

  returnBook(isbn) {
    //this method To mark a book as returned
    if (books.isEmpty) {
      print('There is no Books in Lib');
    } else {
      for (var element in books) {
        if (element.isbn == isbn) {
          if (element.isAvailable == false) {
            element.isAvailable = true;
            print('The book has been returned successfully!');
          }
        }
      }
    }
  }
}
