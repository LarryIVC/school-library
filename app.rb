# Create a app.rb file that will serve as your console app entry-point. It should have methods that do the following:
# List all books.
# List all people.
# Create a person (teacher or student, not a plain Person).
# Create a book.
# Create a rental.
# List all rentals for a given person id.
require './person'
require './book'
require './rental'

class App
  def initialize
    @people = []
    @books = []
    @rentals = []
  end

  def list_all_books
    if @books.empty?
      puts 'There are no books, press [return] to continue...'
      gets.chomp
    else
      @books.each_with_index do |book, index|
        puts "#{index} - #{book.title} - #{book.author}"
      end
    end
  end
end
