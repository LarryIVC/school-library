require './person'
require './student'
require './teacher'
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
      print 'There are no books, press [return] to continue...'
      gets.chomp
    else
      @books.each_with_index do |book, index|
        puts "#{index} -> Title: #{book.title} - Author: #{book.author}"
      end
    end
  end

  def list_all_people
    if @people.empty?
      print 'There are no people, press [return] to continue...'
      gets.chomp
    else
      @people.each_with_index do |person, index|
        puts "#{index} -> #{person.class.name} ID: #{person.id} - Name: #{person.name} - Age: #{person.age}"
      end
    end
  end

  def create_person
    print 'Do you want to create a student (1) or a teacher (2) [Input the number]? '
    person_type = gets.chomp.to_i
    print 'Whats the name of the person: '
    name = gets.chomp
    print 'Whats the age of the person: '
    age = gets.chomp.to_i
    if person_type == 1
      print 'Has the parent permission? (y/n)'
      parent_permission = gets.chomp.downcase == 'y'
      person = Student.new(age, name, parent_permission: parent_permission)
      print 'Student '
    else
      print 'Specialization: '
      specialization = gets.chomp
      person = Teacher.new(age, specialization, name)
      print 'Teacher '
    end
    @people.push(person)
    print 'created successfully, press [return] to continue...'
    gets.chomp
  end

  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    book = Book.new(title, author)
    @books.push(book)
    print 'Book created successfully, press [return] to continue...'
    gets.chomp
  end

  def create_rental
    puts 'Select a book from the following list by number'
    list_all_books
    book_index = gets.chomp.to_i
    puts 'Select a person from the following list by number (not id)'
    list_all_people
    person_index = gets.chomp.to_i
    print 'Date: '
    date = gets.chomp
    rental = Rental.new(date, @people[person_index], @books[book_index])
    @rentals.push(rental)
    print 'Rental created successfully, press [return] to continue...'
    gets.chomp
  end

  def list_rentals_by_person_id
    print 'Please input the person id: '
    person_id = gets.chomp.to_i
    puts 'Rentals:'
    rentals = @rentals.select { |rental| rental.person.id == person_id }
    if rentals.empty?
      puts 'This person has no rentals'
    else
      rentals.each do |rental|
        puts "Date: #{rental.date} - Book: #{rental.book.title} by #{rental.book.author}"
      end
    end
    print 'Press [return] to continue...'
    gets.chomp
  end
end
