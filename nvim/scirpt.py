class Book:
    def __init__(self, title, author, year):
        self.title = title
        self.author = author
        self.year = year

    def __str__(self):
        return f"'{self.title}' by {self.author} ({self.year})"

    def update_details(self, title=None, author=None, year=None):
        """Update book details."""
        if title:
            self.title = title  # comment title
        if author:
            self.author = author
        if year:
            self.year = year
        print(f"Updated details for '{self.title}': {self.author} ({self.year})")

    def get_details(self):
        """Return book details as a dictionary."""
        return {"title": self.title, "author": self.author, "year": self.year}

    def compare(self, other_book):
        """Compare two books based on their title."""
        if self.title == other_book.title:
            return "The books are the same."
        return f"The books are different: '{self.title}' vs '{other_book.title}'"


class Library:
    def __init__(self):
        self.books = []

    def add_book(self, book):
        self.books.append(book)
        print(f"Added: {book}")

    def remove_book(self, title):
        for book in self.books:
            if book.title.lower() == title.lower():
                self.books.remove(book)
                print(f"Removed: {book}")
                return
        print(f"Book with title '{title}' not found.")

    def search_book(self, title):
        found_books = [
            book for book in self.books if title.lower() in book.title.lower()
        ]
        if found_books:
            print(f"Books found for '{title}':")
            for book in found_books:
                print(book)
        else:
            print(f"No books found for '{title}'.")

    def show_all_books(self):
        if self.books:
            print()

            print("Library Collection:")
            for book in self.books:
                print(book)
        else:
            print("No books in the library yet.")


def main():
    # Creating a Library instance
    my_library = Library()

    # Creating some books
    book1 = Book("The Great Gatsby", "F. Scott Fitzgerald", 1925)
    book2 = Book("To Kill a Mockingbird", "Harper Lee", 1960)
    book3 = Book("1984", "George Orwell", 1949)

    # Adding books to the library
    my_library.add_book(book1)
    my_library.add_book(book2)
    my_library.add_book(book3)

    # Showing all books in the library
    my_library.show_all_books()

    # Searching for a book
    my_library.search_book("1984")

    # Removing a book
    my_library.remove_book("The Great Gatsby")

    # Showing updated library collection
    my_library.show_all_books()

    # Updating book details
    book3.update_details(author="Orwell", year=1950)

    # Get book details as a dictionary
    print(book3.get_details())

    # Comparing books
    comparison_result = book2.compare(book3)
    print(comparison_result)


if __name__ == "__main__":
    main()
