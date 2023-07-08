require './app'

OPTIONS = [
  'List all books',
  'List all people',
  'Create a person',
  'Create a book',
  'Create a rental',
  'List all rentals for a given person id',
  'Exit'
].freeze

def show_menu
  OPTIONS.each_with_index do |option, index|
    puts "#{index + 1} - #{option}"
  end
end

my_app = App.new
puts 'Welcome to School Library App!'
loop do
  puts 'Please choose an option by number:'
  show_menu
  option = gets.chomp.to_i
  case option
  when 1
    puts 'List all books'
    my_app.list_all_books
  when 2
    puts 'List all people'
    my_app.list_all_people
  when 3
    puts 'Create a person'
    my_app.create_person
  when 4
    puts 'Create a book'
    my_app.create_book
  when 5
    puts 'Create a rental'
    my_app.create_rental
  when 6
    puts 'List all rentals for a given person id'
    my_app.list_rentals_by_person_id
  when 7
    puts 'Exit of the program...'
    puts 'Thanks for using School Library App!'
    break
  else
    puts 'Invalid option, please try again'
  end
  puts '======================================================='
end
