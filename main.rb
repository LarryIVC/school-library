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

puts 'Welcome to School Library App!'
loop do
  puts 'Please choose an option by number:'
  show_menu
  option = gets.chomp.to_i
  case option
  when 1
    puts 'List all books'
    App.new.list_all_books
  when 2
    puts 'List all people'
  when 3
    puts 'Create a person'
  when 4
    puts 'Create a book'
  when 5
    puts 'Create a rental'
  when 6
    puts 'List all rentals for a given person id'
  when 7
    puts 'Exit of the program...'
    break
  else
    puts 'Invalid option, please try again'
  end
  puts '======================================================='
end
