require 'csv'
task :addbook => :environment do
    
    CSV.foreach('/Users/bazilzainal/Documents/goodreads_library_export.csv', headers: true) do |row|
        Book.create!(row.to_hash)
    end
end




task :createbook => :environment do
    title = "When You Were Young"
    author = "The Killers"
    Book.create(title: title, author: author)
end