# lib/tasks/update_author_id_to_user_id.rake

namespace :db do
  desc "Update author_id to user_id in Book model"
  task update_author_id_to_user_id: :environment do
    Book.all.each do |book|
      book.update(user_id: book.author_id)
    end
    puts "Author_id updated to user_id in the Book model."
  end
end
